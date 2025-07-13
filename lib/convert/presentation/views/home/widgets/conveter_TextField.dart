import 'package:flutter/material.dart';

class CustomConveterTextField extends StatelessWidget {
  const CustomConveterTextField({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.textColor,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      readOnly: true,
      controller: controller,
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      textAlign: TextAlign.left,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.attach_money_outlined, size: 40),
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.zero,
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
  }
}
