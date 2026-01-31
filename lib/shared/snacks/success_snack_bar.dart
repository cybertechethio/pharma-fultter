import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/brand_colors.dart';

class SuccessSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    final backgroundColor = BrandColors.success;
    
    Flushbar(
      message: message,
      duration: duration,
      backgroundColor: backgroundColor,
      margin: const EdgeInsets.all(AppSizes.sm),
      borderRadius: BorderRadius.circular(AppSizes.radius),
      icon: const Icon(Icons.check_circle_outline, color: BrandColors.textLight),
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 300),
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
    ).show(context);
  }
}
