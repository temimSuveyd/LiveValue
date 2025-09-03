// ignore: file_names
import 'package:flutter/material.dart';

class CustomConveterTextField extends StatelessWidget {
  const CustomConveterTextField({
    super.key,
    required this.focusNode,
    required this.controller,

  });

  final FocusNode focusNode;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    final bgColor =  Colors.white;
    final borderColor =  Colors.blue[100]!;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: borderColor, width: 2),
        boxShadow: [
          BoxShadow(
            color:  Colors.grey.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color:  Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.attach_money_outlined,
              size: 32,
              color:  Colors.blue[700],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              focusNode: focusNode,
              readOnly: true,
              controller: controller,
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                hintText: "0",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 32,
                ),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              cursorColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
