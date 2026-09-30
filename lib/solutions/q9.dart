import 'dart:math';

double calculateArea(double radius) => pi * radius * radius;

void main() {
  print("Question 9: Arrow Function for Circle Area");
  print("Area with radius 5: ${calculateArea(5).toStringAsFixed(2)}");
  print("Area with radius 10: ${calculateArea(10).toStringAsFixed(2)}");
  print("Area with radius 2.5: ${calculateArea(2.5).toStringAsFixed(2)}");
}
