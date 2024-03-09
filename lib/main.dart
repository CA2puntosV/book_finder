import 'package:flutter/material.dart';

import 'package:book_finder/config/router/router.dart' as router;
import 'package:book_finder/config/router/router_path.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Finder',
      initialRoute: RouterPath.homeRoute,
      onGenerateRoute: router.generateRoute,
    );
  }
}
