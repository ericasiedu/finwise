import 'package:finwise/models/category_data.dart';
import 'package:finwise/screens/mains/Category/add_expenses_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:finwise/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeddingScreen extends StatefulWidget {
  const WeddingScreen({super.key});

  @override
  State<WeddingScreen> createState() => _WeddingScreenState();
}

class _WeddingScreenState extends State<WeddingScreen> {
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
      title: 'Wedding',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 50)],),
      bodyChild: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/Income.png',
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 3),
                          Text('Goal'),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        '\u20B51,962.93',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: placeHolderColor,
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/Expense.png',
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 3),
                          Text('Amount Saved'),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        '\u20B5653.31',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: lightBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/white-wedding.png',
                            fit: BoxFit.cover,
                          ),
                          Center(
                            child: Text(
                              'Travel',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ProgressBar(
              progress: 0.4,
              height: 27,
              backgroundColor: primaryColor,
              progressColor: placeHolderColor,
              percent: '30%',
              expenses: '20,000',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/check.png'),
                SizedBox(width: 10),
                Text(
                  '30% of your expenses, looks good.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 57,
                      height: 53,
                      decoration: BoxDecoration(
                        color: lightBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/small-wedding.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weddingItems[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            weddingItems[index].time,
                            style: TextStyle(
                              color: oceanBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      child: Text(
                        weddingItems[index].amount,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: oceanBlue,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (_, __) => SizedBox(height: 25),
              itemCount: weddingItems.length,
            ),
            SizedBox(height: 30),
            Center(
              child: PrimaryButton(
                title: 'Add Expenses',
                color: primaryColor,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddExpensesScreen(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
