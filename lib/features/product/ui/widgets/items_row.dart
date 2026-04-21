import 'package:dazzling/features/product/ui/widgets/item_card.dart';
import 'package:flutter/material.dart';

import '../../logic/models/topping_item.dart';


class ItemsRow extends StatelessWidget {
  final String title;
  final List<ToppingItem> items;
  final ValueChanged<int> onItemToggled;

  const ItemsRow({
    super.key,
    required this.title,
    required this.items,
    required this.onItemToggled,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Colors.grey.shade200, thickness: 1, height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return ItemCard(
                item: items[index],
                onTap: () => onItemToggled(index),
              );
            },
          ),
        ),
        const SizedBox(height: 14),
      ],
    );
  }
}
