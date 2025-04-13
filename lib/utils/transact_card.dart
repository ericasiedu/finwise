import 'package:flutter/material.dart';

class TransactCard extends StatelessWidget {
  final String name;
  final String image;
  final String amount;
  final bool isBgColor;
  final Color? bgColor;
  const TransactCard({
    super.key,
    required this.name,
    required this.image,
    required this.amount,
    this.isBgColor = false,
    this.bgColor
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Padding(padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Image.asset('assets/images/$image'),
              SizedBox(height: 10,),
              Text(name,style: TextStyle(fontSize: 18),),
              Text(amount,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))
            ],
          ),),
        ),
      ));
  }
}
