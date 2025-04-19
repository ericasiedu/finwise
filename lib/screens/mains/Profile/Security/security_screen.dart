import 'package:finwise/models/security_data.dart';
import 'package:finwise/screens/mains/Profile/Security/change_pin_screen.dart';
import 'package:finwise/screens/mains/Profile/Security/finger_print_screen.dart';
import 'package:finwise/screens/mains/Profile/Security/terms_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  final securityList = [ChangePinScreen(), FingerPrintScreen(), TermsScreen()];

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
      title: 'Security',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 50)]),
      bodyChild: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Security',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 10),
            SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => securityList[index],
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: primaryColor),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(securityItems[index].title),
                          Icon(Icons.arrow_forward_ios, size: 14),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(height: 10),
                itemCount: securityItems.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
