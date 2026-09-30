abstract class Drawable {
  void draw();
}

abstract class Resizable {
  void resize(double factor);
}

class Photo implements Drawable, Resizable {
  String fileName;
  Photo(this.fileName);

  @override
  void draw() {
    print("Drawing photo: $fileName");
  }

  @override
  void resize(double factor) {
    print("Resizing photo $fileName by factor $factor");
  }

  void display() {
    print("Photo Details: File Name = $fileName");
  }
}

void main() {
  print("Question 25: Interfaces Drawable and Resizable");
  Photo myPhoto = Photo("vacation_in_bali.jpg");
  myPhoto.display();
  myPhoto.draw();
  myPhoto.resize(0.5);
}
