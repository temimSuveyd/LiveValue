import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final double minWidth;
  final ShapeBorder? shape;
  final Function(String value) onPressed;
  const CalcButton({
    super.key,
    required this.label,
    required this.color,
    required this.textColor,
    required this.minWidth,
    required this.shape,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onPressed(label),
      color: color,
      shape: shape,
      minWidth: minWidth,
      height: 64,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
