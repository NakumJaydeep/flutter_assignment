class Person {
  String name;
  Person(this.name);

  void displayRole() {
    print("I am a Person named $name.");
  }
}

class Teacher extends Person {
  String favoriteSubject;

  Teacher(String name, this.favoriteSubject) : super(name);

  @override
  void displayRole() {
    print("I am a Teacher named $name and I love teaching $favoriteSubject.");
  }
}

void main() {
  print("Question 23: Inheritance (Teacher extends Person)");
  Teacher myTeacher = Teacher("John Doe", "Computer Science");
  myTeacher.displayRole();
}
