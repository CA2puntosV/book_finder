import 'package:book_finder/models/book_model.dart';

class BookData {
  final List<BookModel> books;
  final BookModel randomBook;
  final bool isLoading;

  BookData(
    this.books,
    this.randomBook,
    this.isLoading,
  );
}
