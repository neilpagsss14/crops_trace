import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade600,
        appBar: AppBar(
          centerTitle: true,
          title: TextWidget(
            text: "Delivery",
            fontSize: 25,
            color: Colors.black,
            fontFamily: 'Bold',
          ),
        ),
        body: const Column(
          children: [],
        ),
      ),
    );
  }
}
