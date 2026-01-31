import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_images.dart';
import '../../../app/theme/brand_colors.dart';

/// Custom button component with simplified design
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final bool isLoading;
  final bool isSocial;
  final double? width;
  final double height;
  final IconData? icon;
  final String? loadingText;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.isLoading = false,
    this.isSocial = false,
    this.width,
    this.height = AppSizes.btnHeight,
    this.icon,
    this.loadingText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? BrandColors.primary,
          disabledBackgroundColor: (color ?? BrandColors.primary).withOpacity(0.6),
          foregroundColor: textColor ?? BrandColors.textLight,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          ),
        ),
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SpinKitThreeBounce(
                    color: textColor ?? BrandColors.textLight, 
                    size: 20.0
                  ),
                  if (loadingText != null) ...[
                    const SizedBox(width: AppSizes.sm),
                    Text(
                      loadingText!,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: textColor ?? BrandColors.textLight,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isSocial) ...[
                    Image.asset(AppImages.googleLogo, width: 24, height: 24),
                    const SizedBox(width: AppSizes.sm),
                  ] else if (icon != null) ...[
                    Icon(icon, color: textColor ?? BrandColors.textLight, size: 20),
                    const SizedBox(width: AppSizes.sm),
                  ],
                  Text(
                    text,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: isSocial
                          ? BrandColors.textPrimary
                          : (textColor ?? BrandColors.textLight),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}