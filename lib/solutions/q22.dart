class Book {
  String title;
  String author;

  // Default constructor
  Book() : title = "Flutter in Action", author = "Unknown";

  // Named constructor
  Book.withDetails(this.title, this.author);

  void display() {
    print("Book Title: $title, Author: $author");
  }
}

void main() {
  print("Question 22: Book Class with Constructors");
  Book myBook = Book();
  myBook.display();

  Book anotherBook = Book.withDetails("Dart Apprentice", "Ray Wenderlich");
  anotherBook.display();
}
