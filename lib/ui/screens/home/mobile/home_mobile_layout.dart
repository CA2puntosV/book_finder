import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:book_finder/models/book_data.dart';
import 'package:book_finder/config/app_borders.dart';
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
          Selector<HomeBloc, BookList>(
            selector: (_, bloc) => BookList(
              bloc.books,
              bloc.fiteredBooks,
              bloc.query,
            ),
            builder: (_, data, __) {
              return data.query != null && data.filteredBook.isEmpty
                  ? Text('vacio')
                  : AllBooks(
                      title: AppStrings.availableBooks,
                      books:
                          data.query != null ? data.filteredBook : data.books,
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
    final bloc = context.read<HomeBloc>();

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Buscar',
                        contentPadding: const EdgeInsets.only(left: 10),
                        border: AppBorders.textfield,
                        enabledBorder: AppBorders.textfield,
                        focusedBorder: AppBorders.textfield,
                      ),
                      onChanged: (value) {
                        bloc.searchBooks(value);
                      },
                    ),
                  ),
                ),
                // Expanded(
                //   child: Slider.adaptive(
                //     min: 1,
                //     max: 200,
                //     value: 1,
                //     onChanged: (value) {},
                //   ),
                // ),
                // Expanded(
                //   child: Text(
                //     'FILTRO GENRES',
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
