import os
import json

def parse_moves_asm(file_path):
    moves_data = {}
    in_moves_section = False

    with open(file_path, 'r') as file:
        for line in file:
            line = line.strip()
            
            if line.startswith("assert_table_length"):
                break
            
            if line.startswith("table_width"):
                in_moves_section = True
                continue
            
            if in_moves_section and line.startswith("move"):
                parts = line.split(',')
                move_name = parts[0].replace("move ", "").strip()
                effect = parts[1].strip()
                power = int(parts[2].strip())
                move_type = parts[3].strip()
                accuracy = int(parts[4].strip())
                pp = int(parts[5].split(';')[0].strip())

                if effect == "NO_ADDITIONAL_EFFECT":
                    effect = None
                
                move_entry = {
                    "Move Power": power,
                    "Move Type": move_type,
                    "Move Accuracy": accuracy,
                    "Move PP": pp
                }
                
                if effect:
                    move_entry["Additional Effect"] = effect

                moves_data[move_name] = move_entry

    return moves_data

def parse_item_constants(file_path, moves_data):
    hm_section = False
    tm_section = False
    hm_counter = 1
    tm_counter = 1

    with open(file_path, 'r') as file:
        for line in file:
            line = line.strip()

            if line.startswith("DEF NUM_HMS"):
                hm_section = False

            if line.startswith("DEF HM01"):
                hm_section = True
                continue

            if line.startswith("ASSERT NUM_TMS"):
                tm_section = False

            if line.startswith("DEF TM01"):
                tm_section = True
                continue

            if hm_section and line.startswith("add_hm"):
                parts = line.split(';')[0].replace("add_hm", "").strip()
                move_name_parts = parts.split()
                if len(move_name_parts) > 0:
                    move_name = move_name_parts[0].strip()
                    hm_number = str(hm_counter).zfill(2)
                    hm_counter += 1

                    # print(f"Detected HM move: {move_name} with HM number: {hm_number}")

                    if move_name in moves_data:
                        # print(f"Adding HM {hm_number} to move {move_name}")
                        moves_data[move_name]["HM"] = hm_number

            if tm_section and line.startswith("add_tm"):
                parts = line.split(';')[0].replace("add_tm", "").strip()
                move_name_parts = parts.split()
                if len(move_name_parts) > 0:
                    move_name = move_name_parts[0].strip()
                    tm_number = str(tm_counter).zfill(2)
                    tm_counter += 1

                    # print(f"Detected TM move: {move_name} with TM number: {tm_number}")

                    if move_name in moves_data:
                        # print(f"Adding TM {tm_number} to move {move_name}")
                        moves_data[move_name]["TM"] = tm_number

def save_to_json(data, file_path):
    with open(file_path, 'w') as json_file:
        json.dump(data, json_file, indent=4)

if __name__ == "__main__":
    moves_asm_path = "../data/moves/moves.asm"
    item_constants_path = "../constants/item_constants.asm"
    output_json_path = "../kry-scripts/resources/moves.json"
    
    if not os.path.exists(os.path.dirname(output_json_path)):
        os.makedirs(os.path.dirname(output_json_path))
    
    moves_data = parse_moves_asm(moves_asm_path)
    parse_item_constants(item_constants_path, moves_data)
    save_to_json(moves_data, output_json_path)
