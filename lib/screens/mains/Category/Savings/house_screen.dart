import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({super.key});

  @override
  State<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {
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
      title: 'New House',
      centerTitle: true,
      headerChild: Column(), 
      bodyChild: Column());
  }
  
}