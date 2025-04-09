import 'package:finwise/utils/color.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback? onTap;
  final double? width;
  const PrimaryButton({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
    this.width 
  });

  @override
  Widget build(BuildContext context) {
    final containerWidth = width ??  MediaQuery.of(context).size.width * 0.45;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: containerWidth,
        height: 48,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
