import 'package:flutter/material.dart';
import 'package:flutter_food_app/screens/auth/sign_up_page.dart';
import 'package:flutter_food_app/screens/premium/premium_screen.dart';
import 'package:flutter_food_app/theme/style.dart';
import 'package:flutter_food_app/widgets/button_container_widget.dart';
import 'package:flutter_food_app/widgets/form_container_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMeCheckValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 140),
                  Text(
                    "Log In",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const FormContainerWidget(hintText: "Email or Username"),
                  const SizedBox(height: 20),
                  const FormContainerWidget(hintText: "Password"),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            activeColor: primaryColorED6E1B,
                            value: _rememberMeCheckValue,
                            onChanged: (value) {
                              setState(() {
                                _rememberMeCheckValue = value!;
                              });
                            },
                          ),
                          const Text(
                            "Remember me",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Text(
                        "Forget Password",
                        style: TextStyle(color: primaryColorED6E1B, fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ButtonContainerWidget(
                    title: "Log In",
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PremiumScreen()),
                        (route) => false,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("or"),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _optionSignIn(
                          iconData: FontAwesomeIcons.google, color: redColor),
                      _optionSignIn(
                          iconData: FontAwesomeIcons.facebook,
                          color: Colors.blue[900]!),
                      _optionSignIn(
                          iconData: FontAwesomeIcons.linkedin,
                          color: Colors.blue[600]!),
                    ],
                  ),
                ],
              ),
            ),
            Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpPage()),
                              (route) => false);
                        },
                        child: Text(
                          "Create account",
                          style: TextStyle(fontSize: 15, color: primaryColorED6E1B),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _optionSignIn({required IconData iconData, required Color color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 40,
      height: 40,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
      child: Center(
        child: Icon(
          iconData,
          color: whiteColor,
        ),
      ),
    );
  }
}
