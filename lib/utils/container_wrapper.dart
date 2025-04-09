import 'package:finwise/screens/mains/main_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/custom_input.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';

class ContainerWrapper extends StatelessWidget {
  final Widget headerChild;
  final Widget bodyChild;
  const ContainerWrapper({super.key, required this.headerChild,required this.bodyChild});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreenBg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: primaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(22),
                    child: Expanded(child: headerChild),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: lightGreenBg,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 35, right: 35, bottom: 22),
                child: bodyChild
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
