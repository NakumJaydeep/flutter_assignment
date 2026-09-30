void main() {
  int rollNumber = 105;
  print("Question 5: Even Numbers between 1 and $rollNumber");
  
  int i = 1;
  while (i <= rollNumber) {
    if (i % 2 == 0) {
      print(i);
    }
    i++;
  }
}
