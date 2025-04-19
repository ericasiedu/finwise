import 'package:finwise/screens/mains/success_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/custom_input.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePinScreen extends StatefulWidget {
  const ChangePinScreen({super.key});

  @override
  State<ChangePinScreen> createState() => _ChangePinScreenState();
}

class _ChangePinScreenState extends State<ChangePinScreen> {
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
      title: 'Change Pin',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 50)]),
      bodyChild: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Pin'),
            CustomInput(
              placeHolderText:
                  '\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}',
              isPassword: true,
            ),
            SizedBox(height: 18),
            Text('New Pin'),
            CustomInput(
              placeHolderText:
                  '\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}',
              isPassword: true,
            ),
            SizedBox(height: 18),
            Text('Confirm Pin'),
            CustomInput(
              placeHolderText:
                  '\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}',
              isPassword: true,
            ),
            SizedBox(height: 50),
            Center(
              child: PrimaryButton(
                title: 'Change Pin',
                color: primaryColor,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SuccessScreen(successMessage: "Pin Has Been \n Changed Successfully")),
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
