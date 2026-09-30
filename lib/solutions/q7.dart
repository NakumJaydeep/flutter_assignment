void printBirthdayWish([String name = "John Doe", int age = 20]) {
  print("Happy Birthday, $name! You are now $age years old.");
}

void main() {
  print("Question 7: Optional Positional Parameters");
  printBirthdayWish(); // Uses default values
  printBirthdayWish("Alice", 25);
}
