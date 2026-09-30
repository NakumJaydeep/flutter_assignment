void main() {
  int rollNumber = 105;
  print("Question 18: Try-Catch Block for Division by Zero");
  
  try {
    int result = rollNumber ~/ 0;
    print("Result: $result");
  } catch (e) {
    print("Error: Cannot divide your roll number ($rollNumber) by zero.");
    print("Actual exception: $e");
  }
}
