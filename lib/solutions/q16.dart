void main() {
  print("Question 16: Null-aware Operators");
  String? careerGoal;

  print("Goal: ${careerGoal ?? "Goal not set yet"}");

  careerGoal ??= "Senior Flutter Developer";
  print("Goal after assignment: $careerGoal");
}
