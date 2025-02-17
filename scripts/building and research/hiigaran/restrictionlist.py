import re
import os

def extract_thing_to_build(lua_file):
    with open(lua_file, 'r', encoding='utf-8') as file:
        content = file.read()
    
    # Regex pattern to find ThingToBuild values
    pattern = r'\bThingToBuild\s*=\s*"(.*?)"'
    matches = re.findall(pattern, content)
    
    return matches

def write_lua_file(options, output_file):
    with open(output_file, 'w', encoding='utf-8') as file:
        file.write("local restrictedBuildOptions = {\n")
        for option in options:
            file.write(f'    "{option}",\n')
        file.write("}\n")

if __name__ == "__main__":
    lua_filename = "build.lua"  # Adjust this if needed
    output_filename = "restricted_build.lua"
    
    if os.path.exists(lua_filename):
        build_options = extract_thing_to_build(lua_filename)
        write_lua_file(build_options, output_filename)
        print(f"Extracted {len(build_options)} entries and saved to {output_filename}")
    else:
        print(f"Error: {lua_filename} not found!")
