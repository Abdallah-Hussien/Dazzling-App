import 'package:flutter/material.dart';

class ProductBottomBar extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onAddToCart;

  const ProductBottomBar({
    super.key,
    required this.totalPrice,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '\$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          // Add to cart button
          ElevatedButton(
            onPressed: onAddToCart,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A5C28),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Add To Cart',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
