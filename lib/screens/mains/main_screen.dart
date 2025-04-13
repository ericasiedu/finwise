import 'package:finwise/screens/mains/Analysis/analysis_screen.dart';
import 'package:finwise/screens/mains/category_screen.dart';
import 'package:finwise/screens/mains/home_screen.dart';
import 'package:finwise/screens/mains/profile_screen.dart';
import 'package:finwise/screens/mains/transaction_screen.dart';
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
                _buildRoundedNavItem(Icons.home_outlined, 0),
                _buildRoundedNavItem(Icons.analytics_outlined, 1),
                _buildRoundedNavItem(Icons.business_outlined, 2),
                _buildRoundedNavItem(Icons.category_outlined, 3),
                _buildRoundedNavItem(Icons.person_2_outlined, 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoundedNavItem(IconData icon, int index) {
    bool isSelected = selectedIndex == index;
    
    return GestureDetector(
      onTap: () => onChangeMenu(index),
      child: Container(
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
        child: Icon(
          icon,
          color:  Colors.black,
          size: 28,
        ),
      ),
    );
  }
}