class Student {
  String name;
  int rollNumber;
  List<int> marks;

  Student(this.name, this.rollNumber, this.marks);

  double calculateAverage() {
    if (marks.isEmpty) return 0;
    return marks.reduce((a, b) => a + b) / marks.length;
  }

  String getGrade() {
    double avg = calculateAverage();
    if (avg >= 90) return "A+";
    if (avg >= 80) return "A";
    if (avg >= 70) return "B";
    if (avg >= 60) return "C";
    return "F";
  }

  void displayInfo() {
    print("Student: $name, Roll: $rollNumber");
    print("Marks: $marks, Average: ${calculateAverage().toStringAsFixed(2)}, Grade: ${getGrade()}");
  }
}

void main() {
  print("Question 21: Student Class");
  Student s = Student("John Doe", 105, [85, 92, 78]);
  s.displayInfo();
}
