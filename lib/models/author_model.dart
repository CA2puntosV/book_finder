class AuthorModel {
  final String name;
  final List<String> otherBooks;

  AuthorModel({
    required this.name,
    required this.otherBooks,
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    final List<String> books =
        (json['otherBooks'] as List? ?? []).map((book) => '$book').toList();

    return AuthorModel(
      name: json['name'],
      otherBooks: books,
    );
  }

  factory AuthorModel.empty() {
    return AuthorModel(
      name: '',
      otherBooks: [],
    );
  }
}
