import 'package:flutter/material.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';

class InitialAvatar extends StatelessWidget {
  final String name;
  final double size;
  final Color? backgroundColor;
  final Color? textColor;

  const InitialAvatar({
    super.key,
    required this.name,
    this.size = 40,
    this.backgroundColor,
    this.textColor,
  });

  String get _initial {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return '?';
    return trimmed.characters.first.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? BrandColors.primary.withValues(alpha: 0.5);
    final fg = textColor ?? BrandColors.textLight;
    final fontSize = (size * 0.35).clamp(AppSizes.fontSizeLabel, AppSizes.fontSizeTitle);

    return CircleAvatar(
      radius: size / 3,
      backgroundColor: bg,
      child: Text(
        _initial,
        style: TextStyle(
          color: fg,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}


