void main() {
  print("Question 19: Multiple Catch Clauses");
  
  // FormatException
  try {
    String myName = "John";
    int.parse(myName);
  } on FormatException catch (e) {
    print("Caught FormatException: Tried to parse a name as an integer. Error: $e");
  }

  // RangeError (IndexOutOfRange equivalent in Dart)
  try {
    List<String> foods = ["Pizza", "Burger", "Pasta"];
    print(foods[5]);
  } on RangeError catch (e) {
    print("Caught RangeError: Tried to access out-of-range index. Error: $e");
  } catch (e) {
    print("Caught general exception: $e");
  }
}
