import 'package:flutter/material.dart';

class SecurityData {
  final String title;

  const SecurityData({required this.title});
}

List<SecurityData> securityItems = [
  SecurityData(title: 'Change Pin'),
  SecurityData(title: 'Finger Print'),
  SecurityData(title: 'Terms And Conditions'),
];
