import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key, required this.controller});

  final PageController controller;
  var activeIndex = 0;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final primaryColorLight = Theme.of(context).primaryColorLight;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: BottomNavigationBar(
          currentIndex: widget.activeIndex,
          onTap: (index) {
            setState(() {
              widget.activeIndex = index;


            });
            widget.controller.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          selectedItemColor: primaryColorLight,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: 'Market'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: 'Watchlist'),
          ]),
    );
  }
}
