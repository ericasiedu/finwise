import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/custom_input.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddExpensesScreen extends StatefulWidget {
  const AddExpensesScreen({super.key});

  @override
  State<AddExpensesScreen> createState() => _AddExpensesScreenState();
}

class _AddExpensesScreenState extends State<AddExpensesScreen> {
  List<String> items = ['option 1', 'option 2', 'option 3'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: primaryColor, // Set the status bar color
        statusBarIconBrightness:
            Brightness.light, // Light icons for dark status bar
      ),
    );

    TextEditingController _dateController = TextEditingController();
    DateTime? _selectedDate;

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );

      if (pickedDate != null) {
        _dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
      }
    }

    return ContainerWrapper(
      showAppBar: true,
      title: 'Add Expenses',
      centerTitle: true,
      headerChild: Column(children: [SizedBox(height: 60)]),
      bodyChild: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date', style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            TextField(
              controller: _dateController, // <-- Added this
              decoration: InputDecoration(
                filled: true,
                fillColor: lightGreen,
                hintText: '30/04/2025',
                hintStyle: TextStyle(color: placeHolderColor),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                suffixIcon: Icon(Icons.calendar_month, color: primaryColor),
              ),
              readOnly: true,
              onTap: () => _selectDate(context),
            ),
            SizedBox(height: 15),
            Text('Categories', style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: lightGreen,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
              value: selectedValue,
              hint: Text('Select the category'),
              items:
                  items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
            SizedBox(height: 15),
            Text('Amount', style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            CustomInput(placeHolderText: 'Amount'),
            SizedBox(height: 15),
            Text('Expense Title', style: TextStyle(fontSize: 18)),
            SizedBox(height: 5),
            CustomInput(placeHolderText: 'Expense Title'),
            SizedBox(height: 25),
            TextField(
              maxLines: 30,
              minLines: 6,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                filled: true,
                fillColor: lightGreen,
                hintText: 'Enter Message',
                hintStyle: TextStyle(color: primaryColor),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: PrimaryButton(
                title: 'Save',
                color: primaryColor,
                onTap: () {},
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
