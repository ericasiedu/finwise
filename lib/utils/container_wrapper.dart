import 'package:flutter/material.dart';
import 'package:finwise/utils/color.dart';

class ContainerWrapper extends StatelessWidget {
  final Widget headerChild;
  final Widget bodyChild;
  final bool centerTitle;
  final String title;
  final bool showAppBar;
  final VoidCallback? onNotificationTap;
  final Widget? leading;

  const ContainerWrapper({
    super.key,
    required this.headerChild,
    required this.bodyChild,
    this.showAppBar = false,
    this.centerTitle = false,
    this.title = '',
    this.onNotificationTap,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreenBg,
      appBar:
          showAppBar
              ? AppBar(
                backgroundColor: primaryColor,
                centerTitle: centerTitle,
                automaticallyImplyLeading: leading == null,
                leading: leading,
                title:
                    centerTitle
                        ? Text(
                          title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                        : Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Hi, welcome back',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Good Morning',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 22),
                    child: GestureDetector(
                      onTap: onNotificationTap ?? () {},
                      child: const CircleAvatar(
                        backgroundColor: lightGreen,
                        child: Icon(Icons.notifications),
                      ),
                    ),
                  ),
                ],
              )
              : null,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: primaryColor,
                  padding: const EdgeInsets.all(22),
                  child: headerChild,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 22,
                ),
                child: bodyChild,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
