enum Color { blue, red, black, green, yellow }

void main(List<String> args) {
  Point p1 = Point(1, 2);
  print(p1);

  Shape shape =
      Shape(leftBottom: p1, height: 10, width: 20, background: Color.green);
  print(shape);
  print("rightTop: ${shape.rightTop}");
}

class Point {
  final int x;
  final int y;

  Point(this.x, this.y);

  @override
  String toString() {
    return "x = $x, y = $y";
  }
}

class Shape {
  final Point leftBottom;
  final int width;
  final int height;
  Color? background;

  Shape(
      {required this.leftBottom,
      required this.height,
      required this.width,
      this.background});

  Point get rightTop => Point(leftBottom.x + height, leftBottom.y + width);

  @override
  String toString() {
    return "Shape with leftBottom at (${leftBottom}), width: $width, height: $height, background: $Color";
  }
}
