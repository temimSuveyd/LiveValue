import 'package:flutter/material.dart';
import 'package:qimahalan/convert/presentation/views/home/widgets/country_bottom_sheet.dart';

class CurrencySelector extends StatelessWidget {
  final String flag;
  final String currency;
  final bool isDark;
  const CurrencySelector({super.key, 
    required this.flag,
    required this.currency,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: Colors.black12,
      color: Colors.white,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      child: MaterialButton(
        onPressed: () {
          showCountryBottomSheet(context);
        },
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        child: Row(
          spacing: 5,
          children: [
            Text(flag, style: const TextStyle(fontSize: 20)),

            Text(
              currency,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }









}
