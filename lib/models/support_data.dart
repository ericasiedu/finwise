import 'package:flutter/material.dart';

class SupportData {
  final String menuName;
  final String icon;

  const SupportData({required this.menuName, required this.icon});
}

List<SupportData> supportItems = [
  SupportData(menuName: 'Customer Service', icon: 'assets/images/support.png',),
  SupportData(menuName: 'Website', icon: 'assets/images/web.png',),
  SupportData(menuName: 'Facebook', icon: 'assets/images/faceb.png',),
  SupportData(menuName: 'Whatsapp', icon: 'assets/images/watsup.png',),
  SupportData(menuName: 'Instagram', icon: 'assets/images/instagram.png',),
];
