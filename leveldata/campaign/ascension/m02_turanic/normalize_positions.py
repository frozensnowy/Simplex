import re
from typing import List, Tuple

def parse_coordinates(line: str) -> Tuple[float, float, float]:
    # Extract coordinates from {x, y, z} format
    match = re.search(r'{([-\d.]+),\s*([-\d.]+),\s*([-\d.]+)}', line)
    if match:
        return tuple(float(x) for x in match.groups())
    return None

def normalize_coordinates(coords: List[Tuple[float, float, float]], 
                        player_start: Tuple[float, float, float],
                        scale_factor: float = 0.5) -> List[Tuple[float, float, float]]:
    """Normalize coordinates relative to player start position and scale them"""
    return [
        (
            (x - player_start[0]) * scale_factor,
            y,
            (z - player_start[2]) * scale_factor
        )
        for x, y, z in coords
    ]

def process_level_file(input_path: str, output_path: str):
    with open(input_path, 'r') as f:
        lines = f.readlines()

    # First find player start position
    player_start = None
    for line in lines:
        if 'addPoint("PlayerStartPoint"' in line:
            player_start = parse_coordinates(line)
            break
    
    if not player_start:
        raise ValueError("Could not find player start position")

    # Process file and normalize coordinates
    new_lines = []
    for line in lines:
        if any(x in line for x in ['addPoint', 'addAsteroid', 'addDustCloud', 'addPebble']):
            coords = parse_coordinates(line)
            if coords:
                # Normalize coordinates
                new_coords = normalize_coordinates([coords], player_start)[0]
                # Replace coordinates in line
                new_line = re.sub(
                    r'{[-\d.]+,\s*[-\d.]+,\s*[-\d.]+}',
                    f'{{{new_coords[0]:.1f}, {new_coords[1]:.1f}, {new_coords[2]:.1f}}}',
                    line
                )
                new_lines.append(new_line)
            else:
                new_lines.append(line)
        else:
            new_lines.append(line)

    # Write output
    with open(output_path, 'w') as f:
        f.writelines(new_lines)

if __name__ == '__main__':
    process_level_file('m02_turanic.level', 'm02_turanic_normalized.level') 