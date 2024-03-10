import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:book_finder/models/book_model.dart';
import 'package:book_finder/config/app_strings.dart';
import 'package:book_finder/ui/screens/home/home_bloc.dart';
import 'package:book_finder/ui/screens/home/widgets/header.dart';
import 'package:book_finder/ui/screens/home/widgets/all_books.dart';
import 'package:book_finder/ui/screens/home/widgets/random_book.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Header(),
          const RandomBook(),
          const _Filters(),
          Selector<HomeBloc, List<BookModel>>(
            selector: (_, bloc) => bloc.books,
            builder: (_, books, __) {
              return AllBooks(
                title: AppStrings.availableBooks,
                books: books,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Filters extends StatelessWidget {
  const _Filters();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            Text(
              'FILTRO PAGES',
            ),
            Text(
              'FILTRO GENRES',
            ),
          ],
        ),
      ),
    );
  }
}
