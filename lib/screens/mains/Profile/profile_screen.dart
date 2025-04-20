import 'package:finwise/models/menu_data.dart';
import 'package:finwise/screens/authentication/login_screen.dart';
import 'package:finwise/screens/mains/Profile/edit_screen.dart';
import 'package:finwise/screens/mains/Profile/help_screen.dart';
import 'package:finwise/screens/mains/Profile/Security/security_screen.dart';
import 'package:finwise/screens/mains/Profile/Settings/settings_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final pages = [
    EditScreen(),
    SecurityScreen(),
    SettingsScreen(),
    HelpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: primaryColor, // Set the status bar color
        statusBarIconBrightness:
            Brightness.light, // Light icons for dark status bar
      ),
    );

    return ContainerWrapper(
      showAppBar: true,
      title: 'Profile',
      centerTitle: true,
      isProfilePage: true,
      headerChild: Column(
        children: [SizedBox(height: MediaQuery.of(context).size.height * 0.2)],
      ),
      bodyChild: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index != 4 && index != -1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => pages[index]),
                        );
                      } else if (index == 4) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: lightBlue,
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Icon(
                                menuItems[index].icon,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          menuItems[index].menuTitle,
                          style: TextStyle(fontSize: 19),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(height: 25),
                itemCount: menuItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
