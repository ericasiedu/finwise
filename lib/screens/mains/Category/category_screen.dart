import 'package:finwise/models/category_data.dart';
import 'package:finwise/screens/mains/Category/Entertainment/category_entertain_screen.dart';
import 'package:finwise/screens/mains/Category/Gift/category_gift_screen.dart';
import 'package:finwise/screens/mains/Category/Grocery/category_grocery_screen.dart';
import 'package:finwise/screens/mains/Category/Medicine/category_medicine_screen.dart';
import 'package:finwise/screens/mains/Category/Rent/category_rent_screen.dart';
import 'package:finwise/screens/mains/Category/Savings/category_savings_screen.dart';
import 'package:finwise/screens/mains/Category/Transport/category_transport_screen.dart';
import 'package:finwise/screens/mains/Category/Food/food_category_screen.dart';
import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final categories = [
    FoodCategoryScreen(),
    CategoryTransportScreen(),
    CategoryMedicineScreen(),
    CategoryGroceryScreen(),
    CategoryRentScreen(),
    CategoryGiftScreen(),
    CategorySavingsScreen(),
    CategoryEntertainScreen()
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
      title: 'Categories',
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
                      MaterialPageRoute(builder: (context) => categories[index]));
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
                          categoryItems[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  categoryItems[index].title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            );
          },
          itemCount: categoryItems.length,
        ),
      ),
    );
  }
}
