import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:book_finder/models/book_data.dart';
import 'package:book_finder/config/app_colors.dart';
import 'package:book_finder/models/book_model.dart';
import 'package:book_finder/config/app_strings.dart';
import 'package:book_finder/ui/widgets/skeleton.dart';
import 'package:book_finder/config/app_text_styles.dart';
import 'package:book_finder/ui/screens/home/home_bloc.dart';

class RandomBook extends StatelessWidget {
  const RandomBook({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.randomBook,
              style: AppTextStyles.subTitlesBold,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: screen.width,
              child: Selector<HomeBloc, BookData>(
                selector: (_, bloc) => BookData(
                  bloc.books,
                  bloc.randomBook,
                  bloc.isLoading,
                ),
                builder: (_, data, __) {
                  bool isLoading = data.isLoading;
                  BookModel book = data.randomBook;

                  if (isLoading) {
                    return const _BookLoader();
                  } else {
                    return _LoadedBook(
                      book: book,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoadedBook extends StatelessWidget {
  const _LoadedBook({
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Container(
      width: screen.width,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              child: Image.network(book.coverUrl)
              // FadeInImage(
              //   //TODO: FIX PLACE HOLDER SAME SIZE
              //   placeholder: const AssetImage(AppAssets.imageLoader),
              //   image: NetworkImage(book.coverUrl),
              // ),
              ),
          Flexible(
            child: Padding(
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
                  Text(
                    book.synopsis,
                    style: AppTextStyles.redLora18,
                  ),
                  Text(
                    book.author.name,
                    style: AppTextStyles.graySmall,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BookLoader extends StatelessWidget {
  const _BookLoader();

  @override
  Widget build(BuildContext context) {
    final Size screen = MediaQuery.of(context).size;

    return Skeleton(
      width: screen.width,
      height: 200,
      child: Row(
        children: [
          Skeleton(
            width: screen.width / 4,
            height: 200,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(
                  width: screen.width / 3,
                  height: 20,
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Expanded(
                      child: Skeleton(
                        height: 35,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Expanded(
                      child: Skeleton(
                        height: 60,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Expanded(
                      child: Skeleton(
                        height: 25,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Skeleton(
                        height: 25,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
