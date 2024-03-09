import 'dart:convert';
import 'package:book_finder/models/book_model.dart';
import 'package:flutter/services.dart';

import 'package:book_finder/config/app_const.dart';

class BooksService {
  Future<List<BookModel>> getJsonBooks() async {
    final String response = await rootBundle.loadString(AppConst.jsonData);

    final data = await json.decode(response);

    List<dynamic> booksJsonList = data['library'];

    List<BookModel> books = booksJsonList.map((json) {
      return BookModel.fromJson(json['book']);
    }).toList();

    return books;
  }
}
