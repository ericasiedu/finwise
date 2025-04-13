import 'package:finwise/models/daily_data.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/transact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

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
          SizedBox(height: 30),
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
                image: 'Income-green.png',
                amount: '\u20B54,120.00',
                bgColor: lightGreen,
              ),
              SizedBox(width: 14),
              TransactCard(
                name: 'Expenses',
                image: 'Expenses-blue.png',
                amount: '\u20B51.187.40',
                bgColor: lightGreen,
              ),
            ],
          ),
          SizedBox(height: 60),
        ],
      ),
      bodyChild: SingleChildScrollView(
        child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('April'),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(child: Icon(Icons.calendar_month_outlined)),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 57,
                            height: 53,
                            decoration: BoxDecoration(
                              color: dailyItems[index].bgColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Image.asset(
                                dailyItems[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dailyItems[index].name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  dailyItems[index].time,
                                  style: TextStyle(
                                    color: oceanBlue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(width: 1, height: 30, color: primaryColor),
                          SizedBox(
                            child: Text(
                              dailyItems[index].amount,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(width: 1, height: 30, color: primaryColor),
                          SizedBox(
                            child: Text(dailyItems[index].AmountPurpose, style: TextStyle(
                                    color: oceanBlue,
                                    fontWeight: FontWeight.bold,
                                  ),),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (_, __) => SizedBox(height: 25),
                    itemCount: dailyItems.length,
                  ),)
        ],
      ),
      )
    );
  }
}
