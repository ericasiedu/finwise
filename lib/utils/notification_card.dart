import 'package:finwise/utils/color.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String contents;
  final String time;
  const NotificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.contents,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(child: Icon(icon, size: 26)),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 20)),
                  SizedBox(height: 4),
                  Text(contents),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(time, style: TextStyle(fontSize: 16, color: oceanBlue)),
          ],
        ),
        SizedBox(height: 7),
        Container(width: double.infinity, height: 1, color: primaryColor),
      ],
    );
  }
}
