import 'package:crop_traceability/utils/colors.dart';
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
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: TextWidget(
          text: "Notifications",
          fontSize: 25,
          color: Colors.black,
          fontFamily: 'Bold',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: ListView.builder(itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  child: Card(
                    color: Colors.white,
                    elevation: 10,
                    child: ListTile(
                      title: TextWidget(
                        text: "Admin has received your bookings",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      subtitle: TextWidget(
                        text: "1 min ago",
                        fontSize: 12,
                        color: Colors.grey,
                      ),
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
          ElevatedButton(
            onPressed: () {
              dispose();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: TextWidget(
              text: "Mark all as read",
              fontSize: 15,
              color: Colors.green,
              fontFamily: 'Regular',
            ),
          )
        ],
      ),
    );
  }
}
