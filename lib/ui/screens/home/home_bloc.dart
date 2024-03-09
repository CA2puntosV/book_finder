import 'package:book_finder/data/services/books_service.dart';
import 'package:book_finder/models/book_model.dart';
import 'package:flutter/material.dart';

class HomeBloc extends ChangeNotifier {
  HomeBloc() {
    getBooks();
  }

  final BooksService _booksService = BooksService();

  List<BookModel> books = [];
  bool isLoading = true;

  void getBooks() async {
    books = await _booksService.getJsonBooks();
    notifyListeners();
    if (books.isNotEmpty) {
      loading();
    }
  }

  void loading() {
    Future.delayed(const Duration(seconds: 2), () {
      isLoading = false;
      notifyListeners();
    });
  }
}
