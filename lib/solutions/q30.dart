Stream<int> rollNumberStream(int rollNumber) async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield rollNumber * i;
  }
}

void main() async {
  int rollNumber = 105;
  print("Question 30: Stream of Roll Number Multiples");
  
  await for (int value in rollNumberStream(rollNumber)) {
    print("Emitted value: $value");
  }
}
