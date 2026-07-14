class Book {
  String title;
  String author;
  double price;

  Book(this.title, this.author, this.price);

  void showDetail() {
    print("ชื่อหนังสือ: $title");
    print("ผู้แต่ง: $author");
    print("ราคา: $price บาท");
    print("-------------------");
  }
}

void main() {
  Book book1 = Book("Flutter for Beginners", "John Smith", 450);
  Book book2 = Book("Dart Programming", "Jane Doe", 390);

  book1.showDetail();
  book2.showDetail();
}