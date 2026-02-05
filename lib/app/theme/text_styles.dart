import 'package:flutter/material.dart';
import '../../../app/theme/brand_colors.dart';
import 'app_sizes.dart';

extension TextStyleExtension on BuildContext {
  TextStyle header({Color? color, bool bold = true}) {
    return Theme.of(this).textTheme.headlineSmall?.copyWith(
          color: color ?? BrandColors.primary,
          fontSize: AppSizes.xl,
          fontWeight: bold ? FontWeight.w500 : FontWeight.normal,
        ) ?? const TextStyle();
  }
  
  TextStyle title({Color? color, bool bold = true}) {
    return Theme.of(this).textTheme.titleMedium?.copyWith(
          color: color ?? BrandColors.textPrimary,
          fontWeight: bold ? FontWeight.w500 : FontWeight.normal,
        ) ?? const TextStyle();
  }

  TextStyle titlePrimary({bool bold = true}) {
    return title(color: BrandColors.primary, bold: bold);
  }

  TextStyle subtitle({Color? color, bool bold = false}) {
    return Theme.of(this).textTheme.titleMedium?.copyWith(
          color: color ?? BrandColors.textPrimary,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ) ?? const TextStyle();
  }

  TextStyle subtitleSecondary({bool bold = false}) {
    return subtitle(color: BrandColors.textSecondary, bold: bold);
  }

  TextStyle body({Color? color, bool bold = false}) {
    return Theme.of(this).textTheme.bodyMedium?.copyWith(
          color: color ?? BrandColors.textPrimary,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ) ?? const TextStyle();
  }

  TextStyle bodyPrimary({bool bold = false}) {
    return body(color: BrandColors.primary, bold: bold);
  }

  TextStyle bodySecondary({bool bold = false}) {
    return body(color: BrandColors.textSecondary, bold: bold);
  }

  TextStyle small({Color? color, bool bold = false}) {
    return Theme.of(this).textTheme.bodySmall?.copyWith(
      
          color: color ?? BrandColors.textSecondary,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ) ?? const TextStyle();
  }

  TextStyle smallPrimary({bool bold = false}) {
    return small(color: BrandColors.primary, bold: bold);
  }

  TextStyle smallSecondary({bool bold = false}) {
    return small(color: BrandColors.textSecondary, bold: bold);
  }

  TextStyle label({Color? color, bool bold = false}) {
    return Theme.of(this).textTheme.labelSmall?.copyWith(
          color: color ?? BrandColors.textPrimary,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ) ?? const TextStyle();
  }

  TextStyle labelPrimary({bool bold = false}) {
    return label(color: BrandColors.primary, bold: bold);
  }

  TextStyle caption({Color? color, bool bold = false}) {
    return Theme.of(this).textTheme.labelSmall?.copyWith(
          color: color ?? BrandColors.textMuted,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ) ?? const TextStyle();
  }

  TextStyle captionPrimary({bool bold = false}) {
    return caption(color: BrandColors.primary, bold: bold);
  }
}

