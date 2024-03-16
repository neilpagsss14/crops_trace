import 'package:crop_traceability/screens/login_screen.dart';
import 'package:crop_traceability/screens/page_screen.dart';
import 'package:crop_traceability/services/add_user.dart';
import 'package:crop_traceability/utils/colors.dart';
import 'package:crop_traceability/widgets/button_widget.dart';
import 'package:crop_traceability/widgets/text_widget.dart';
import 'package:crop_traceability/widgets/textfield_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final farmNameController = TextEditingController();

  final addressController = TextEditingController();

  final contactnumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          centerTitle: true,
          title: TextWidget(
            text: 'Signup Page',
            fontSize: 25,
            fontFamily: 'Bold',
          )),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage('assets/images/vegetables.webp'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(.5), BlendMode.dstOut)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  TextFieldWidget(
                    prefixIcon: Icons.person,
                    textCapitalization: TextCapitalization.words,
                    hint: 'Farm Name',
                    controller: farmNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    prefixIcon: Icons.phone,
                    textCapitalization: TextCapitalization.none,
                    inputType: TextInputType.number,
                    hint: 'Contact Number',
                    controller: contactnumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a contact number';
                      } else if (value.length != 11 ||
                          !value.startsWith('09')) {
                        return 'Please enter a valid contact number';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    prefixIcon: Icons.location_on,
                    textCapitalization: TextCapitalization.words,
                    hint: 'Address',
                    controller: addressController,
                    inputType: TextInputType.streetAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    prefixIcon: Icons.email,
                    textCapitalization: TextCapitalization.none,
                    hint: 'Email',
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      }
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    textCapitalization: TextCapitalization.none,
                    showEye: true,
                    isObscure: true,
                    prefixIcon: Icons.lock,
                    hint: 'Password',
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    textCapitalization: TextCapitalization.none,
                    showEye: true,
                    isObscure: true,
                    prefixIcon: Icons.lock,
                    hint: 'Confirm Password',
                    controller: confirmpasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      if (value != passwordController.text) {
                        return 'Password do not match';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonWidget(
                    radius: 100,
                    fontSize: 20,
                    textcolor: Colors.white,
                    color: background,
                    fontFamily: "Regular",
                    label: 'Sign-up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        register(context);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        color: primary,
                        text: 'Already have an account?',
                        fontSize: 14,
                        fontFamily: 'Bold',
                      ),
                      ButtonWidget(
                        label: 'Login',
                        color: background,
                        textcolor: primary,
                        fontSize: 20,
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()));
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  register(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      addUser(farmNameController.text, contactnumberController.text,
          addressController.text, emailController.text);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: TextWidget(
              text: 'Account created succesfully!',
              fontSize: 12,
              color: primary)));

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: TextWidget(
                text: 'The password provided is too weak.',
                fontSize: 12,
                color: primary)));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: TextWidget(
                text: 'The account already exists for that email.',
                fontSize: 12,
                color: primary)));
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: TextWidget(
                text: 'The email address is not valid.',
                fontSize: 12,
                color: primary)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                TextWidget(text: '$e.toString', fontSize: 12, color: primary)));
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: TextWidget(
              text: 'An error occurred: $e', fontSize: 12, color: primary)));
    }
  }
}
