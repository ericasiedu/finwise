import 'package:finwise/screens/mains/Profile/Security/finger_print_screen.dart';
import 'package:finwise/screens/mains/Profile/Security/security_screen.dart';
import 'package:finwise/screens/mains/success_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserFingerprint extends StatefulWidget {
  final String username;
  const UserFingerprint({super.key, required this.username});

  @override
  State<UserFingerprint> createState() => _UserFingerprintState();
}

class _UserFingerprintState extends State<UserFingerprint> {
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
      title: widget.username,
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 50)]),
      bodyChild: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 195,
                  height: 195,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(97.2),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.fingerprint_outlined,
                      size: 130,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              PrimaryButton(
                width: double.infinity,
                title: widget.username,
                color: lightGreen,
                onTap: () {},
              ),
              SizedBox(height: 50),
              Center(
                child: PrimaryButton(
                  title: 'Delete',
                  color: primaryColor,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => SuccessScreen(
                              successMessage:
                                  'The Fingerprint has \n been successfully \n deleted.',
                                  nextPage: FingerPrintScreen(),
                            ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
