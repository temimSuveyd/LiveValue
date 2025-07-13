
import 'package:flutter/material.dart';

class ConversionResultBox extends StatelessWidget {
  const ConversionResultBox({
    super.key,
    required this.buttonColor,
    required this.accentColor,
    required this.textColor,
  });

  final Color buttonColor;
  final Color accentColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(Icons.attach_money, color: accentColor, size: 32),
          const SizedBox(width: 8),
          Text(
            '\$ 147.31',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

