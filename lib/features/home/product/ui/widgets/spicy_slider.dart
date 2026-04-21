import 'package:flutter/material.dart';

enum SpicyLevel { mild, medium, hot }

extension SpicyLevelExtension on SpicyLevel {
  String get label {
    switch (this) {
      case SpicyLevel.mild:   return 'Mild';
      case SpicyLevel.medium: return 'Medium';
      case SpicyLevel.hot:    return 'Hot 🌶';
    }
  }
}

class SpicySlider extends StatefulWidget {
  final SpicyLevel initialLevel;
  final ValueChanged<SpicyLevel> onChanged;

  const SpicySlider({
    super.key,
    this.initialLevel = SpicyLevel.medium,
    required this.onChanged,
  });

  @override
  State<SpicySlider> createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  late SpicyLevel _level;

  @override
  void initState() {
    super.initState();
    _level = widget.initialLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Spicy',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            Text(
              _level.label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E6B30),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 16),
            activeTrackColor: const Color(0xFF1E6B30),
            inactiveTrackColor: Colors.grey.shade300,
            thumbColor: const Color(0xFF1E6B30),
            overlayColor: const Color(0xFF1E6B30).withOpacity(0.15),
          ),
          child: Slider(
            value: _level.index.toDouble(),
            min: 0,
            max: 2,
            divisions: 2,
            onChanged: (value) {
              final level = SpicyLevel.values[value.round()];
              setState(() => _level = level);
              widget.onChanged(level);
            },
          ),
        ),
      ],
    );
  }
}
