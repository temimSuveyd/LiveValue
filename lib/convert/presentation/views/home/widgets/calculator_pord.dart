import 'package:flutter/material.dart';
import 'package:qimahalan/convert/presentation/views/home/widgets/calc_button.dart';

class CalculatorPad extends StatelessWidget {
  final Color buttonColor;
  final Color accentColor;
  final Color textColor;
  final Color subTextColor;
final dynamic Function(String value) onPressed;

  const CalculatorPad({super.key, 
    required this.buttonColor,
    required this.accentColor,
    required this.textColor,
    required this.subTextColor, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final buttons = [
      ['1', '2', '3', 'C'],
      ['4', '5', '6', '+'],
      ['7', '8', '9', '-'],
      ['0', '.', '='],
    ];
    return Column(
      children: [
        for (var row in buttons)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var label in row)
                  if (label.isNotEmpty)
                    CalcButton(
                      onPressed: (value) => onPressed(value),
                      shape: label == "0"
                          ? OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: BorderSide.none,
                            )
                          : const CircleBorder(),
                      minWidth: label == "0" ? 150 : 64,
                      label: label,
                      color: (label == '+' || label == '-' || label == '=')
                          ? accentColor
                          : (label == 'C'
                                ? accentColor
                                : buttonColor),
                      textColor: (label == '+' || label == '-' || label == '=')
                          ? Colors.white
                          : (label == 'C' ? Colors.white : textColor),
                    )
                  else
                    const SizedBox(width: 64),
              ],
            ),
          ),
      ],
    );
  }
}