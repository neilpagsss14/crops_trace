import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class NotifScreen extends StatefulWidget {
  const NotifScreen({super.key});

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: TextBold(
              text: 'Notifications', fontSize: 25, color: Colors.black)),
    );
  }
}
