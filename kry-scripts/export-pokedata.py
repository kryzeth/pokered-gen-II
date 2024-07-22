import os
import re
import json

# Define file paths relative to the script's location
script_dir = os.path.dirname(os.path.realpath(__file__))
base_stats_path = os.path.join(script_dir, '../data/pokemon/base_stats/')
evos_moves_path = os.path.join(script_dir, '../data/pokemon/evos_moves.asm')
export_path = os.path.join(script_dir, 'pokedata/')

# Create export directory if it doesn't exist
os.makedirs(export_path, exist_ok=True)

def parse_base_stats_file(filepath):
    pokemon_name = os.path.splitext(os.path.basename(filepath))[0].upper()
    learnset = []
    tmhm_moves = []
    base_stats = {}
    types = set()  # Use a set to avoid duplicates
    
    with open(filepath, 'r') as file:
        lines = file.readlines()
        tmhm_lines = []
        in_tmhm_block = False

        for line in lines:
            line = line.strip()  # Strip leading and trailing whitespace

            # Parsing level 1 learnset
            if "; level 1 learnset" in line:
                move_line = line.split("db")[1].split(';')[0].strip()
                moves = move_line.split(",")
                for move in moves:
                    move = move.strip()
                    if move and move != "NO_MOVE":
                        learnset.append((1, move))
            
            # Start of TM/HM block
            if line.lower().startswith('tmhm'):
                # print(f"TM/HM block start found: {line}")  # Debug line
                in_tmhm_block = True
                tmhm_lines.append(line.split('tmhm', 1)[1].strip())
                continue  # Skip to next line

            # End of TM/HM block
            if in_tmhm_block and '; end' in line:
                # print(f"TM/HM block end found: {line}")  # Debug line
                in_tmhm_block = False
                tmhm_lines.append(line.split(';')[0].strip())
                tmhm_data = ' '.join(tmhm_lines)
                moves = [move.strip().replace('\\ ', '') for move in tmhm_data.split(',') if move.strip()]
                tmhm_moves.extend(moves)
                tmhm_lines = []  # Reset the tmhm_lines list
                continue  # Skip to next line

            # Collect lines within the TM/HM block
            if in_tmhm_block:
                tmhm_lines.append(line.split('tmhm', 1)[1].strip() if 'tmhm' in line else line)
            
            # Parsing base stats
            if line.startswith('db'):
                # Check if the line contains exactly 5 numbers
                parts = line.split(';')[0].strip()
                if parts.startswith('db'):
                    values = parts[2:].strip().split(',')
                    values = [val.strip() for val in values if val.strip()]
                    if len(values) == 5:
                        try:
                            hp, atk, def_, spd, spc = map(int, values)
                            # Print debug statement with detected values
                            # print(f"Detected values for {pokemon_name}: HP={hp}, Attack={atk}, Defense={def_}, Speed={spd}, Special={spc}")
                            base_stats = {
                                'HP': hp,
                                'Attack': atk,
                                'Defense': def_,
                                'Speed': spd,
                                'Special': spc
                            }
                        except ValueError:
                            print(f"Error parsing base stats from line: {line}")

            # Parsing type information
            if line.startswith('db') and '; type' in line:
                # print(f"Type info line found: {line}")  # Debug line
                type_line = line.split('db')[1].split(';')[0].strip()
                types.update(type.strip() for type in type_line.split(',') if type.strip())
    
    return pokemon_name, learnset, tmhm_moves, base_stats, list(types)

def parse_evos_moves_file(filepath):
    evos_moves = {}
    evolutions = {}  # New dictionary to store evolutions
    current_pokemon = None
    pattern = re.compile(r'(\w+)EvosMoves:')

    with open(filepath, 'r') as file:
        lines = file.readlines()
        reading_learnset = False
        reading_evolutions = False
        
        for line in lines:
            line = line.strip()  # Strip leading and trailing whitespace
            
            # Match lines of the format xxxEvosMoves:
            match = pattern.match(line)
            if match:
                current_pokemon = match.group(1).upper()
                evos_moves[current_pokemon] = []
                evolutions[current_pokemon] = []
                reading_learnset = False
                reading_evolutions = False
                continue
            
            # Check for the start of the Learnset section
            if "; Learnset" in line:
                reading_learnset = True
                continue
            
            # Check if we are reading the Learnset section
            if reading_learnset:
                if line.startswith('db'):
                    parts = line.split(',')
                    if len(parts) > 1:
                        level_str = parts[0].split()[1].strip()
                        move = parts[1].strip()
                        try:
                            level = int(level_str)
                            if level != 0:  # Only add moves with level != 0
                                evos_moves[current_pokemon].append((level, move))
                            else:
                                reading_learnset = False  # End of Learnset section
                        except ValueError:
                            pass  # Ignore lines with invalid level format
            
            # Check for the start of the Evolutions section
            if "; Evolutions" in line:
                reading_evolutions = True
                continue

            # Check if we are reading the Evolutions section
            if reading_evolutions:
                if line.startswith('db'):
                    parts = line.split(',')
                    if len(parts) >= 2:
                        evolve_type = parts[0].split()[1].strip()
                        if evolve_type == "EVOLVE_LEVEL":
                            level = int(parts[1].strip())
                            result = parts[2].strip()
                            evolutions[current_pokemon].append({
                                "method": "LEVEL",
                                "level": level,
                                "result": result
                            })
                        elif evolve_type == "EVOLVE_TRADE":
                            result = parts[2].strip()  # Ignore the second part (always 1)
                            evolutions[current_pokemon].append({
                                "method": "TRADE",
                                "result": result
                            })
                        elif evolve_type == "EVOLVE_ITEM":
                            item = parts[1].strip()
                            result = parts[3].strip()  # Skip the third part (always 1)
                            evolutions[current_pokemon].append({
                                "method": "ITEM",
                                "item": item,
                                "result": result
                            })
    
    return evos_moves, evolutions

def main():
    # Parse base stats files
    base_stats_files = [os.path.join(base_stats_path, f) for f in os.listdir(base_stats_path) if f.endswith('.asm')]
    base_stats_data = {}

    for filepath in base_stats_files:
        pokemon_name, learnset, tmhm_moves, base_stats, types = parse_base_stats_file(filepath)
        base_stats_data[pokemon_name] = {
            "level_up_learnset": learnset,
            "tmhm_moves": tmhm_moves,
            "base_stats": base_stats,
            "types": types,
            "evolutions": []
        }
    
    # Parse evos moves file
    evos_moves_data, evolutions_data = parse_evos_moves_file(evos_moves_path)

    # Update base stats data with evos moves data
    for pokemon, moves in evos_moves_data.items():
        if pokemon in base_stats_data:
            base_stats_data[pokemon]["level_up_learnset"].extend(moves)
        else:
            base_stats_data[pokemon] = {
                "level_up_learnset": moves,
                "tmhm_moves": [],
                "base_stats": {},
                "types": [],
                "evolutions": []
            }
    # Add evolutions data to base stats data
    for pokemon, evolutions in evolutions_data.items():
        if pokemon in base_stats_data:
            base_stats_data[pokemon]["evolutions"] = evolutions
        else:
            base_stats_data[pokemon] = {
                "level_up_learnset": [],
                "tmhm_moves": [],
                "base_stats": {},
                "evolutions": evolutions
            }
    
    # Write to JSON files
    for pokemon, data in base_stats_data.items():
        json_filepath = os.path.join(export_path, f'{pokemon.lower()}.json')
        with open(json_filepath, 'w') as json_file:
            json.dump(data, json_file, indent=4)


if __name__ == "__main__":
    main()
