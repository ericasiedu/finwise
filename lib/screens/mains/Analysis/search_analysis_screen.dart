import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchAnalysisScreen extends StatefulWidget {
  const SearchAnalysisScreen({super.key});

  @override
  State<SearchAnalysisScreen> createState() => _SearchAnalysisScreenState();
}

class _SearchAnalysisScreenState extends State<SearchAnalysisScreen> {
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
      title: 'Search',
      centerTitle: true,
      headerChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          CustomInput(placeHolderText: 'Search...'),
          SizedBox(height: 60),
        ],
      ),
      bodyChild: Column(children: []),
    );
  }
}
