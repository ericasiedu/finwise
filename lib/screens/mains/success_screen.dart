import 'dart:math';

import 'package:finwise/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuccessScreen extends StatefulWidget {
  final String successMessage;
  final Widget? nextPage;
  const SuccessScreen({super.key, required this.successMessage, this.nextPage});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        if (widget.nextPage != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => widget.nextPage!),
          );
        } else {
          Navigator.pop(context);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

    double outerRadius = 75;
    double innerRadius = outerRadius - 30;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: outerRadius * 2,
                  height: outerRadius * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 8, color: lightGreen),
                  ),
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    double angle = _controller.value * 2 * pi;
                    return Transform.translate(
                      offset: Offset(innerRadius * cos(angle), innerRadius * sin(angle)),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: 20,
                          height: 20,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: lightGreen,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                widget.successMessage,
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
