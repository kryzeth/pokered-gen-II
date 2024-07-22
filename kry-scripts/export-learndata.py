import json
import os
from pathlib import Path

def update_move_data(move_data_dir, move_name, pokemon_name, level=None, tmhm=False):
    move_file_path = move_data_dir / f"{move_name.lower()}.json"
    
    # Read existing data or create new structure
    if move_file_path.exists():
        with open(move_file_path, 'r') as file:
            move_data = json.load(file)
    else:
        move_data = {
            "Level-Up Learnset": [],
            "TMHM Learnset": []
        }
    
    # Update Level-Up Learnset section
    if level is not None:
        # Check for duplicates
        if not any(entry['Pokemon'] == pokemon_name and entry['Level'] == level for entry in move_data["Level-Up Learnset"]):
            move_data["Level-Up Learnset"].append({"Pokemon": pokemon_name, "Level": level})
    
    # Update TMHM Learnset section
    if tmhm:
        # Check for duplicates
        if not any(entry['Pokemon'] == pokemon_name for entry in move_data["TMHM Learnset"]):
            move_data["TMHM Learnset"].append({"Pokemon": pokemon_name})
    
    # Save updated data
    with open(move_file_path, 'w') as file:
        json.dump(move_data, file, indent=4)

def main():
    script_dir = Path(__file__).parent
    pokedata_dir = script_dir / 'pokedata'
    move_data_dir = script_dir / 'movedata'
    
    os.makedirs(move_data_dir, exist_ok=True)

    # Iterate over each Pokémon JSON file
    for pokemon_file in pokedata_dir.glob('*.json'):
        with open(pokemon_file, 'r') as file:
            pokemon_data = json.load(file)
            pokemon_name = pokemon_file.stem.lower()
            
            # Process Level-Up Learnset
            level_up_learnset = pokemon_data.get('level_up_learnset', [])
            for entry in level_up_learnset:
                level, move = entry
                update_move_data(move_data_dir, move, pokemon_name, level=level)
            
            # Process TM/HM Moves
            tmhm_moves = pokemon_data.get('tmhm_moves', [])
            for move in tmhm_moves:
                update_move_data(move_data_dir, move, pokemon_name, tmhm=True)

if __name__ == "__main__":
    main()
