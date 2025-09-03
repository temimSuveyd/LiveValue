import 'package:flutter/material.dart';

class ConversionResultBoxLoading extends StatelessWidget {
  const ConversionResultBoxLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.15),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Icon kutusu aynı kalıyor
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.attach_money,
              color: Colors.white,
              size: 36,
            ),
          ),
          const SizedBox(width: 10),
          // Loading kutusu (metin yerine)
          Expanded(
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
