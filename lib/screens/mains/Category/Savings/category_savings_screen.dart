import 'package:finwise/models/category_data.dart';
import 'package:finwise/screens/mains/Category/Savings/car_screen.dart';
import 'package:finwise/screens/mains/Category/Savings/house_screen.dart';
import 'package:finwise/screens/mains/Category/Savings/travel_screen.dart';
import 'package:finwise/screens/mains/Category/Savings/wedding_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CategorySavingsScreen extends StatefulWidget {
  const CategorySavingsScreen({super.key});

  @override
  State<CategorySavingsScreen> createState() => _CategorySavingsScreenState();
}

class _CategorySavingsScreenState extends State<CategorySavingsScreen> {
  final savingList = [
    TravelScreen(),
    HouseScreen(),
    CarScreen(),
    WeddingScreen()
  ];

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
      title: 'Savings',
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
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                   if (index != 8 && index != -1) {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => savingList[index]));
                   }
                  },
                  child: Container(
                    width: 105,
                    height: 97.63,
                    decoration: BoxDecoration(
                      color: lightBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Image.asset(
                          savingsItems[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  savingsItems[index].title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          },
          itemCount: savingsItems.length,
        ),
      ),
    );
  }
}
