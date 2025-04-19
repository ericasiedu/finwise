import 'package:finwise/models/finger_print_data.dart';
import 'package:finwise/screens/mains/Profile/Security/add_fingerprint_screen.dart';
import 'package:finwise/screens/mains/Profile/Security/user_fingerprint.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FingerPrintScreen extends StatefulWidget {
  const FingerPrintScreen({super.key});

  @override
  State<FingerPrintScreen> createState() => _FingerPrintScreenState();
}

class _FingerPrintScreenState extends State<FingerPrintScreen> {
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
      title: 'Fingerprint',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 50)]),
      bodyChild: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => UserFingerprint(
                                username: fingerPrintItems[index].name,
                              ),
                        ),
                      );
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
                                Icons.fingerprint_outlined,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          fingerPrintItems[index].name,
                          style: TextStyle(fontSize: 19),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.arrow_forward_ios, size: 15),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(height: 25),
                itemCount: fingerPrintItems.length,
              ),
            ),
            SizedBox(height: 18),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => AddFingerprintScreen()));
              },
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: oceanBlue,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Icon(Icons.add, size: 32, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text('Add A Fingerprint', style: TextStyle(fontSize: 19)),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios, size: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
