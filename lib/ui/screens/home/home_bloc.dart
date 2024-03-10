import 'dart:async';

import 'package:book_finder/config/app_const.dart';
import 'package:book_finder/data/services/books_service.dart';
import 'package:book_finder/models/book_model.dart';
import 'package:flutter/material.dart';

class HomeBloc extends ChangeNotifier {
  HomeBloc() {
    getBooks();
  }

  final BooksService _booksService = BooksService();

  List<BookModel> books = [];
  List<BookModel> fiteredBooks = [];

  Set<BookModel> savedBooks = {};

  BookModel randomBook = BookModel.empty();

  bool isLoading = true;
  bool openedList = false;

  String? query;

  void getBooks() async {
    books = await _booksService.getJsonBooks();
    notifyListeners();
    if (books.isNotEmpty) {
      loading();
      getRandomBook();
    }
  }

  void searchBooks(String value) async {
    if (value.isNotEmpty) {
      fiteredBooks = books.where((book) {
        return book.title.toLowerCase().contains(
              value.toLowerCase(),
            );
      }).toList();
      query = value;
    } else {
      fiteredBooks = [];
      query = null;
    }

    notifyListeners();
  }

  void loading() {
    Future.delayed(const Duration(seconds: 2), () {
      isLoading = false;
      notifyListeners();
    });
  }

  void getRandomBook() {
    randomBook = AppConst().getRandomElement(
      books,
    );

    if (randomBook != BookModel.empty()) {
      Timer.periodic(const Duration(seconds: 15), (timer) {
        randomBook = AppConst().getRandomElement(
          books,
        );
        notifyListeners();
      });
    }

    notifyListeners();
  }

  void addToList(BookModel book) {
    savedBooks.add(book);

    notifyListeners();
  }

  void switchListSection() {
    openedList = !openedList;
    notifyListeners();
  }

}
