import 'package:exchange_bs/ui/screens/profile_screen.dart';
import 'package:exchange_bs/ui/screens/watchlist_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'marketview_screen.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      children: const [
        HomeScreen(),
        MarketViewScreen(),
        ProfileScreen(),
        WatchListScreen(),
      ],
    );
  }
}
