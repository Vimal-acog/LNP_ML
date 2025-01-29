import subprocess

# Define the commands as a list of strings
commands = [
    "python main_script.py split small_test_split.csv 0.2 in_silico_screen_split",
    "python main_script.py train small_test_split_with_ultra_held_out_for_in_silico_screen --epochs 3",
    "python main_script.py analyze small_test_split_with_ultra_held_out_for_in_silico_screen",
    "python main_script.py predict small_test_split_with_ultra_held_out_for_in_silico_screen test_screen"
]

# Execute each command sequentially
for cmd in commands:
    print(f"Running command: {cmd}")
    result = subprocess.run(cmd, shell=True, check=True)
    if result.returncode != 0:
        print(f"Command failed: {cmd}")
        exit(1)
    print(f"Command completed: {cmd}")

print("All commands executed successfully!")