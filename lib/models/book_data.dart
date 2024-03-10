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

class BookList {
  final List<BookModel> books;
  final List<BookModel> filteredBook;
  final String? query;

  BookList(
    this.books,
    this.filteredBook,
    this.query,
  );
}
