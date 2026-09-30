Future<String> fetchCollegeName() async {
  return Future.delayed(Duration(seconds: 2), () => "XYZ Institute of Technology");
}

void main() {
  print("Question 28: Async function with .then()");
  
  fetchCollegeName().then((value) {
    print("Fetched College Name: $value");
  });

  print("This message prints immediately before the delay completes.");
}
