import 'package:flutter/material.dart';
import 'package:flutter_food_app/screens/auth/login_page.dart';
import 'package:flutter_food_app/screens/premium/premium_screen.dart';
import 'package:flutter_food_app/theme/style.dart';
import 'package:flutter_food_app/widgets/button_container_widget.dart';
import 'package:flutter_food_app/widgets/form_container_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const FormContainerWidget(hintText: "Username"),
                  const SizedBox(height: 20),
                  const FormContainerWidget(hintText: "Email"),
                  const SizedBox(height: 20),
                  const FormContainerWidget(hintText: "Password"),
                  const SizedBox(height: 20),
                  const FormContainerWidget(hintText: "Phone Number"),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                      Expanded(
                        child: RichText(
                          maxLines: 2,
                          text: TextSpan(
                            text: "By signing up you accept the ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Team of service ",
                                style: TextStyle(color: primaryColorED6E1B),
                              ),
                              TextSpan(
                                text: "and ",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: TextStyle(color: primaryColorED6E1B),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ButtonContainerWidget(
                    title: "Sign Up",
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PremiumScreen()),
                          (route) => false);
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 15, color: primaryColorED6E1B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
