void main() {
  print("Question 14: Weekly Timetable Map");
  Map<String, String> timetable = {
    "Monday": "Math",
    "Tuesday": "Science",
    "Wednesday": "English",
    "Thursday": "History",
    "Friday": "Computer Science"
  };

  timetable.forEach((day, subject) {
    print("$day: $subject");
  });
}
