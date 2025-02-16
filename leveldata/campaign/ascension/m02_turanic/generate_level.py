import math
from typing import List, Tuple, Dict
import random

class LevelGenerator:
    def __init__(self, 
                 map_size: float = 50000,
                 player_offset: Tuple[float, float, float] = (0, 0, 0),
                 black_hole_offset: Tuple[float, float, float] = (0, -50000, 0)):
        self.map_size = map_size
        self.player_offset = player_offset
        self.black_hole_offset = black_hole_offset
        self.derelict_types = [
            "meg_gehenna_1ctm",
            "meg_veildebris_chunk2",
            "meg_veildebris_chunk3",
            "meg_veildebris_chunk4",
            "meg_veildebris_flake1",
            "meg_balcoragate"
        ]
        self.resource_types = [
            ("Asteroid_3", 100),
            ("Asteroid_4", 200),
            ("Asteroid_5", 400),
            ("Asteroid_2", 600),
            ("Asteroid_1", 800)
        ]

    def generate_natural_flow_pattern(self) -> List[Tuple[float, float, float]]:
        """Generate more organic, flowing dust cloud patterns"""
        positions = []
        
        # Dense central nebula around player
        for _ in range(20):
            radius = random.uniform(2000, 8000)
            angle = random.uniform(0, 2 * math.pi)
            x = radius * math.cos(angle)
            z = radius * math.sin(angle)
            y = random.uniform(-1000, 1000)
            positions.append((x, y, z))

        # Flowing "rivers" of dust
        flow_points = 6
        for flow in range(4):
            base_angle = (2 * math.pi * flow) / 4
            control_points = []
            # Generate control points for Bezier-like curves
            for i in range(flow_points):
                dist = self.map_size * 0.8 * (i / (flow_points - 1))
                angle_offset = random.uniform(-0.3, 0.3)
                x = dist * math.cos(base_angle + angle_offset)
                z = dist * math.sin(base_angle + angle_offset)
                y = self.black_hole_offset[1] * (i / (flow_points - 1))
                control_points.append((x, y, z))

            # Generate points along the flow
            for i in range(flow_points - 1):
                steps = 10
                for step in range(steps):
                    t = step / steps
                    # Linear interpolation between control points
                    x = control_points[i][0] * (1-t) + control_points[i+1][0] * t
                    y = control_points[i][1] * (1-t) + control_points[i+1][1] * t
                    z = control_points[i][2] * (1-t) + control_points[i+1][2] * t
                    
                    # Add main flow point
                    positions.append((x, y, z))
                    
                    # Add surrounding clouds for width
                    for _ in range(3):
                        spread = random.uniform(2000, 4000)
                        angle = random.uniform(0, 2 * math.pi)
                        positions.append((
                            x + spread * math.cos(angle),
                            y + random.uniform(-500, 500),
                            z + spread * math.sin(angle)
                        ))

        return positions

    def generate_level_file(self, output_path: str):
        with open(output_path, 'w') as f:
            # Write header
            f.write("maxPlayers = 4\n\n")
            f.write("""player = {}
            
player[0] = {
    id = 0, 
    name = "Hiigaran Navy", 
    resources = 0, 
    raceID = 1, 
    startPos = 0,
}

player[1] = {
    id = 1,
    name = "Unidentified Enemy",
    resources = 1500,
    raceID = 2,
    startPos = 1,
}

player[2] = {
    id = 2,
    name = "Turanic Raider Scoundrels",
    resources = 1500,
    raceID = 2,
    startPos = 1,
}

player[3] = {
    id = 3,
    name = "Hiigaran Battle Selum",
    resources = 1500,
    raceID = 3,
    startPos = 1,
}\n\n""")

            # Start DetermChunk
            f.write("function DetermChunk()\n")
            
            # Player and camera setup
            f.write(f'  addPoint("PlayerStartPoint", {{{self.player_offset[0]}, {self.player_offset[1]}, {self.player_offset[2]}}}, {{0, 0, 0}})\n\n')
            camera_pos = (400, 0, 0)
            camera_look = (4100, 0, 400)
            f.write(f'  addCamera("Camera_Start", {{{camera_pos[0]}, {camera_pos[1]}, {camera_pos[2]}}}, {{{camera_look[0]}, {camera_look[1]}, {camera_look[2]}}})\n\n')

            # Black hole setup
            f.write("""  createSOBGroup("sob_AllBlackholes")\n""")
            f.write(f'  addSquadron("sqd_Blackhole1", "zzz_blackhole_green", {{{self.black_hole_offset[0]}, {self.black_hole_offset[1]}, {self.black_hole_offset[2]}}}, -1, {{5, 0, 0}}, 0, 0)\n')
            f.write("""  createSOBGroup("sob_Blackhole1")\n""")
            f.write("""  addToSOBGroup("sqd_Blackhole1", "sob_Blackhole1")\n""")
            f.write("""  addToSOBGroup("sqd_Blackhole1", "sob_AllBlackholes")\n\n""")

            # Generate and add nebula patterns
            flow_positions = self.generate_natural_flow_pattern()
            for pos in flow_positions:
                size = random.uniform(5000, 12000)
                rotation = random.uniform(0, 360)
                opacity = random.uniform(0.7, 1.0)
                # More green-tinted clouds
                green = random.uniform(90, 140)
                blue = random.uniform(80, 120)
                f.write(f'  addDustCloud("polySurface1", "dustcloud_0", {{{pos[0]}, {pos[1]}, {pos[2]}}}, '
                       f'{{0, {green}, {blue}, {opacity}}}, {rotation}, {size})\n')

            # Add megaliths and derelicts
            for _ in range(15):
                angle = random.uniform(0, 2 * math.pi)
                dist = random.uniform(self.map_size * 0.3, self.map_size * 0.7)
                x = dist * math.cos(angle)
                z = dist * math.sin(angle)
                y = random.uniform(-10000, 0)
                derelict_type = random.choice(self.derelict_types)
                rotation = (random.uniform(-30, 30), random.uniform(-180, 180), random.uniform(-30, 30))
                f.write(f'  addSquadron("derelict_{_}", "{derelict_type}", {{{x}, {y}, {z}}}, -1, {{{rotation[0]}, {rotation[1]}, {rotation[2]}}}, 0, 0)\n')

            # Add resource clusters more naturally along the dust flows
            for pos in flow_positions[::5]:  # Every 5th flow position
                if random.random() < 0.3:  # 30% chance for resource cluster
                    for _ in range(random.randint(2, 5)):
                        offset_x = random.uniform(-2000, 2000)
                        offset_z = random.uniform(-2000, 2000)
                        offset_y = random.uniform(-500, 500)
                        x = pos[0] + offset_x
                        y = pos[1] + offset_y
                        z = pos[2] + offset_z
                        asteroid_type, resource_amount = random.choice(self.resource_types)
                        f.write(f'  addAsteroid("{asteroid_type}", {{{x}, {y}, {z}}}, {resource_amount}, 0, 0, 0, 0)\n')

            # Add world bounds
            f.write(f'\n  setWorldBoundsInner({{0, 0, 0}}, {{{self.map_size}, {self.map_size}, {self.map_size}}})\n')
            f.write("end\n\n")

            # Add NonDetermChunk
            f.write("""function NonDetermChunk()
  fogSetActive(1)
  fogSetStart(10)
  fogSetEnd(20000)
  fogSetColour(0.136719, 0.228516, 0.427734, 1)
  fogSetType("linear")
  fogSetDensity(0.15)
  setGlareIntensity(0)
  setLevelShadowColour(0, 0, 0, 1)
  loadBackground("reach")
  setSensorsManagerCameraDistances(61000, 120000)
end""")

if __name__ == "__main__":
    generator = LevelGenerator(
        map_size=50000,
        player_offset=(0, 0, 0),
        black_hole_offset=(0, -50000, 0)
    )
    generator.generate_level_file("m02_turanic2.level") 