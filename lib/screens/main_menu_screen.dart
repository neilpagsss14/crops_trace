import 'package:crop_traceability/widgets/drawer_widget.dart';
import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            title: TextBold(
                text: 'Berna Crop', fontSize: 25, color: Colors.black)),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
