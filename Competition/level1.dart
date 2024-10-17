void main(List<String> args) {
  Point p1 = Point(1, 2);
  print(p1);
  p1.translate(10, 12);
  print(p1);
}

class Point {
  int x;
  int y;

  Point(this.x, this.y);

  @override
  String toString() {
    return "x = $x, y = $y";
  }

  void translate(int dx, int dy) {
    x += dx;
    y += dy;
  }
}
