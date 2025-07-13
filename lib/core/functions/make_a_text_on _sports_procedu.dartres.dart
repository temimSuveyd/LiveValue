import 'package:flutter/material.dart';

TextEditingController makeATextOnSportsProcedures(
  String value,
  TextEditingController controller,
) {
  if (value == 'C') {
    controller.text = '';
  } else if (value == '=') {
    String expr = controller.text;
    expr = expr.replaceAll('=', '').trim();
    // Basit toplama ve çıkarma işlemleri için boşlukla ayırıyoruz
    List<String> parts = expr.split(' ');
    if (parts.length < 3) return controller;
    int result = int.tryParse(parts[0]) ?? 0;
    for (int i = 1; i < parts.length; i += 2) {
      if (i + 1 >= parts.length) break;
      String op = parts[i];
      int num = int.tryParse(parts[i + 1]) ?? 0;
      if (op == '+') {
        result += num;
      } else if (op == '-') {
        result -= num;
      }
    }
    controller.text = result.toString();
  } else if (value == '+' || value == '-') {
    // Son karakter operatör değilse ekle
    if (controller.text.isNotEmpty &&
        controller.text.trim().split(' ').last != '+' &&
        controller.text.trim().split(' ').last != '-') {
      controller.text = controller.text.trim() + ' $value ';
    }
  } else {
    controller.text += value;
  }
  return controller;
}
