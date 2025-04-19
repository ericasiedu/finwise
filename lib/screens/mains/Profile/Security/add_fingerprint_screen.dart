import 'package:finwise/screens/mains/Profile/Security/finger_print_screen.dart';
import 'package:finwise/screens/mains/success_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddFingerprintScreen extends StatefulWidget {
  const AddFingerprintScreen({super.key});

  @override
  State<AddFingerprintScreen> createState() => _AddFingerprintScreenState();
}

class _AddFingerprintScreenState extends State<AddFingerprintScreen> {
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
      title: 'Add Fingerprint',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 50)]),
      bodyChild: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () {},
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
              ),
              SizedBox(height: 50),
              Text(
                'Use fingerprint  to access',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. ',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 35),
              PrimaryButton(
                width: double.infinity,
                title: 'Use Touch Id',
                color: lightGreen,
                onTap: () {
                  Navigator.push(context,
                   MaterialPageRoute(builder: (context) => SuccessScreen(successMessage: 'fingerprint Has been \n Changed successfully',nextPage: FingerPrintScreen(),)));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
