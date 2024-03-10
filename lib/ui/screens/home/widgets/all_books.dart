import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:book_finder/models/book_model.dart';
import 'package:book_finder/config/app_colors.dart';
import 'package:book_finder/config/app_strings.dart';
import 'package:book_finder/config/app_text_styles.dart';
import 'package:book_finder/ui/screens/home/home_bloc.dart';

class AllBooks extends StatelessWidget {
  const AllBooks({
    required this.title,
    required this.books,
    super.key,
  });

  final String title;
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.subTitlesBold,
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            itemCount: books.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 50,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (_, index) => _BookCard(
              book: books[index],
            ),
          ),
        ],
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  const _BookCard({
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    final Size screen = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.obscureGray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 11),
                  child: Image.network(
                    book.coverUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: screen.width,
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.genre,
                              style: AppTextStyles.graySmall,
                            ),
                            Text(
                              book.title,
                              style: AppTextStyles.whiteMedium,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              book.author.name,
                              style: AppTextStyles.graySmall,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 8,
                        child: Text(
                          '${book.pages} ${AppStrings.pags}',
                          style: AppTextStyles.graySmall.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Selector<HomeBloc, List<BookModel>>(
            selector: (_, bloc) => bloc.savedBooks.toList(),
            builder: (_, savedBooks, __) => Positioned(
              top: 5,
              right: 3,
              child: MouseRegion(
                cursor: MaterialStateMouseCursor.clickable,
                child: GestureDetector(
                  child: Tooltip(
                    message: 'Añadir a lista',
                    child: Icon(
                      savedBooks.contains(book)
                          ? Icons.bookmark
                          : Icons.bookmark_border_outlined,
                      color: AppColors.red,
                    ),
                  ),
                  onTap: () {
                    bloc.addToList(book);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
