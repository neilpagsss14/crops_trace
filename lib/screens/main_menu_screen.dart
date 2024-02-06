import 'package:crop_traceability/widgets/button_widget.dart';
import 'package:crop_traceability/widgets/color_widget.dart';

import 'package:crop_traceability/widgets/text_widget.dart';

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
        backgroundColor: Colors.green.shade600,
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
                      color: Colors.white),
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
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: ButtonWidget(
                          label: 'Book a Delivery',
                          onPressed: () {},
                          color: Colors.white,
                          textcolor: Colors.red,
                          fontSize: 15,
                          radius: 200,
                          height: 30,
                          width: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      height: 125,
                      width: MediaQuery.of(context).size.width / 2.25,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(
                              'assets/images/recent.jpg',
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ButtonWidget(
                              color: Colors.white,
                              textcolor: grey,
                              radius: 100,
                              fontSize: 12,
                              width: 60,
                              height: 25,
                              label: 'Recent Deliveries',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      height: 125,
                      width: MediaQuery.of(context).size.width / 2.25,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            opacity: 50,
                            image: AssetImage(
                              'assets/images/facts.jpg',
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ButtonWidget(
                              color: Colors.white,
                              textcolor: grey,
                              radius: 100,
                              fontSize: 12,
                              width: 60,
                              height: 25,
                              label: 'Facts',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
