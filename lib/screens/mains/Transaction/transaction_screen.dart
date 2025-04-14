import 'package:finwise/screens/mains/Transaction/daily_Expense.dart';
import 'package:finwise/screens/mains/Transaction/expenses.dart';
import 'package:finwise/screens/mains/Transaction/income.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/transact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  int _selectedIndex = 0;
    final contents = [DailyExpense(), Income(), Expenses()];

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
      title: 'Transaction',
      centerTitle: true,
      headerChild: Column(
        children: [
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: lightGreen,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text('Total Balance', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 5),
                  Text(
                    '\u20B57,783.00',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 14),
          Row(
            children: [
              TransactCard(
                name: 'Income',
                image: _selectedIndex == 1 ? 'income-white.png' : 'Income-green.png',
                amount: '\u20B54,120.00',
                bgColor: _selectedIndex == 1 ? oceanBlue : lightGreen,
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                textColor: _selectedIndex == 1 ? Colors.white : Colors.black,
                moneyColor: _selectedIndex == 1 ? Colors.white : Colors.black,
              ),
              SizedBox(width: 14),
              TransactCard(
                name: 'Expenses',
                image: _selectedIndex == 2 ? 'Expenses-white.png' : 'Expenses-blue.png',
                amount: '\u20B51.187.40',
                bgColor: _selectedIndex == 2 ? oceanBlue : lightGreen,
                onTap: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
                textColor: _selectedIndex == 2 ? Colors.white : Colors.black,
                moneyColor: _selectedIndex == 2 ? Colors.white : Colors.black,
              ),
            ],
          ),
          SizedBox(height: 60),
        ],
      ),
      bodyChild: SingleChildScrollView(child: contents[_selectedIndex]),
    );
  }
}
