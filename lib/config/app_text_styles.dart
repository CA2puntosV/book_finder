import 'package:flutter/material.dart';

import 'package:book_finder/config/app_colors.dart';
import 'package:book_finder/config/app_const.dart';

class AppTextStyles {
  static const baseStyle = TextStyle(
    fontFamily: AppConst.fontFamily,
    color: AppColors.black,
  );

  static TextStyle titleBold = baseStyle.copyWith(
    fontSize: 23,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle subTitlesBold = baseStyle.copyWith(
    fontSize: 20,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );
}
