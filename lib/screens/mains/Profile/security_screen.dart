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
      headerChild: Column(children: []),
      bodyChild: SingleChildScrollView(child: Column(children: [])),
    );
  }
}
