import 'package:crop_traceability/screens/delivery_screen.dart';
import 'package:crop_traceability/screens/login_screen.dart';
import 'package:crop_traceability/utils/colors.dart';
import 'package:crop_traceability/widgets/button_widget.dart';
import 'package:crop_traceability/widgets/color_widget.dart';
import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final farmNameController = TextEditingController();

  final addressController = TextEditingController();

  final contactnumberController = TextEditingController();
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
        backgroundColor: const Color(0xff5F8D4E),
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const LogIn()));
                },
                child: const Icon(
                  Icons.login_outlined,
                  size: 25,
                ),
              ),
            )
          ],
          centerTitle: true,
          backgroundColor: primary,
          title: TextWidget(
            text: 'Berna Crop',
            fontSize: 25,
            fontFamily: 'Bold',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      color: primary,
                      text: 'Hello Farmer ',
                      fontSize: 25,
                      fontFamily: 'Bold',
                    ),
                    Expanded(child: Container()),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(7),
                      child: const Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
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
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextWidget(
                          text: 'Crops Delivery',
                          color: primary,
                          fontSize: 30,
                          fontFamily: 'Bold',
                        ),
                        IconButton(
                          iconSize: 60,
                          color: primary,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DeliveryScreen(
                                  farmName: farmNameController.text,
                                  address: addressController.text,
                                  contactNumber: contactnumberController.text,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.arrow_circle_right),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width / 2.25,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: const AssetImage(
                                'assets/images/recent.jpg',
                              ),
                              colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.8),
                                  BlendMode.dstATop),
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
                        height: 150,
                        width: MediaQuery.of(context).size.width / 2.25,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              opacity: 50,
                              image: const AssetImage(
                                'assets/images/facts.jpg',
                              ),
                              colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.8),
                                  BlendMode.dstATop),
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
      ),
    );
  }
}
