void main() {
  print("Question 15: Map with putIfAbsent");
  Map<String, String> friendsColors = {
    "Alice": "Blue",
    "Bob": "Green",
    "Charlie": "Red",
    "David": "Yellow",
    "Eve": "Purple"
  };

  print("Initial Map: $friendsColors");

  // Adding myself if not present
  friendsColors.putIfAbsent("John Doe", () => "Cyan");
  print("After putIfAbsent: $friendsColors");
}
