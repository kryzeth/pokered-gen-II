import os
import json
from pathlib import Path

def load_effect_descriptions(file_path):
    with open(file_path, 'r') as file:
        return json.load(file)

def get_effect_description(effect_key, effect_descriptions):
    return effect_descriptions.get(effect_key, "Unknown effect")

def load_moves_data(file_path):
    with open(file_path, 'r') as file:
        moves_dict = json.load(file)
    return moves_dict

def generate_html(pokemon_data, name, moves_data, effect_descriptions):
    # Handle the types with special cases
    type_mapping = {
        "PSYCHIC_TYPE": "PSYCHIC",
        "POISON_LEV": "POISON"
    }
        
    # Extract and transform types
    types = pokemon_data.get('types', [])
    transformed_types = [type_mapping.get(t, t) for t in types]

    # Format the types as a string
    types_str = ' / '.join(transformed_types)
    
    evolutions = pokemon_data.get('evolutions', [])
    evolutions_str = []
    for evo in evolutions:
        method = evo.get('method', 'Unknown').upper()
        if method == 'LEVEL':
            level = evo.get('level', 'Unknown')
            result = evo.get('result', 'Unknown')
            evolutions_str.append(f"Evolves at level {level} into <a href='{result.lower()}.html'>{result}</a>")
        elif method == 'ITEM':
            item = evo.get('item', 'Unknown')
            result = evo.get('result', 'Unknown')
            evolutions_str.append(f"Evolves with {item} into <a href='{result.lower()}.html'>{result}</a>")
        elif method == 'TRADE':
            result = evo.get('result', 'Unknown')
            evolutions_str.append(f"Evolves by trade into <a href='{result.lower()}.html'>{result}</a>")
    
    evolutions_content = "<br>".join(evolutions_str) if evolutions_str else "This Pokemon does not evolve."
    
    # Assuming you have a dictionary named `pokemon_data` with pre-evolutions data
    pre_evolutions = pokemon_data.get('pre_evolutions', [])
    pre_evolutions_str = []
    for pre_evo in pre_evolutions:
        method = pre_evo.get('method', 'Unknown').upper()
        if method == 'LEVEL':
            level = pre_evo.get('level', 'Unknown')
            pre_evo_name = pre_evo.get('pre_evolution_name', 'Unknown')
            pre_evolutions_str.append(f"Evolves from <a href='{pre_evo_name.lower()}.html'>{pre_evo_name}</a> at level {level}")
        elif method == 'ITEM':
            item = pre_evo.get('item', 'Unknown')
            pre_evo_name = pre_evo.get('pre_evolution_name', 'Unknown')
            pre_evolutions_str.append(f"Evolves from <a href='{pre_evo_name.lower()}.html'>{pre_evo_name}</a> using {item}")
        elif method == 'TRADE':
            pre_evo_name = pre_evo.get('pre_evolution_name', 'Unknown')
            pre_evolutions_str.append(f"Evolves from <a href='{pre_evo_name.lower()}.html'>{pre_evo_name}</a> by trade")

    pre_evolutions_content = "<br>".join(pre_evolutions_str) if pre_evolutions_str else "This Pokémon has no pre-evolutions."

    def handle_special_cases(move_name, move_type):
        # Special handling for move type
        if move_type == "PSYCHIC_TYPE":
            move_type = "PSYCHIC"
        
        # Special handling for move name
        if move_name == "PSYCHIC_M":
            move_name = "PSYCHIC"

        return move_name, move_type
    
    # Handle moves learned via level
    level_up_learnset = pokemon_data.get('level_up_learnset', [])
    level_up_learnset_rows = []
    for level, move in level_up_learnset:
        move_details = moves_data.get(move, {})
        move_name, move_type = handle_special_cases(move, move_details.get('Move Type', ''))
        additional_effect = get_effect_description(move_details.get('Additional Effect', ''), effect_descriptions)
        move_link = f"<a href='../webdata/{move_name.lower()}.html'>{move_name}</a>"
        move_row = (
            f"<tr><td>{level}</td>"
            f"<td>{move_link}</td>"
            f"<td>{move_type}</td>"
            f"<td>{move_details.get('Move Power', '')}</td>"
            f"<td>{move_details.get('Move Accuracy', '')}</td>"
            f"<td>{move_details.get('Move PP', '')}</td>"
            f"<td>{additional_effect}</td></tr>"
        )
        level_up_learnset_rows.append(move_row)

    # Handle TM/HM moves
    tmhm_moves = pokemon_data.get('tmhm_moves', [])
    tmhm_moves_rows = []
    for move in tmhm_moves:
        move_details = moves_data.get(move, {})
        move_name, move_type = handle_special_cases(move, move_details.get('Move Type', ''))
        additional_effect = get_effect_description(move_details.get('Additional Effect', ''), effect_descriptions)
        hm_tm_entry = ""
        if 'HM' in move_details:
            hm_tm_entry = f"HM {move_details['HM']}"
        elif 'TM' in move_details:
            hm_tm_entry = f"TM {move_details['TM']}"
        move_link = f"<a href='../webdata/{move_name.lower()}.html'>{move_name}</a>"
        move_row = (
            f"<tr><td>{hm_tm_entry}</td>"
            f"<td>{move_link}</td>"
            f"<td>{move_type}</td>"
            f"<td>{move_details.get('Move Power', '')}</td>"
            f"<td>{move_details.get('Move Accuracy', '')}</td>"
            f"<td>{move_details.get('Move PP', '')}</td>"
            f"<td>{additional_effect}</td></tr>"
        )
        tmhm_moves_rows.append(move_row)

    html_content = f"""
    <html>
    <head>
        <title>{name.title()}</title>
        <style>
            body {{
                font-family: Arial, sans-serif;
                background-color: #121212;
                color: #e0e0e0;
                margin: 0;
                padding: 0;
            }}
            h1, h2 {{
                color: #e0e0e0;
            }}
            h1 {{
                font-size: 28px;
                font-weight: bold;
                margin: 20px;
            }}
            h2 {{
                font-size: 22px;
                margin-top: 20px;
            }}
            p {{
                margin: 20px;
            }}
            a {{
                color: #bb86fc;
                text-decoration: none;
            }}
            a:hover {{
                text-decoration: underline;
            }}
            table {{
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }}
            th, td {{
                border: 1px solid #333;
                padding: 8px;
                text-align: left;
            }}
            th {{
                background-color: #333;
                color: #e0e0e0;
            }}
            tr:nth-child(even) {{
                background-color: #1e1e1e;
            }}
            th.sortable {{
                cursor: pointer;
                position: relative;
            }}
            th.sortable::after {{
                content: url('../resources/sort_both.svg');
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                width: 16px;
                height: 16px;
            }}
            th.sortable.asc::after {{
                content: url('../resources/sort_down.svg');
            }}
            th.sortable.desc::after {{
                content: url('../resources/sort_up.svg');
            }}
        </style>
        <script>
            function sortTable(n, tableId) {{
                var table = document.getElementById(tableId);
                var rows = Array.from(table.getElementsByTagName("tr")).slice(1);
                var th = table.getElementsByTagName("th")[n];
                var currentOrder = th.classList.contains("asc") ? "asc" : (th.classList.contains("desc") ? "desc" : "none");
                var ascending = currentOrder === "none" || currentOrder === "desc";
                
                // Toggle sorting order
                if (currentOrder === "none") {{
                    th.classList.add("asc");
                }} else if (currentOrder === "asc") {{
                    th.classList.remove("asc");
                    th.classList.add("desc");
                }} else {{
                    th.classList.remove("asc");
                    th.classList.remove("desc");
                }}
                
                // Reset other column sort orders
                Array.from(th.parentElement.children).forEach(function(sibling, index) {{
                    if (index !== n) {{
                        sibling.classList.remove("asc", "desc");
                    }}
                }});
                
                rows.sort(function(a, b) {{
                    var aText = a.getElementsByTagName("td")[n].textContent.trim();
                    var bText = b.getElementsByTagName("td")[n].textContent.trim();
                    if (!isNaN(aText) && !isNaN(bText)) {{
                        return ascending ? aText - bText : bText - aText;
                    }}
                    return ascending ? aText.localeCompare(bText) : bText.localeCompare(aText);
                }});
                for (var i = 0; i < rows.length; i++) {{
                    table.appendChild(rows[i]);
                }}
            }}
        </script>
    </head>
    <body>
        <h1>{name.title()} - {types_str.title()}</h1>
        <h2>Evolutions</h2>
        <p>{evolutions_content}</p>
        <p>{pre_evolutions_content}</p>
        <h2>Moves learned via level</h2>
        <table id="level-up-learnset" data-sort-order="asc">
            <thead>
                <tr>
                    <th class="sortable" onclick="sortTable(0, 'level-up-learnset')">Level</th>
                    <th class="sortable" onclick="sortTable(1, 'level-up-learnset')">Move</th>
                    <th class="sortable" onclick="sortTable(2, 'level-up-learnset')">Type</th>
                    <th class="sortable" onclick="sortTable(3, 'level-up-learnset')">Power</th>
                    <th class="sortable" onclick="sortTable(4, 'level-up-learnset')">Accuracy</th>
                    <th class="sortable" onclick="sortTable(5, 'level-up-learnset')">PP</th>
                    <th class="sortable" onclick="sortTable(6, 'level-up-learnset')">Additional Effect</th>
                </tr>
            </thead>
            <tbody>
                {''.join(level_up_learnset_rows)}
            </tbody>
        </table>
        <h2>Moves learned via TM/HM</h2>
        <table id="tmhm-moves" data-sort-order="asc">
            <thead>
                <tr>
                    <th class="sortable" onclick="sortTable(0, 'tmhm-moves')">TM/HM</th>
                    <th class="sortable" onclick="sortTable(1, 'tmhm-moves')">Move</th>
                    <th class="sortable" onclick="sortTable(2, 'tmhm-moves')">Type</th>
                    <th class="sortable" onclick="sortTable(3, 'tmhm-moves')">Power</th>
                    <th class="sortable" onclick="sortTable(4, 'tmhm-moves')">Accuracy</th>
                    <th class="sortable" onclick="sortTable(5, 'tmhm-moves')">PP</th>
                    <th class="sortable" onclick="sortTable(6, 'tmhm-moves')">Additional Effect</th>
                </tr>
            </thead>
            <tbody>
                {''.join(tmhm_moves_rows)}
            </tbody>
        </table>
    </body>
    </html>
    """
    return html_content

def main():
    script_dir = Path(__file__).parent
    pokedex_dir = script_dir / 'pokedata'
    resources_dir = script_dir / 'resources'
    output_dir = script_dir / 'webdata'
    
    # Load effect descriptions
    effect_descriptions_path = script_dir / 'resources/effect_descriptions.json'
    effect_descriptions = load_effect_descriptions(effect_descriptions_path)

    # Load moves data
    moves_json_path = resources_dir / 'moves.json'
    moves_data = load_moves_data(moves_json_path)

    # Create output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)

    # Read JSON files and generate HTML pages
    for json_file in pokedex_dir.glob('*.json'):
        with open(json_file, 'r') as file:
            pokemon_data = json.load(file)
            # Extract the Pokémon name from the filename
            name = json_file.stem.lower()
            html_content = generate_html(pokemon_data, name, moves_data, effect_descriptions)
            
            # Save the HTML content to a file
            html_filepath = output_dir / f'{name}.html'
            with open(html_filepath, 'w') as html_file:
                html_file.write(html_content)

if __name__ == "__main__":
    main()
