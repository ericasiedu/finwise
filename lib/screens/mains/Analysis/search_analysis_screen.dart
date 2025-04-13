import 'package:finwise/utils/color.dart';
import 'package:finwise/utils/container_wrapper.dart';
import 'package:finwise/utils/custom_input.dart';
import 'package:finwise/utils/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class SearchAnalysisScreen extends StatefulWidget {
  const SearchAnalysisScreen({super.key});

  @override
  State<SearchAnalysisScreen> createState() => _SearchAnalysisScreenState();
}

class _SearchAnalysisScreenState extends State<SearchAnalysisScreen> {
final List<String> _options = ['Income', 'Expenses'];
    String? _selectedOption = 'Expenses';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: primaryColor, // Set the status bar color
        statusBarIconBrightness:
            Brightness.light, // Light icons for dark status bar
      ),
    );

    List<String> items = ['option 1', 'option 2', 'option 3'];
    String? selectedValue;

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
      title: 'Search',
      centerTitle: true,
      headerChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          CustomInput(placeHolderText: 'Search...'),
          SizedBox(height: 60),
        ],
      ),
      bodyChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          SizedBox(height: 30),
          Text('Report', style: TextStyle(fontSize: 18)),
          SizedBox(height: 5),
          Row(
            children:
                _options.map((option) {
                  return Row(
                    children: [
                      Radio<String>(
                        value: option,
                        groupValue: _selectedOption,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                        activeColor: primaryColor, // Use a distinct color
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Text(option),
                      SizedBox(width: 8),
                    ],
                  );
                }).toList(),
          ),
          SizedBox(height: 30),
          Center(
            child: PrimaryButton(
              title: 'Search',
              color: primaryColor,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
