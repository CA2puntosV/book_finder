import 'package:flutter/material.dart';

enum ScreenType { mobile, tablet, web }

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    required this.webLayout,
    this.tabletLayout,
  });

  final Widget mobileLayout;
  final Widget webLayout;
  final Widget? tabletLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double screenWidth = constraints.maxWidth;
      final double screenHeight = constraints.maxHeight;

      final ScreenType screenType = _getScreenType(
        width: screenWidth,
        height: screenHeight,
      );

      switch (screenType) {
        case ScreenType.web:
          return webLayout;
        case ScreenType.tablet:
          if (tabletLayout != null) {
            return tabletLayout!;
          } else {
            return mobileLayout;
          }
        case ScreenType.mobile:
          return mobileLayout;
      }
    });
  }

  ScreenType _getScreenType({
    required double width,
    required double height,
  }) {
    if (width > 900) {
      return ScreenType.web;
    } else if (width >= 600) {
      return ScreenType.tablet;
    } else {
      return ScreenType.mobile;
    }
  }
}
