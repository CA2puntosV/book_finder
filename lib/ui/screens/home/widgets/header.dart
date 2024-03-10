import 'package:book_finder/config/app_colors.dart';
import 'package:book_finder/models/book_model.dart';
import 'package:book_finder/ui/screens/home/widgets/all_books.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:book_finder/config/app_strings.dart';
import 'package:book_finder/config/app_text_styles.dart';
import 'package:book_finder/ui/screens/home/home_bloc.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    final Size screen = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
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
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  bloc.switchListSection();
                },
              ),
            ],
          ),
        ),
        Selector<HomeBloc, bool>(
          selector: (_, bloc) => bloc.openedList,
          builder: (_, opened, __) => AnimatedSize(
            duration: const Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn,
            child: SizedBox(
              width: opened ? screen.width : 0,
              height: opened ? screen.height : 0,
              child: const _SavedBooksList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _SavedBooksList extends StatelessWidget {
  const _SavedBooksList();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 16,
              right: 20,
              left: 20,
              bottom: 45,
            ),
            child: Row(
              children: [
                const Expanded(child: SizedBox()),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    bloc.switchListSection();
                  },
                ),
              ],
            ),
          ),
          Selector<HomeBloc, List<BookModel>>(
            selector: (_, bloc) => bloc.savedBooks.toList(),
            builder: (_, savedBooks, __) {
              return AllBooks(
                title: AppStrings.lectureList,
                books: savedBooks,
              );
            },
          ),
        ],
      ),
    );
  }
}
