void main() {
  List<int> marks = [45, 60, 35, 80, 55, 48];
  print("Question 12: Grace Marks and Filtering");
  print("Original Marks: $marks");

  var graceMarks = marks.map((m) => m + 5).toList();
  print("After adding 5 grace marks: $graceMarks");

  var passed = graceMarks.where((m) => m >= 50).toList();
  print("Filtered (>= 50): $passed");
}
