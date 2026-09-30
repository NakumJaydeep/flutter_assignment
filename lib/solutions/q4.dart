void main() {
  int rollNumber = 105;
  int lastDigit = rollNumber % 10;
  
  print("Question 4: Multiplication Table of $lastDigit");
  for (int i = 1; i <= 10; i++) {
    print("$lastDigit x $i = ${lastDigit * i}");
  }
}
