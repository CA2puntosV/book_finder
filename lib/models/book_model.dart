import 'package:book_finder/models/author_model.dart';

class BookModel {
  final String title;
  final int pages;
  final String genre;
  final String coverUrl;
  final String synopsis;
  final int year;
  final AuthorModel author;

  BookModel({
    required this.title,
    required this.pages,
    required this.genre,
    required this.coverUrl,
    required this.synopsis,
    required this.year,
    required this.author,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    AuthorModel author = AuthorModel.fromJson(json['author']);

    return BookModel(
      title: json['title'],
      pages: json['pages'],
      genre: json['genre'],
      coverUrl: json['cover'],
      synopsis: json['synopsis'],
      year: json['year'],
      author: author,
    );
  }

  factory BookModel.empty() {
    return BookModel(
      title: '',
      pages: 0,
      genre: '',
      coverUrl: '',
      synopsis: '',
      year: 0,
      author: AuthorModel.empty(),
    );
  }
}
