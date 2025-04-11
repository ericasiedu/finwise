import 'package:finwise/utils/color.dart';
import 'package:flutter/material.dart';

class ExpenditureCard extends StatefulWidget {
  final String income;
  final String expenses;
  final VoidCallback? search;
  final VoidCallback? calendarSearch;
  const ExpenditureCard({
    super.key,
    required this.income,
    required this.expenses,
    required this.search,
    required this.calendarSearch
  });

  @override
  State<ExpenditureCard> createState() => _ExpenditureCardState();
}

class _ExpenditureCardState extends State<ExpenditureCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: lightGreen,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'income & Expenses',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.search ?? () {},
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(child: Icon(Icons.search_outlined)),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: widget.calendarSearch,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Icon(Icons.calendar_month_outlined),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Image.asset('assets/images/bar-graph.png', fit: BoxFit.cover),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Income-green.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5),
                  Text('Income', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 5),
                  Text(
                    '\u20B5${widget.income}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Expenses-blue.png',
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5),
                  Text('Expense', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 5),
                  Text(
                    '\u20B5${widget.expenses}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: oceanBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
