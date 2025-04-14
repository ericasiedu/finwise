
import 'package:finwise/models/daily_data.dart';
import 'package:finwise/utils/color.dart';
import 'package:flutter/material.dart';

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 10),
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
                      child: Text(
                        dailyItems[index].AmountPurpose,
                        style: TextStyle(
                          color: oceanBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (_, __) => SizedBox(height: 25),
              itemCount: dailyItems.length,
            ),
            SizedBox(height: 20,),
            Text('March'),
            SizedBox(height: 10,),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 57,
                      height: 53,
                      decoration: BoxDecoration(
                        color: marchItems[index].bgColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Image.asset(
                          marchItems[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            marchItems[index].name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            marchItems[index].time,
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
                        marchItems[index].amount,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(width: 1, height: 30, color: primaryColor),
                    SizedBox(
                      child: Text(
                        marchItems[index].AmountPurpose,
                        style: TextStyle(
                          color: oceanBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (_, __) => SizedBox(height: 25),
              itemCount: marchItems.length,
            ),
          ],
        );
  }
}