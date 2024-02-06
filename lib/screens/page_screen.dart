import 'package:crop_traceability/screens/about_us_screen.dart';
import 'package:crop_traceability/screens/main_menu_screen.dart';
import 'package:crop_traceability/screens/notif_screen.dart';
import 'package:crop_traceability/screens/sign_in_screen.dart';
import 'package:crop_traceability/screens/splash_screen.dart';
import 'package:crop_traceability/widgets/drawer_widget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          MainMenu(),
          NotifScreen(),
          AboutUs(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.green,
        buttonBackgroundColor: Colors.transparent,
        color: Colors.white,
        height: 60,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 35,
            color: Colors.black,
          ),
          Icon(
            Icons.notifications,
            size: 35,
            color: Colors.black,
          ),
          Icon(
            Icons.settings,
            size: 35,
            color: Colors.black,
          ),
        ],
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut);
        },
      ),
    );
  }
}
