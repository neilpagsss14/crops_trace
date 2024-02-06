import 'package:crop_traceability/screens/page_screen.dart';
import 'package:crop_traceability/screens/main_menu_screen.dart';
import 'package:crop_traceability/widgets/button_widget.dart';
import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:crop_traceability/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  late String _password;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey,
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage('assets/images/vegetables.webp'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(.5), BlendMode.dstOut)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.5),
                radius: 100,
                child: Image.asset(
                  'assets/images/crop.png',
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextFieldWidget(
                  hint: 'Enter Email',
                  isObscure: false,
                  showEye: false,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }

                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: TextFieldWidget(
                  hint: 'Enter Password',
                  isObscure: true,
                  showEye: true,
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }

                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ButtonWidget(
                  label: 'Log in',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: TextRegular(
                            text: 'Successfully Log in',
                            fontSize: 12,
                            color: Colors.white)));
                  },
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: TextRegular(
                          text: 'Invalid Entry',
                          fontSize: 12,
                          color: Colors.white)));
                },
                child: TextRegular(
                    text: 'Log in as Admin', fontSize: 15, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
