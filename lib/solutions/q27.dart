class Account {
  double balance;
  Account(this.balance);
}

mixin InterestCalculator on Account {
  void calculateAndPrintInterest() {
    double interest = balance * 0.05;
    print("Account Balance: $balance");
    print("Interest at 5%: $interest");
  }
}

class SavingsAccount extends Account with InterestCalculator {
  SavingsAccount(double balance) : super(balance);
}

void main() {
  print("Question 27: Mixin with 'on' constraint");
  SavingsAccount myAccount = SavingsAccount(1000.0);
  myAccount.calculateAndPrintInterest();
}
