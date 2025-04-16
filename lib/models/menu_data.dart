import 'package:flutter/material.dart';

class MenuData {
  final IconData icon;
  final String menuTitle;

  const MenuData({required this.icon, required this.menuTitle});
}

List<MenuData> menuItems = [
  MenuData(icon: Icons.person_2_outlined, menuTitle: 'Edit Profile'),
  MenuData(icon: Icons.security_outlined, menuTitle: 'Security'),
  MenuData(icon: Icons.settings_outlined, menuTitle: 'Setting'),
  MenuData(icon: Icons.help_outline, menuTitle: 'Help'),
  MenuData(icon: Icons.logout_outlined, menuTitle: 'Logout')
];
