import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: TextBold(text: 'About us', fontSize: 25, color: Colors.black)),
    );
  }
}
