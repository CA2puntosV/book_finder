import 'package:book_finder/models/book_model.dart';

class BookData {
  final List<BookModel> books;
  final bool isLoading;

  BookData(this.books, this.isLoading);
}
