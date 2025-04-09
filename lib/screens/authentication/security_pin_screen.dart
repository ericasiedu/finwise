import 'package:finwise/utils/container_wrapper.dart';
import 'package:flutter/material.dart';

class SecurityPinScreen extends StatefulWidget {
  const SecurityPinScreen({super.key});

  @override
  State<SecurityPinScreen> createState() => _SecurityPinScreenState();
}

class _SecurityPinScreenState extends State<SecurityPinScreen> {
  @override
  Widget build(BuildContext context) {
    return ContainerWrapper(
      headerChild: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: Text(
              'Security Pin',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 100),
        ],
      ), 
      bodyChild: Column(
        children: [
          Center(
            child: Text(
            'Enter Security Pin',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          )
        ],
      ));
  }
}