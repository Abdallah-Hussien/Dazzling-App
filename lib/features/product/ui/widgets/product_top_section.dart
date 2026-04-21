import 'package:dazzling/features/product/ui/widgets/spicy_slider.dart';
import 'package:flutter/material.dart';

class ProductTopSection extends StatelessWidget {
  final SpicyLevel spicyLevel;
  final ValueChanged<SpicyLevel> onSpicyChanged;

  const ProductTopSection({
    super.key,
    required this.spicyLevel,
    required this.onSpicyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 220,
          width: 160,
          child: Image.asset(
            'assets/images/burger.png',
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Customize ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Your Burger\nto Your Tastes. Ultimate\nExperience',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                        color: Colors.black,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SpicySlider(
                initialLevel: spicyLevel,
                onChanged: onSpicyChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
