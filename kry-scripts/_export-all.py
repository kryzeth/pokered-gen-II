import subprocess
from pathlib import Path

def run_script(script_name):
    script_path = Path(__file__).parent / script_name
    print(f"Running {script_name}...")
    result = subprocess.run(["python", script_path], capture_output=True, text=True)
    
    if result.returncode != 0:
        print(f"Error running {script_name}:")
        print(result.stderr)
    else:
        print(f"{script_name} completed successfully.")

def main():
    scripts = [
        "export-pokedata.py",
        "export-movedata.py",
        "export-learndata.py",
        "export-pre-evos.py",
        "export-webpage-pokemon.py",
        "export-webpage-movedata.py"
    ]
    
    for script in scripts:
        run_script(script)

if __name__ == "__main__":
    main()
