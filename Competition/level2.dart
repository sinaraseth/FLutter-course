void main(List<String> args) {
  Point p1 = Point(1, 2);
  print(p1);
  Point p2 = p1.translate(10, 10);
  print(p2);
}

class Point {
  final int _x;
  final int _y;

  Point(this._x, this._y);

  @override
  String toString() {
    return "x = $_x, y = $_y";
  }

  Point translate(int dx, int dy) {
    return Point(_x + dx, _y + dy);
  }

  get x => _x;
  get y => _y;
}
