import 'package:flutter/material.dart';

class ConversionErrorBox extends StatelessWidget {
  const ConversionErrorBox({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD32F2F), Color(0xFFE57373)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.2),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(12),
            child: const Icon(
              Icons.error_outline,
              color: Colors.white,
              size: 36,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              errorMessage,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}