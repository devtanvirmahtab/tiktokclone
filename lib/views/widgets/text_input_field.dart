import 'package:flutter/material.dart';

import '../../utilies/constants/constants.dart';
import '../../utilies/constants/style_constants.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    super.key,
    required this.inputController,
    required this.labelText,
    required this.icon,
    this.isObscure = false,
  });

  final TextEditingController inputController;
  final String labelText;
  final IconData icon;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: inputController,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: normalTextStyle(
          color: grayColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: grayColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: grayColor),
        ),
      ),
      obscureText: isObscure,
    );
  }
}
