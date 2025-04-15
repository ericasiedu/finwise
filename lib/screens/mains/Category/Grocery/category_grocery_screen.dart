import 'package:finwise/models/category_data.dart';
import 'package:finwise/screens/mains/Category/add_expenses_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:finwise/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CategoryGroceryScreen extends StatefulWidget {
  const CategoryGroceryScreen({super.key});

  @override
  State<CategoryGroceryScreen> createState() => _CategoryGroceryScreenState();
}

class _CategoryGroceryScreenState extends State<CategoryGroceryScreen> {
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
      title: 'Grocery',
      centerTitle: true,
      headerChild: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
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
                          Text('Total Balance'),
                        ],
                      ),
                      Text(
                        '\u20B57,780.00',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(width: 2, height: 70, color: Colors.white),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/Expense.png',
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 3),
                          Text('Total Income'),
                        ],
                      ),
                      Text(
                        '-1,187.40',
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
            SizedBox(height: 20),
            ProgressBar(
              progress: 0.3,
              height: 27,
              backgroundColor: Colors.white,
              progressColor: Colors.black,
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
            SizedBox(height: 70),
          ],
        ),
      ), 
      bodyChild: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('March', style: TextStyle(fontSize: 18)),
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
                          'assets/images/grocery.png',
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
                            groceryItems[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            groceryItems[index].time,
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
                        groceryItems[index].amount,
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
              itemCount: groceryItems.length,
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
      ),);
  }
}