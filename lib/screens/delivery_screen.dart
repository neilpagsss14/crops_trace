import 'package:crop_traceability/utils/colors.dart';
import 'package:crop_traceability/widgets/button_widget.dart';
import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final name = "Arvy Cntnen";

  @override
  Widget build(BuildContext context) {
    Widget buildClickableCard(String imagePath, String cropName) {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: TextWidget(text: 'Hello Arvy Cntnen', fontSize: 20)));
          },
          child: SizedBox(
            height: 200,
            child: Card(
              color: primary,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(15),
                      ),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                    ),
                    child: TextWidget(
                      text: cropName,
                      fontSize: 25,
                      fontFamily: 'Bold',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        appBar: AppBar(
          centerTitle: true,
          title: TextWidget(
            text: "Delivery",
            fontSize: 25,
            color: Colors.black,
            fontFamily: 'Bold',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
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
                      const SizedBox(
                        width: 10,
                      ),
                      TextWidget(
                        text: 'Hello Farmer $name',
                        fontSize: 20,
                        color: primary,
                        fontFamily: 'Bold',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonWidget(
                        color: primary,
                        width: 10,
                        fontSize: 20,
                        height: 45,
                        textcolor: background,
                        fontFamily: 'Bold',
                        label: 'Add Crops',
                        onPressed: () {},
                      ),
                      ButtonWidget(
                        color: primary,
                        fontFamily: 'Bold',
                        fontSize: 20,
                        width: 10,
                        height: 45,
                        label: 'submit',
                        textcolor: background,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          buildClickableCard(
                              'assets/images/cabbage.webp', 'Cabbage'),
                          const SizedBox(width: 8),
                          buildClickableCard(
                              'assets/images/eggplant.png', 'Eggplant'),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          buildClickableCard(
                              'assets/images/carrots.png', 'Carrots'),
                          const SizedBox(width: 8),
                          buildClickableCard(
                              'assets/images/potato.png', 'Potato'),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          buildClickableCard(
                              'assets/images/pechay.png', 'Pechay'),
                          const SizedBox(width: 8),
                          buildClickableCard(
                              'assets/images/onions.png', 'Onions'),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          buildClickableCard(
                              'assets/images/garlic.png', 'Garlic'),
                          const SizedBox(width: 8),
                          buildClickableCard(
                              'assets/images/ginger.png', 'Ginger'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
