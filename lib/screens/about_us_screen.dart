import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    List imageLinks = [
      'about_1.JPG',
      'about_2.jpg',
      'about_3.jpeg',
    ];
    return Scaffold(
      backgroundColor: Colors.green.shade600,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: TextWidget(
          text: 'About Us',
          fontSize: 25,
          fontFamily: 'Bold',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
            child: SizedBox(
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
                  itemCount: 3),
            ),
          ),
        ],
      ),
    );
  }
}
