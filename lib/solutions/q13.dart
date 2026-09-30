void main() {
  print("Question 13: Set Operations");
  Set<String> myHobbies = {"Reading", "Coding", "Gaming", "Hiking"};
  Set<String> friendHobbies = {"Gaming", "Hiking", "Cooking", "Photography"};

  print("My Hobbies: $myHobbies");
  print("Friend's Hobbies: $friendHobbies");

  print("Union: ${myHobbies.union(friendHobbies)}");
  print("Intersection: ${myHobbies.intersection(friendHobbies)}");
  print("Difference (My - Friend): ${myHobbies.difference(friendHobbies)}");
}
