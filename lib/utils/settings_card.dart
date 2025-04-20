import 'package:finwise/utils/color.dart';
import 'package:flutter/material.dart';

class SettingsCard extends StatelessWidget {
  final String settingTitle;
  final IconData icon;
  final VoidCallback onTap;
  const SettingsCard({
    super.key,
    required this.settingTitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Icon(icon)),
            ),
            SizedBox(width: 10),
            Text(
              settingTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward_ios, size: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
