enum Direction { north, east, south, west }

void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  //define direction and response movement
  Map<Direction, List<int>> movements = {
    Direction.north: [0, 1],
    Direction.east: [1, 0],
    Direction.south: [0, -1],
    Direction.west: [-1, 0]
  };

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  for (var instruction in instructions.split('')) {
    if (instruction == 'R') {
      direction = turnRight(direction);
    } else if (instruction == 'L') {
      direction = turnLeft(direction);
    } else if (instruction == 'A') {
      x += movements[direction]![0];
      y += movements[direction]![1];
    }
  }

  // Print the final position and direction
  print("Final position: {$x, $y} ");
  print("Facing:${direction.toString().split('.').last.toUpperCase()} ");
}

//turn right
Direction turnRight(Direction current) {
  switch (current) {
    case Direction.north:
      return Direction.east;
    case Direction.east:
      return Direction.south;
    case Direction.south:
      return Direction.west;
    case Direction.west:
      return Direction.north;
  }
}

//turn left
Direction turnLeft(Direction current) {
  switch (current) {
    case Direction.north:
      return Direction.west;
    case Direction.west:
      return Direction.south;
    case Direction.south:
      return Direction.east;
    case Direction.east:
      return Direction.north;
  }
}
