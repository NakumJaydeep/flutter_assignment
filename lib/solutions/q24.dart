abstract class Shape {
  double area();
  double perimeter();
}

class Square extends Shape {
  double side;
  Square(this.side);

  @override
  double area() => side * side;

  @override
  double perimeter() => 4 * side;
}

class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);

  @override
  double area() => width * height;

  @override
  double perimeter() => 2 * (width + height);
}

void main() {
  print("Question 24: Abstract Shape class");
  Shape s = Square(5);
  print("Square area: ${s.area()}, perimeter: ${s.perimeter()}");

  Shape r = Rectangle(4, 6);
  print("Rectangle area: ${r.area()}, perimeter: ${r.perimeter()}");
}
