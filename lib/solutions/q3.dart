void main() {
  String day = "Monday"; // Change based on current day
  print("Question 3: Switch Statement for Weekdays");
  
  switch (day) {
    case "Monday":
      print("It's Monday, start of the work week!");
      break;
    case "Tuesday":
      print("It's Tuesday, keeping the momentum.");
      break;
    case "Wednesday":
      print("It's Wednesday, mid-week peak.");
      break;
    case "Thursday":
      print("It's Thursday, almost there.");
      break;
    case "Friday":
      print("It's Friday, weekend is coming!");
      break;
    case "Saturday":
      print("It's Saturday, time to relax.");
      break;
    case "Sunday":
      print("It's Sunday, prepare for next week.");
      break;
    default:
      print("Invalid day.");
  }
}
