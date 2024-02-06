import 'package:crop_traceability/screens/sign_in_screen.dart';
import 'package:crop_traceability/screens/splash_screen.dart';
import 'package:crop_traceability/widgets/drawer_widget.dart';
import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List imageLinks = [
      'docu_1.jpg',
      'docu_2.jpg',
      'docu_3.jpg',
      'docu_4.jpg',
      'docu_5.jpg',
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        drawer: const DrawerWidget(),
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: TextBold(
                text: 'Berna Crop', fontSize: 25, color: Colors.black)),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextBold(
                      text: 'Hello! Welcome Back Customer',
                      fontSize: 20,
                      color: Colors.black),
                  Expanded(child: Container()),
                  const Icon(
                    Icons.person,
                    size: 45,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: CarouselSlider.builder(
                  unlimitedMode: true,
                  slideBuilder: (index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        height: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/${imageLinks[index]}'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                  enableAutoSlider: true,
                  scrollPhysics: const BouncingScrollPhysics(),
                  slideIndicator: CircularSlideIndicator(
                    indicatorRadius: 3,
                    currentIndicatorColor: Colors.white,
                    indicatorBackgroundColor: Colors.grey,
                    padding: const EdgeInsets.only(bottom: 32),
                  ),
                  itemCount: 5),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: MaterialButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: TextRegular(
                          text: 'Proceeding',
                          fontSize: 12,
                          color: Colors.white)));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(60),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.8), BlendMode.dstATop),
                          image: const AssetImage('assets/images/docu_6.jpg'))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextBold(
                          text: 'Book a Delivery',
                          fontSize: 45,
                          color: Colors.amber),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
