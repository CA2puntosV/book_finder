import 'dart:math';

class AppConst {
  static const String fontFamily = 'JosefinSans';
  static const String jsonData = 'lib/data/books.json';

  T getRandomElement<T>(List<T> list) {
    final random = Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}
