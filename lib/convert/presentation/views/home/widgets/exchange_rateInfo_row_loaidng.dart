import 'package:flutter/material.dart';

class ExchangeRateInfoRowLoading extends StatelessWidget {
  const ExchangeRateInfoRowLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Left Placeholder
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 36,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 18),

          // Arrow Placeholder
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: Colors.blue[100],
                shape: BoxShape.circle,
              ),
            ),
          ),

          const SizedBox(width: 18),

          // Right Placeholder
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  width: 36,
                  height: 18,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
