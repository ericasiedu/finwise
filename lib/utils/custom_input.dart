import 'package:finwise/utils/color.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String placeHolderText;
  final bool isPassword;
  const CustomInput({
    super.key,
    required this.placeHolderText,
    this.isPassword = false,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureText = true;

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: lightGreen,
        hintText: widget.placeHolderText,
        hintStyle: TextStyle(color: placeHolderColor),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        suffixIcon:
            widget.isPassword
                ? IconButton(
                  onPressed: togglePasswordVisibility,
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                )
                : null,
      ),
    );
  }
}
