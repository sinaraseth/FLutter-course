enum Color { red, green }
enum Position { center, left, right }
enum RoomType { LivingRoom, BedRoom, Kitchen, GamingRoom, EmergencyRoom }

// Class Window
class Window {
  Color colorWindow;
  String locat; // Ex: left, right

  Window(this.colorWindow, this.locat);

  @override
  String toString() {
    return 'Window(color: $colorWindow, location: $locat)';
  }
}

// Class Door
class Door {
  Position location; // Ex: center, left, right

  Door({this.location = Position.center});

  @override
  String toString() {
    return 'Door(location: $location)';
  }
}

// Class Roof
class Roof {
  String type;

  Roof(this.type);

  @override
  String toString() {
    return 'Roof(type: $type)';
  }
}

// Class Chimney
class Chimney {
  Position posiChim;
  Color coloChim;

  Chimney(this.coloChim, this.posiChim);

  @override
  String toString() {
    return 'Chimney(color: $coloChim, position: $posiChim)';
  }
}

// Class Stair
class Stair {
  RoomType roomType;

  Stair(this.roomType);

  @override
  String toString() {
    return 'Stair(roomType: $roomType)';
  }
}

class Room {}

class House {
  final Door door;
  final Roof roof;
  final Chimney chimney;

  // Windows at various stairs
  Map<String, List<Window>> stairAndWindow;

  House({
    required this.door,
    required this.roof,
    required this.stairAndWindow,
    required this.chimney,
  });

  @override
  String toString() {
    String windowsDescription = stairAndWindow.entries.map((entry) {
      return '${entry.key}: ${entry.value.join(', ')}';
    }).join('; ');

    return '''
House details:
  - ${door.toString()}
  - ${roof.toString()}
  - ${chimney.toString()}
  - Windows: $windowsDescription
    ''';
  }
}

void main() {
  Door d1 = Door(location: Position.center);
  Roof r1 = Roof('Traingle');
  Chimney c1 = Chimney(Color.red, Position.left);

  // Defining the windows for each stair
  Map<String, List<Window>> stairAndWindow = {
    'Stair0': [Window(Color.red, 'left'), Window(Color.green, 'right')],
    'Stair1': [Window(Color.green, 'left'), Window(Color.red, 'right')]
  };

  // Creating the House object
  House myHouse = House(
    door: d1,
    roof: r1,
    stairAndWindow: stairAndWindow,
    chimney: c1,
  );

  // Printing out the details of the house
  print(myHouse);
}
