import 'dart:async';

import 'package:book_finder/config/app_const.dart';
import 'package:book_finder/config/app_strings.dart';
import 'package:book_finder/config/app_text_styles.dart';
import 'package:book_finder/models/book_data.dart';
import 'package:book_finder/models/book_model.dart';
import 'package:book_finder/ui/screens/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    print('all DSCRE');

    return Scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _HeaderAndSearch(),
          const _RandomBook(),
          const _Filters(),
          _AllBooks(),
        ],
      ),
    );
  }
}

class _HeaderAndSearch extends StatelessWidget {
  const _HeaderAndSearch();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
        right: 20,
        left: 20,
        bottom: 45,
      ),
      child: Row(
        children: [
          Text(
            AppStrings.happyReading,
            style: AppTextStyles.titleBold,
          ),
          const Expanded(child: SizedBox()),
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {},
          // )
        ],
      ),
    );
  }
}

class _RandomBook extends StatelessWidget {
  const _RandomBook();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;
    final bloc = context.watch<HomeBloc>();

    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.randomBook,
                    style: AppTextStyles.subTitlesBold,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Selector<HomeBloc, BookData>(
                            selector: (_, bloc) => BookData(
                              bloc.books,
                              bloc.isLoading,
                            ),
                            builder: (_, data, __) {
                              List<BookModel> books = data.books;
                              bool isLoading = data.isLoading;

                              print(isLoading);

                              // BookModel book = AppConst().getRandomElement(
                              //   books,
                              // );
                              // print('BOOK $book');
                              //https://www.youtube.com/watch?v=-SpAkwgPIHU&t=51s

                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: screen.width,
                                height: 200,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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

class _AllBooks extends StatelessWidget {
  const _AllBooks();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Selector<HomeBloc, List<BookModel>>(
        selector: (_, bloc) => bloc.books,
        builder: (_, books, __) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: books.length,
            itemBuilder: (_, index) => Text(books[index].title),
          );
        },
      ),
    );
  }
}
