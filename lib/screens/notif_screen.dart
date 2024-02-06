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
      backgroundColor: Colors.green.shade600,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: TextBold(
              text: 'Notifications', fontSize: 25, color: Colors.black)),
      body: Expanded(
        child: SizedBox(
          child: ListView.builder(itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: ListTile(
                  title: TextBold(
                      text: 'Admin has received your bookings',
                      fontSize: 16,
                      color: Colors.black),
                  subtitle: TextBold(
                      text: '1 minute ago', fontSize: 12, color: Colors.grey),
                  leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.person),
                      iconSize: 40),
                  trailing: IconButton(
                    onPressed: (() {}),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          })),
        ),
      ),
    );
  }
}
