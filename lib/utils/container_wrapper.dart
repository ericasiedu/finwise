import 'package:flutter/material.dart';
import 'package:finwise/utils/color.dart';
import 'package:flutter/services.dart';

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
                 scrolledUnderElevation: 0,
                iconTheme: IconThemeData(color: Colors.white),
                centerTitle: centerTitle,
                automaticallyImplyLeading: leading == null,
                leading: leading,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: primaryColor, // Optional: match app bar color
                  statusBarIconBrightness:
                      Brightness.light, // For Android (light icons)
                  statusBarBrightness: Brightness.dark, // For iOS (dark icons)
                ),
                title:
                    centerTitle
                        ? Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                        : Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
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
                    padding: const EdgeInsets.only(right: 22, top: 20),
                    child: GestureDetector(
                      onTap: onNotificationTap ?? () {},
                      child: const CircleAvatar(
                        backgroundColor: lightGreen,
                        child: Icon(Icons.notifications_outlined),
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: bodyChild,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
