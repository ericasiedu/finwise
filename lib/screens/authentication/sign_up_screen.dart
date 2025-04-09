import 'package:finwise/screens/authentication/login_screen.dart';
import 'package:finwise/screens/mains/main_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/custom_input.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              'Create Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
      bodyChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Full Name'),
          SizedBox(height: 5),
          CustomInput(placeHolderText: 'Full Name'),
          SizedBox(height: 15),
          Text('Email'),
          SizedBox(height: 5),
          CustomInput(placeHolderText: 'Email'),
          SizedBox(height: 15),
          Text('Mobile Number'),
          SizedBox(height: 5),
          CustomInput(placeHolderText: '+ 123 456 789', isNumber: true),
          SizedBox(height: 15),
          Text('Date Of Birth'),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: lightGreen,
              hintText: 'DD/MM/YYY',
              hintStyle: TextStyle(color: placeHolderColor),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
            ),
          ),
          SizedBox(height: 15),
          Text('Password'),
          SizedBox(height: 5),
          CustomInput(
            placeHolderText:
                '\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}',
            isPassword: true,
          ),
          SizedBox(height: 15),
          Text('Confirm Password'),
          SizedBox(height: 5),
          CustomInput(
            placeHolderText:
                '\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}',
            isPassword: true,
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                Text('By continuing, you agree to'),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Terms of Use ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                PrimaryButton(
                  title: 'Sign Up',
                  color: primaryColor,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: Colors.black),
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign In',
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
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
