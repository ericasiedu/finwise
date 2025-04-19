import 'dart:io';

import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/custom_input.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  bool isSwitch = true;
  bool isThemeSwitch = false;
  File? _selectImage;
  final ImagePicker _picker = ImagePicker();

   Future<void> _showImagePickerDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                  child: Text('Take a Picture'),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                  child: Text('Select Image From Gallery'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickFile = await _picker.pickImage(
        source: source,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 85,
      );

      if (pickFile != null) {
        setState(() {
          _selectImage = File(pickFile.path);
        });
      }
    } catch (e) {
      //  print("Image picker error: $e");
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to pick image: ${e.toString()}")),
      );
    }
  }

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
      title: 'Edit Profile',
      centerTitle: true,
      isEdit: true,
      isProfilePage: true,
      imageTap: () => _showImagePickerDialog(context),
      profileImage: _selectImage != null ? FileImage(_selectImage!) : null,
      headerChild: Column(
        children: [SizedBox(height: MediaQuery.of(context).size.height * 0.2)],
      ),
      bodyChild: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Account Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Username'),
            SizedBox(height: 5),
            CustomInput(placeHolderText: 'jon doe'),
            SizedBox(height: 15),
            Text('Phone'),
            SizedBox(height: 5),
            CustomInput(placeHolderText: '+233 1234567'),
            SizedBox(height: 15),
            Text('Email Address'),
            SizedBox(height: 5),
            CustomInput(placeHolderText: 'example@example.com'),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Push Notifications'),
                Switch(
                  value: isSwitch,
                  activeColor: Colors.white,
                  activeTrackColor: primaryColor,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: inActivePrimaryColor,
                  onChanged: (bool value) {
                    setState(() {
                      isSwitch = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Turn dark Theme'),
                Switch(
                  value: isThemeSwitch,
                  activeColor: Colors.white,
                  activeTrackColor: primaryColor,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: inActivePrimaryColor,
                  onChanged: (bool value) {
                    setState(() {
                      isThemeSwitch = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 22),
            Center(
              child: PrimaryButton(
                title: 'Update Profile',
                color: primaryColor,
                onTap: () {},
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
