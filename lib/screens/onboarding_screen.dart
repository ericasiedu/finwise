import 'package:finwise/utils/color.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Expanded(
                child: Column(
                  children: [Text('sdfsdfs', style: TextStyle(fontSize: 20))],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 40,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child:Padding(padding: EdgeInsets.all(22),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('hello')]),
              ),)
            ),
          ],
        ),
      ),
    );
  }
}
