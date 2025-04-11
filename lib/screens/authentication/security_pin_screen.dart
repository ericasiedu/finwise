import 'package:finwise/screens/authentication/new_password_screen.dart';
import 'package:finwise/screens/authentication/sign_up_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';

class SecurityPinScreen extends StatefulWidget {
  const SecurityPinScreen({super.key});

  @override
  State<SecurityPinScreen> createState() => _SecurityPinScreenState();
}

class _SecurityPinScreenState extends State<SecurityPinScreen> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  void _onTextChanged(String value, int index) {
    if (value.length == 1) {
      // Move to next field if not last field
      if (index < controllers.length - 1) {
        FocusScope.of(context).requestFocus(focusNodes[index + 1]);
      }
    } else if (value.isEmpty) {
      // Move to previous field if not first field
      if (index > 0) {
        FocusScope.of(context).requestFocus(focusNodes[index - 1]);
      }
    }
  }

  @override
  void dispose() {
    // Clean up controllers and focus nodes
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ContainerWrapper(
      headerChild: Column(
        children: [
          const SizedBox(height: 30),
          const Center(
            child: Text(
              'Security Pin',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
      bodyChild: SingleChildScrollView(
        child: Column(
        children: [
           Center(
            child: Text(
              'Enter Security Pin',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
           SizedBox(height: 20),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: lightGreenBg,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  width: 60,
                  height: 60,
                  child: Center(
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      onChanged: (value) => _onTextChanged(value, index),
                      decoration: InputDecoration(
                        counterText: "",
                        // border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            width: 2.5,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 40),
          PrimaryButton(
            title: 'Accept',
            color: primaryColor,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NewPasswordScreen()),
              );
            },
          ),
          SizedBox(height: 13),
          PrimaryButton(title: 'Send Again', color: lightGreen, onTap: () {}),
          SizedBox(height: 60),
          Text('or sign up with'),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/images/Facebook.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  'assets/images/Google.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Dont't have an account? ",
                  style: TextStyle(color: Colors.black),
                ),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: oceanBlue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      )
    );
  }
}
