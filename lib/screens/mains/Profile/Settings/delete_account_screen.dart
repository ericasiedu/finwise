import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/custom_input.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  void showDialogBox(BuildContext context) {
    
    showDialog(
      context: context,
      useSafeArea: false,
      // barrierColor: Colors.black.withOpacity(0.5),
      useRootNavigator: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.8, // Add maxWidth
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Delete Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Are you sure you want to delete your account?', // Fixed text from "log out" to "delete"
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'By deleting your account, you agree that you understand the consequences of this action and that you agree to permanently delete your account and all associated data.',
                      textAlign:
                          TextAlign.center, // Added for better text alignment
                    ),
                    SizedBox(height: 20),
                    PrimaryButton(
                      width: MediaQuery.of(context).size.width * 0.6,
                      title: 'Yes, Delete Account',
                      color: primaryColor,
                      onTap: () {},
                    ),
                    SizedBox(height: 10),
                    PrimaryButton(
                      width: MediaQuery.of(context).size.width * 0.6,
                      title: 'Cancel',
                      color: lightGreen,
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: primaryColor, // Set the status bar color
    //     statusBarIconBrightness:
    //         Brightness.light, // Light icons for dark status bar
    //   ),
    // );

    final List<String> items = [
      'All your expenses, income and associated transactions will be eliminated.',
      'You will not be able to access your account or any related information.',
      'This action cannot be undone.',
    ];

    return ContainerWrapper(
      showAppBar: true,
      title: 'Delete Account',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 50)]),
      bodyChild: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Are you sure you want to delete your account?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.all(17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'This action will permanently delete all of your data, and you will not be able to recover it. Please keep the following in mind before proceeding:',
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          items.map((item) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('* '),
                                  SizedBox(width: 5),
                                  Expanded(child: Text(item)),
                                ],
                              ),
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Please enter your password to confirm deletion of your account.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            CustomInput(
              placeHolderText:
                  '\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}\u{25CF}',
              isPassword: true,
            ),
            SizedBox(height: 30),
            PrimaryButton(
              width: MediaQuery.of(context).size.width * 0.6,
              title: 'Yes, Delete Account',
              color: primaryColor,
              onTap: () => showDialogBox(context),
            ),
            SizedBox(height: 10),
            PrimaryButton(
              width: MediaQuery.of(context).size.width * 0.6,
              title: 'Cancel',
              color: lightGreen,
              onTap: () {},
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
