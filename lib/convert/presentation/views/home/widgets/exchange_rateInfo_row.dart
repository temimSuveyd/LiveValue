
import 'package:flutter/material.dart';
import 'package:Dinaro/convert/domain/entities/convert_entities.dart';

class ExchangeRateInfoRow extends StatelessWidget {
  const ExchangeRateInfoRow({
    super.key,
    required this.entities,
  });

  final ConvertEntities entities;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Left currency
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      '1',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        entities.query.from,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 18),
          // Arrow
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.swap_horiz,
              size: 22,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 18),
          // Right currency
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                          double.tryParse(entities.info.quote.toString()) != null
                  ? double.parse(entities.info.quote.toString()).toStringAsFixed(3)
                  : entities.info.quote.toString(),
                     
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        entities.query.to,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
