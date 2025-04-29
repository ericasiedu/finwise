import 'package:finwise/screens/authentication/login_screen.dart';
import 'package:finwise/screens/mains/success_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/custom_input.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
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
      headerChild: Column(
        children: [
          const SizedBox(height: 30),
          const Center(
            child: Text(
              'New Password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
      bodyChild: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('New Password'),
          SizedBox(height: 5),
          CustomInput(
            placeHolderText:
                '\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}',
          ),
          SizedBox(height: 15),
          Text('Confirm New Password'),
          SizedBox(height: 5),
          CustomInput(
            placeHolderText:
                '\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}',
          ),
          SizedBox(height: 40),
          PrimaryButton(
            title: 'Change Password',
            color: primaryColor,
            width: double.infinity,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SuccessScreen(
                    successMessage: 'Password Has Been \n Changed Successfully',
                    nextPage: LoginScreen(),),
                ),
              );
            },
          ),
        ],
      ),
      )
    );
  }
}
