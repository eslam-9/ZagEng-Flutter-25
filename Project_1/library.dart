import 'book.dart';
import 'person.dart';

class Library {
  List<Book> books = [];

  void addBook(Book book) {
    books.add(book);
  }

  void showBooks() {
    int i = 1;
    for (var book in books) {
      print("($i) The book name is ${book.name}, written by ${book.author}");
      i++;
    }
  }

  void borrowBook(Person person, String bookName) {
    for (var book in books) {
      if (book.name.toLowerCase() == bookName.toLowerCase()) {
        book.borrowBook(person);
        return;
      }
    }
    print("Book not found.");
  }
}

