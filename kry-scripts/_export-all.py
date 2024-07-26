import subprocess
from pathlib import Path

def run_script(script_name):
    script_path = Path(__file__).parent / script_name
    print(f"Running {script_name}...")
    result = subprocess.run(["python", script_path], capture_output=True, text=True)
    
    if result.returncode != 0:
        print(f"Error running {script_name}:")
        print(result.stderr)
        return False
    else:
        print(f"{script_name} completed successfully.")
        return True

def main():
    scripts = [
        "export-pokedata.py",
        "export-movedata.py",
        "export-learndata.py",
        "export-pre-evos.py",
        "export-webpage-pokemon.py",
        "export-webpage-movedata.py"
    ]
    
    all_successful = True
    for script in scripts:
        if not run_script(script):
            all_successful = False

    if all_successful:
        print("All scripts completed successfully.")
    else:
        print("Some scripts encountered errors.")

    input("Press any key to close...")

if __name__ == "__main__":
    main()
