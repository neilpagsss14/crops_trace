import 'package:crop_traceability/screens/login_screen.dart';
import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              accountEmail: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.black,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextWidget(
                        text: '09669420116',
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'Regular',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.email,
                        color: Colors.black,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextWidget(
                        text: 'neilpagara50@gmail.com',
                        fontSize: 14,
                        color: Colors.black,
                        fontFamily: 'Regular',
                      ),
                    ],
                  ),
                ],
              ),
              accountName: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextWidget(
                  text: 'Neil Clifford Pagara',
                  fontSize: 18,
                  color: Colors.black,
                  fontFamily: 'Regular',
                ),
              ),
              currentAccountPicture: const Padding(
                padding: EdgeInsets.all(3),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  minRadius: 100,
                  maxRadius: 100,
                  backgroundImage: AssetImage('assets/images/male.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: TextWidget(
                text: 'Home',
                fontSize: 12,
                fontFamily: 'Regular',
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LogIn()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline_rounded,
              ),
              title: TextWidget(
                text: 'About us',
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'Regular',
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LogIn()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.password_rounded,
              ),
              title: TextWidget(
                text: 'Change Password',
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'Regular',
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LogIn()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.account_box_rounded,
              ),
              title: TextWidget(
                text: "User's Profile",
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'Regular',
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LogIn()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: TextWidget(
                text: "Logout",
                fontSize: 12,
                color: Colors.grey,
                fontFamily: 'Regular',
              ),
              onTap: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text(
                            'Logout Confirmation',
                            style: TextStyle(
                                fontFamily: 'QBold',
                                fontWeight: FontWeight.bold),
                          ),
                          content: const Text(
                            'Are you sure you want to Logout?',
                            style: TextStyle(fontFamily: 'QRegular'),
                          ),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text(
                                'Close',
                                style: TextStyle(
                                    fontFamily: 'QRegular',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const LogIn()));
                              },
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    fontFamily: 'QRegular',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
