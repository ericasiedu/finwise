import 'package:finwise/screens/mains/main_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/custom_input.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: primaryColor, // Set the status bar color
        statusBarIconBrightness:
            Brightness.light, // Light icons for dark status bar
      ),
    );

    return ContainerWrapper(
      headerChild: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
              'Welcome',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
      bodyChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Username Or Email'),
          SizedBox(height: 5),
          CustomInput(placeHolderText: 'example@example.com'),
          SizedBox(height: 15),
          Text('Password'),
          SizedBox(height: 5),
          CustomInput(placeHolderText: '\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}', isPassword: true),
          SizedBox(height: 40),
          Center(
            child: Column(
              children: [
                PrimaryButton(
                  title: 'Login',
                  color: primaryColor,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                ),
                // SizedBox(height: 2),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                // SizedBox(height: 2),
                PrimaryButton(
                  title: 'Sign Up',
                  color: lightGreen,
                  onTap: () {},
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Use ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Fingerprint',
                        style: TextStyle(
                          color: oceanBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'In Account',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
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
                          onTap: () {},
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
          ),
        ],
      ),
    );
  }
}
