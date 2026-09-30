double calculateSimpleInterest(double principal, double rate, double time) {
  return (principal * rate * time) / 100;
}

void main() {
  print("Question 6: Simple Interest Calculation");
  
  print("Result 1: ${calculateSimpleInterest(1000, 5, 2)}");
  print("Result 2: ${calculateSimpleInterest(5000, 7.5, 3)}");
  print("Result 3: ${calculateSimpleInterest(10000, 4, 5)}");
}
