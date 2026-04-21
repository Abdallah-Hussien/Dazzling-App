import 'package:flutter/material.dart';

import '../../logic/models/topping_item.dart';

class ItemCard extends StatelessWidget {
  final ToppingItem item;
  final VoidCallback onTap;

  const ItemCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 76,
          height: 82,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: item.selected
                ? Border.all(color: const Color(0xFF1E6B30), width: 1.5)
                : null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                item.imagePath,
                height: 48,
                width: 48,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.fastfood,
                  size: 36,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.name,
                style: const TextStyle(fontSize: 11, color: Colors.black87),
              ),
            ],
          ),
        ),
        // + / ✓ button (top-right)
        Positioned(
          top: -6,
          right: -6,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: const Color(0xFF1E6B30),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: Icon(
                item.selected ? Icons.check : Icons.add,
                color: Colors.white,
                size: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
