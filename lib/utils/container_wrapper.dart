import 'package:finwise/screens/mains/notification_screen.dart';
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
  final bool isProfilePage;
  final bool isEdit;
  final VoidCallback? imageTap;

  const ContainerWrapper({
    super.key,
    required this.headerChild,
    required this.bodyChild,
    this.showAppBar = false,
    this.centerTitle = false,
    this.title = '',
    this.onNotificationTap,
    this.leading,
    this.isProfilePage = false,
    this.isEdit = false,
    this.imageTap
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
                  statusBarColor: primaryColor,
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.dark,
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
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(),
                          ),
                        );
                      },
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
                // Primary color container (goes to back)
                Container(
                  width: double.infinity,
                  color: primaryColor,
                  padding: const EdgeInsets.all(22),
                  child: headerChild,
                ),

                // Light green background with rounded top (middle layer)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: isProfilePage ? 120 : 50,
                    decoration: const BoxDecoration(
                      color: lightGreenBg,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                  ),
                ),

                // Light blue circle avatar (top layer)
                if (isProfilePage)
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10, // Position at the very bottom of the Stack
                    child: Center(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                height: 117,
                                width: 117,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/profile-pic.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              if (isEdit)
                                GestureDetector(
                                  onTap: imageTap,
                                  child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryColor,
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                )
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Eric Asiedu',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
