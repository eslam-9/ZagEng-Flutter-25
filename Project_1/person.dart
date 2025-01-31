
import 'book.dart';

class Person {
  String name;
  List<Book> borrowedBooks = [];

  Person(this.name);

  void showBorrowedBooks() {
    if (borrowedBooks.isEmpty) {
      print("$name has not borrowed any books.");
    } else {
      print("$name has borrowed:");
      for (var book in borrowedBooks) {
        print("- ${book.name} by ${book.author}");
      }
    }
  }
}
