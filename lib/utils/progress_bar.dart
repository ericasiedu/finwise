import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  final BorderRadiusGeometry? borderRadius;
  final String percent;
  final String expenses;
  final TextStyle? percentStyle;
  final TextStyle? expensesStyle;

  const ProgressBar({
    super.key,
    required this.progress,
    this.height = 24.0,
    this.backgroundColor = Colors.white,
    this.progressColor = Colors.black,
    this.borderRadius,
    required this.percent,
    required this.expenses,
    this.percentStyle,
    this.expensesStyle,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadiusGeometry effectiveRadius =
        borderRadius ?? BorderRadius.circular(height / 2);
    final double clampedProgress = progress.clamp(0.0, 1.0);

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          // Background container with rounded corners
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: effectiveRadius,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  expenses,
                  style: expensesStyle ??
                      TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.5,
                      ),
                ),
              ),
            ),
          ),

          // Progress fill with rounded corners
          ClipRRect(
            borderRadius: effectiveRadius,
            child: Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: clampedProgress,
                child: Container(
                  height: height,
                  decoration: BoxDecoration(
                    color: progressColor,
                    borderRadius: effectiveRadius,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        percent,
                        style: percentStyle ??
                            TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.5,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
