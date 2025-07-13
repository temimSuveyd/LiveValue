import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qimahalan/convert/presentation/views/home/widgets/calculator_pord.dart';
import 'package:qimahalan/convert/presentation/views/home/widgets/conversion_result_box.dart';
import 'package:qimahalan/convert/presentation/views/home/widgets/conveter_TextField.dart';
import 'package:qimahalan/convert/presentation/views/home/widgets/currency_selector.dart';
import 'package:qimahalan/core/functions/make_a_text_on%20_sports_procedu.dartres.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  FocusNode focusNode = FocusNode();
  TextEditingController controller = TextEditingController(text: "1");
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    final subTextColor = isDark ? Colors.white70 : Colors.black54;
    final buttonColor = isDark
        ? const Color(0xFF222226)
        : const Color(0xFFF3F3F6);
    final accentColor = Colors.blue[700]!;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top currency selectors
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CurrencySelector(
                    flag: '🇦🇺',
                    currency: 'AUD',
                    isDark: isDark,
                  ),
                  Icon(Icons.swap_horiz, color: subTextColor),
                  CurrencySelector(
                    flag: '🇺🇸',
                    currency: 'USD',
                    isDark: isDark,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Input amount
              CustomConveterTextField(
                focusNode: focusNode,
                controller: controller,
                textColor: textColor,
              ),
              const SizedBox(height: 8),
              Text(
                '1 AUD = 0.67 USD',
                style: TextStyle(fontSize: 14, color: subTextColor),
              ),
              const SizedBox(height: 32),

              ConversionResultBox(
                buttonColor: buttonColor,
                accentColor: accentColor,
                textColor: textColor,
              ),


              const Spacer(),
              // Calculator buttons
              CalculatorPad(
                buttonColor: buttonColor,
                accentColor: accentColor,
                textColor: textColor,
                subTextColor: subTextColor,
                onPressed: (value) {
                  controller = makeATextOnSportsProcedures(value, controller);
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
