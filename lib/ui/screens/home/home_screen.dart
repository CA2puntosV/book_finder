import 'package:flutter/material.dart';

import 'package:book_finder/ui/screens/home/web/home_web_layout.dart';
import 'package:book_finder/ui/responsive/responsive_layout.dart';
import 'package:book_finder/ui/screens/home/mobile/home_mobile_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileLayout: HomeMobileLayout(),
      webLayout: HomeWebLayout(),
    );
  }
}
