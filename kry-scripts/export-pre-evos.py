import json
import os

def update_pre_evolutions(pokedata_dir):
    # Get the list of all JSON files in the pokedata directory
    pokemon_files = [f for f in os.listdir(pokedata_dir) if f.endswith('.json')]

    # Create a dictionary to hold the data from all Pokémon files
    pokemon_data = {}
    for file_name in pokemon_files:
        with open(os.path.join(pokedata_dir, file_name), 'r') as f:
            pokemon_data[file_name.lower()] = json.load(f)

    # Process each Pokémon file to update pre-evolutions
    for file_name in pokemon_files:
        pokemon_name = file_name.lower().replace('.json', '')
        data = pokemon_data[file_name.lower()]

        # Check if there is an evolutions section
        if 'evolutions' in data:
            for evolution in data['evolutions']:
                result = evolution.get('result')
                if result:
                    # Convert result to lowercase and find the corresponding file
                    result_file_name = result.lower() + '.json'
                    if result_file_name in pokemon_data:
                        # Prepare pre-evolution data
                        pre_evolution_entry = {
                            'method': evolution.get('method'),
                            'pre_evolution_name': pokemon_name.upper()
                        }
                        # Only add 'level' if the method is LEVEL
                        if evolution.get('method') == 'LEVEL':
                            pre_evolution_entry['level'] = evolution.get('level')

                        # Load the result Pokémon file
                        result_data = pokemon_data[result_file_name]

                        # Initialize pre-evolutions section if not present
                        if 'pre_evolutions' not in result_data:
                            result_data['pre_evolutions'] = []

                        # Check for duplicate entries
                        existing_pre_evolutions = result_data['pre_evolutions']
                        if not any(
                            entry['pre_evolution_name'] == pre_evolution_entry['pre_evolution_name']
                            and entry['method'] == pre_evolution_entry['method']
                            and (entry.get('level') == pre_evolution_entry.get('level', None))
                            for entry in existing_pre_evolutions
                        ):
                            # Append the pre-evolution entry
                            result_data['pre_evolutions'].append(pre_evolution_entry)

                            # Save the updated file
                            with open(os.path.join(pokedata_dir, result_file_name), 'w') as f:
                                json.dump(result_data, f, indent=4)

if __name__ == "__main__":
    pokedata_dir = 'pokedata'  # Adjust the relative path as needed
    update_pre_evolutions(pokedata_dir)
