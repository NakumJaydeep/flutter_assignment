mixin Coding {
  void codingSkill() => print("I can code in Dart and Flutter.");
}

mixin Cooking {
  void cookingSkill() => print("I can cook delicious pasta.");
}

mixin Gaming {
  void gamingSkill() => print("I am good at strategy games.");
}

class MySkills with Coding, Cooking, Gaming {
  String name;
  MySkills(this.name);

  void display() {
    print("Skills of $name:");
    codingSkill();
    cookingSkill();
    gamingSkill();
  }
}

void main() {
  print("Question 26: Mixins for Skills");
  MySkills myself = MySkills("John Doe");
  myself.display();
}
