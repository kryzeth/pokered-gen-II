import json
import os
from pathlib import Path

def load_effect_descriptions(file_path):
    with open(file_path, 'r') as file:
        return json.load(file)
        
def generate_html(name, level_up_learnset, tmhm_learnset, move_data, effect_descriptions):
    # Helper function to create table rows
    def create_table_rows(data, headers, is_tmhm=False):
        rows = []
        for item in data:
            row = '<tr>'
            for header in headers:
                cell = item.get(header, '') if not is_tmhm else item.get(header, '')
                row += f'<td>{cell}</td>'
            row += '</tr>'
            rows.append(row)
        return rows
    
    level_up_headers = ["Pokemon", "Level"]
    tmhm_headers = ["Pokemon"]
    
    # Generate rows for level-up learnset
    level_up_learnset_rows = []
    for entry in level_up_learnset:
        pokemon_name = entry["Pokemon"]
        level = entry["Level"]
        row = f"""
        <tr>
            <td><a href="{pokemon_name.lower()}.html">{pokemon_name.title()}</a></td>
            <td>{level}</td>
        </tr>
        """
        level_up_learnset_rows.append(row)

    # Generate rows for TM/HM learnset
    tmhm_learnset_rows = []
    for entry in tmhm_learnset:
        pokemon_name = entry["Pokemon"]
        row = f"""
        <tr>
            <td><a href="{pokemon_name.lower()}.html">{pokemon_name.title()}</a></td>
        </tr>
        """
        tmhm_learnset_rows.append(row)
        
    # Adding move data to the page
    move_details = ""
    if move_data:
        move_type = move_data.get("Move Type", "Unknown")
        move_power = move_data.get("Move Power", "N/A")
        move_accuracy = move_data.get("Move Accuracy", "N/A")
        move_pp = move_data.get("Move PP", "N/A")
        additional_effect_code = move_data.get("Additional Effect", "").strip()

        # Fetch additional effect description
        if additional_effect_code:
            additional_effect = effect_descriptions.get(additional_effect_code, "Unknown effect")
        else:
            additional_effect = "No additional effect"

        move_details = f"""
        <h2>Move Details</h2>
        <p><strong>Move Type:</strong> {move_type}</p>
        <p><strong>Move Power:</strong> {move_power}</p>
        <p><strong>Move Accuracy:</strong> {move_accuracy}</p>
        <p><strong>Move PP:</strong> {move_pp}</p>
        """
        if additional_effect:
            move_details += f"<p><strong>Additional Effect:</strong> {additional_effect}</p>"

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
        <h1>{name.title()}</h1>
        {move_details}
        <h2>Moves learned via level</h2>
        <table id="level-up-learnset" data-sort-order="asc">
            <thead>
                <tr>
                    <th class="sortable" onclick="sortTable(0, 'level-up-learnset')">Pokemon</th>
                    <th class="sortable" onclick="sortTable(1, 'level-up-learnset')">Level</th>
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
                    <th class="sortable" onclick="sortTable(0, 'tmhm-moves')">Pokemon</th>
                </tr>
            </thead>
            <tbody>
                {''.join(tmhm_learnset_rows)}
            </tbody>
        </table>
    </body>
    </html>
    """
    return html_content


def normalize_name(name):
    return name.strip().lower()

def main():
    script_dir = Path(__file__).parent
    move_data_dir = script_dir / 'movedata'
    webdata_dir = script_dir / 'webdata'
    resources_dir = script_dir / 'resources'
    
    os.makedirs(webdata_dir, exist_ok=True)
    
    # Load effect descriptions
    effect_descriptions_path = resources_dir / 'effect_descriptions.json'
    effect_descriptions = load_effect_descriptions(effect_descriptions_path)
    
    # Load data from moves.json located in the base directory
    moves_json_path = resources_dir / 'moves.json'
    with open(moves_json_path, 'r') as file:
        moves_data = json.load(file)
    
    # Normalize move names in moves_data
    moves_data = {normalize_name(key): value for key, value in moves_data.items()}
        
    for move_file in move_data_dir.glob('*.json'):
        with open(move_file, 'r') as file:
            move_data = json.load(file)
            move_name = normalize_name(move_file.stem)  # Normalize move_name
            
            level_up_learnset = move_data.get('Level-Up Learnset', [])
            tmhm_learnset = move_data.get('TMHM Learnset', [])
            
            # Extract move details from moves.json
            specific_move_data = moves_data.get(move_name, {})
            
            html_content = generate_html(move_name, level_up_learnset, tmhm_learnset, specific_move_data, effect_descriptions)
            
            html_file_path = webdata_dir / f"{move_name.lower()}.html"
            with open(html_file_path, 'w') as file:
                file.write(html_content)

if __name__ == "__main__":
    main()

