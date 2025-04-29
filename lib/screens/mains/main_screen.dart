import 'package:finwise/screens/mains/Analysis/analysis_screen.dart';
import 'package:finwise/screens/mains/Category/category_screen.dart';
import 'package:finwise/screens/mains/home_screen.dart';
import 'package:finwise/screens/mains/Profile/profile_screen.dart';
import 'package:finwise/screens/mains/Transaction/transaction_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final pages = [
    HomeScreen(),
    AnalysisScreen(),
    TransactionScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];

  void onChangeMenu(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      backgroundColor: lightGreenBg,
      body: pages[selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
        child: Container(
          height: 95, // Reduced height since we removed labels
          decoration: BoxDecoration(
            color: lightGreen,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildRoundedNavItem('home.png', 0),
                _buildRoundedNavItem('analysis.png', 1),
                _buildRoundedNavItem('transaction.png', 2),
                _buildRoundedNavItem('category.png', 3),
                _buildRoundedNavItem('profile.png', 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedNavItem(String icon, int index) {
    bool isSelected = selectedIndex == index;
    
    return GestureDetector(
      onTap: () => onChangeMenu(index),
      child: Container(
        width: 53,
        height: 53,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.2),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Image.asset('assets/images/$icon',fit: BoxFit.contain,),
      ),
    );
  }
}