// OOP extra work start code
// Class wondow
class Window {
  String color;
  int numberOfWindow;
  String locat; // Ex: left, right

  Window(this.color, this.numberOfWindow, this.locat);
}

// class door
class Door {
  String locat; // Ex: center, left, right
  int numberOfDoor;

  Door(this.locat, this.numberOfDoor);
}

// Class roof
class Roof {
  String type;
  int numberOfRoof;

  Roof(this.numberOfRoof, this.type);
}

// Class Chimney
class Chimney {
  int numberOfChimney;

  Chimney(this.numberOfChimney);
}

// my own house
class House {
  Window redLeft = Window('red', 1, 'left');
  Window redRight = Window('red', 1, 'right');
  Window greenLeft_ = Window('green', 1, 'left');
  Window greenRight_ = Window('green', 1, 'right');

  Map<String, List<Window>> windowWithStair = {
    'stair1': [redLeft, greenRight_],
    'stair0': [redLeft, redRight],
  };

  Door doorStair0 = Door('center', 1);
  Roof houseRoof = Roof(1, 'Triagle');
  Chimney houseChimney = Chimney(1);
}
