import 'dart:ui';

class DailyData {
  final String name;
  final String time;
  final String amount;
  final String AmountPurpose;
  final Color bgColor;
  final String image;

  const DailyData({
    required this.name,
    required this.time,
    required this.amount,
    required this.AmountPurpose,
    required this.bgColor,
    required this.image
  });
}

List<DailyData> dailyItems = [
  DailyData(
    name: 'Salary',
    time: '18:27 - April 30',
    amount: 'Monthly',
    AmountPurpose: '\u20B54.000,00',
    bgColor: Color(0xFF6DB6FE),
    image: 'assets/images/salary-white.png'
  ),
  DailyData(
    name: 'Groceries',
    time: '17:00 - April 24',
    amount: 'Pantry',
    AmountPurpose: '\u20B5-100,00',
    bgColor: Color(0xFF3299FF),
    image: 'assets/images/groceries.png'
  ),
  DailyData(
    name: 'Rent',
    time: '8:30 - April 15',
    amount: 'Rent',
    AmountPurpose: '\u20B5-674,40',
    bgColor: Color(0xFF0068FF),
    image: 'assets/images/rent.png'
  ),
];
