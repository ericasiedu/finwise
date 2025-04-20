import 'package:finwise/screens/mains/Profile/Settings/settings_screen.dart';
import 'package:finwise/screens/mains/success_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/custom_input.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PasswordSetting extends StatefulWidget {
  const PasswordSetting({super.key});

  @override
  State<PasswordSetting> createState() => _PasswordSettingState();
}

class _PasswordSettingState extends State<PasswordSetting> {
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
      title: 'Password Setting',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 50)]),
      bodyChild: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Password'),
            CustomInput(
              placeHolderText:
                  '\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}',
              isPassword: true,
            ),
            SizedBox(height: 18),
            Text('New Password'),
            CustomInput(
              placeHolderText:
                  '\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}',
              isPassword: true,
            ),
            SizedBox(height: 18),
            Text('Confirm Password'),
            CustomInput(
              placeHolderText:
                  '\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}',
              isPassword: true,
            ),
            SizedBox(height: 50),
            Center(
              child: PrimaryButton(
                title: 'Update Password',
                color: primaryColor,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => SuccessScreen(
                            successMessage:
                                "Password Has been \n Changed successfully",
                            nextPage: SettingsScreen(),
                          ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
