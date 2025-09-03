import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerCalculator extends StatelessWidget {
  const ShimmerCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Top currency selectors shimmer
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer(
              child: Container(
                width: 80,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Shimmer(
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Shimmer(
              child: Container(
                width: 80,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Input amount shimmer
        Shimmer(
          child: Container(
            width: double.infinity,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Exchange rate info shimmer
        Shimmer(
          child: Container(
            width: double.infinity,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Conversion result shimmer
        Shimmer(
          child: Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const Spacer(),
        // Calculator pad shimmer
        Center(
          child: Wrap(
            spacing: 15,
            runSpacing: 15,
            children: List.generate(12, (index) {
              return Shimmer(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
