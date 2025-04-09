import 'package:finwise/screens/authentication/login_screen.dart';
import 'package:finwise/screens/authentication/sign_up_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: lightGreenBg, // Set the status bar color
        statusBarIconBrightness:
            Brightness.light, // Light icons for dark status bar
      ),
    );

    return Scaffold(
      backgroundColor: lightGreenBg,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo-green.png', fit: BoxFit.cover),
              SizedBox(height: 6),
              Text(
                'FinWise',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed do eiusmod. ',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              PrimaryButton(
                title: 'Login',
                color: primaryColor,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              SizedBox(height: 14),
              PrimaryButton(
                title: 'Sign Up',
                color: lightGreen,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
              ),
              SizedBox(height: 8),
              TextButton(onPressed: () {}, child: Text('Forgot Password?')),
            ],
          ),
        ),
      ),
    );
  }
}
