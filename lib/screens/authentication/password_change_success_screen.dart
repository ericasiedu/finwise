import 'package:finwise/screens/authentication/login_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordChangeSuccessScreen extends StatefulWidget {
  const PasswordChangeSuccessScreen({super.key});

  @override
  State<PasswordChangeSuccessScreen> createState() =>
      _PasswordChangeSuccessScreenState();
}

class _PasswordChangeSuccessScreenState
    extends State<PasswordChangeSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: primaryColor, // Set the status bar color
        statusBarIconBrightness:
            Brightness.light, // Light icons for dark status bar
      ),
    );

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Password Has Been \n Changed Successfully',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
