import 'package:crop_traceability/utils/colors.dart';
import 'package:crop_traceability/widgets/button_widget.dart';
import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final name = "Arvy Cntnen";
  @override
  Widget build(BuildContext context) {
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
          body: Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 15),
            child: SingleChildScrollView(
              child: Center(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonWidget(
                            color: primary,
                            width: 10,
                            fontSize: 20,
                            height: 45,
                            fontFamily: 'Bold',
                            label: 'Add Crops',
                            onPressed: () {}),
                        ButtonWidget(
                            color: primary,
                            fontFamily: 'Bold',
                            fontSize: 20,
                            width: 10,
                            height: 45,
                            label: 'Submit',
                            onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
