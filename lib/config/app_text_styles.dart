import 'package:flutter/material.dart';

import 'package:book_finder/config/app_colors.dart';
import 'package:book_finder/config/app_const.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static const baseStyle = TextStyle(
    color: AppColors.black,
    fontFamily: AppConst.fontFamily,
    fontWeight: FontWeight.bold,
  );

  static TextStyle titleBold = baseStyle.copyWith(
    fontSize: 23,
    color: AppColors.black,
  );

  static TextStyle subTitlesBold = baseStyle.copyWith(
    fontSize: 20,
    color: AppColors.black,
  );

  static TextStyle graySmall = baseStyle.copyWith(
    fontSize: 14,
    color: AppColors.gray,
  );
  

  static TextStyle whiteMedium = baseStyle.copyWith(
    fontSize: 18,
    color: AppColors.white,
  );

  // GOOGLE FONTS
  static TextStyle redLora18 = GoogleFonts.lora(
    textStyle: const TextStyle(
      fontSize: 18,
      color: AppColors.red,
      fontWeight: FontWeight.bold,
    ),
  );
}
