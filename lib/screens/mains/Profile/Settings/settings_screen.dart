import 'package:finwise/screens/mains/Profile/Settings/notification_settings.dart';
import 'package:finwise/screens/mains/Profile/Settings/password_setting.dart';
import 'package:finwise/screens/mains/notification_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
      title: 'Settings',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 50)]),
      bodyChild: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsCard(
              settingTitle: 'Notification Settings',
              icon: Icons.notifications_outlined,
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => NotificationSettings()));
              },
            ),
            SizedBox(height: 20),
            SettingsCard(
              settingTitle: 'Password Settings',
              icon: Icons.key_outlined,
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => PasswordSetting()));
              },
            ),
            SizedBox(height: 20),
            SettingsCard(
              settingTitle: 'Delete Account',
              icon: Icons.person_2_outlined,
              onTap: () {
                
              },
            ),
            SizedBox(height: 17),
          ],
        ),
      ),
    );
  }
}
