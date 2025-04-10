import 'package:finwise/screens/mains/main_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FingerprintScreen extends StatefulWidget {
  const FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
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
          const SizedBox(height: 30),
          const Center(
            child: Text(
              'Security Fingerprint',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
      bodyChild: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              child: Container(
                width: 195,
                height: 195,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(97.5),
                ),
                child: Center(
                  child: Icon(
                    Icons.fingerprint_outlined,
                    size: 140,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Use fingerprint  to access',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. ',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            PrimaryButton(
              title: 'Use Touch ID',
              color: lightGreen,
              onTap: () {},
              width: double.infinity,
            ),
            SizedBox(height: 30),
            Text('Or prefer use pin code?'),
          ],
        ),
      ),
    );
  }
}
