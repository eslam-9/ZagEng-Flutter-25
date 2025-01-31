import 'library.dart';
import 'person.dart';
import 'book.dart';

void main() {
  Library library = Library();
  Person user1 = Person("John");

  library.addBook(PhysicalBook("Eslam", "Ali", 15));
  library.addBook(PdfBook("Mahmoud", "Ahmed"));

  library.showBooks();
  library.borrowBook(user1, "Eslam");
  user1.showBorrowedBooks();
}
