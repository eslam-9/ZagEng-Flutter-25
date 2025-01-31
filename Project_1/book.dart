import 'person.dart';

abstract class Book {
  String _name;
  String _author;
  int _num;

  Book(this._name, this._author, this._num);

  String get name => _name;
  String get author => _author;
  int get num => _num;

  void borrowBook(Person person);
}

class PhysicalBook extends Book {
  PhysicalBook(String name, String author, int num) : super(name, author, num);

  @override
  void borrowBook(Person person) {
    if (_num > 0) {
      print("${person.name} borrowed $_name");
      _num--;
      person.borrowedBooks.add(this);
    } else {
      print("No copies left for $_name");
    }
  }
}

class PdfBook extends Book {
  PdfBook(String name, String author) : super(name, author, 0);

  @override
  void borrowBook(Person person) {
    print("PDF books can't be borrowed.");
  }
}
