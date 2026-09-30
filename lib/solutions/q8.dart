void printMarks({required int math, required int science, required int english, required int history}) {
  print("Math: $math, Science: $science, English: $english, History: $history");
}

void main() {
  print("Question 8: Named Parameters for Marks");
  printMarks(math: 85, science: 90, english: 78, history: 88);
}
