class LowAttendanceException implements Exception {
  String name;
  double percentage;
  LowAttendanceException(this.name, this.percentage);

  @override
  String toString() => "LowAttendanceException: $name has low attendance ($percentage%)";
}

void checkAttendance(String name, double percentage) {
  if (percentage < 75) {
    throw LowAttendanceException(name, percentage);
  } else {
    print("$name has sufficient attendance: $percentage%");
  }
}

void main() {
  print("Question 20: Custom Exception");
  try {
    checkAttendance("John Doe", 65.0);
  } catch (e) {
    print(e);
  }
}
