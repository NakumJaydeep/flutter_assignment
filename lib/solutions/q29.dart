Future<void> fetchData() async {
  print("Fetching name...");
  await Future.delayed(Duration(seconds: 1));
  print("Name: John Doe");

  print("Fetching roll number...");
  await Future.delayed(Duration(seconds: 1));
  print("Roll Number: 105");

  print("Fetching final result...");
  await Future.delayed(Duration(seconds: 1));
  print("Final Result: Passed (Grade A)");
}

void main() async {
  print("Question 29: Async/Await Sequence");
  await fetchData();
}
