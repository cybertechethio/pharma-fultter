import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';

/// Local file image preview dialog
/// 
/// Features:
/// - Preview local file images
/// - Close button
/// - Simple and clean UI
class LocalFileImagePreview extends StatelessWidget {
  final String filePath;
  final String? title;

  const LocalFileImagePreview({
    super.key,
    required this.filePath,
    this.title,
  });

  /// Show the local file image preview as a modal
  static Future<void> show({
    required BuildContext context,
    required String filePath,
    String? title,
  }) {
    return showDialog(
      context: context,
      barrierColor: BrandColors.overlay,
      builder: (context) => LocalFileImagePreview(
        filePath: filePath,
        title: title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radius),
            child: Image.file(
              File(filePath),
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: AppSizes.sm,
            right: AppSizes.sm,
            child: IconButton(
              icon: const Icon(Icons.close, color: BrandColors.textLight),
              style: IconButton.styleFrom(
                backgroundColor: BrandColors.overlay,
              ),
              onPressed: () => context.pop(),
            ),
          ),
        ],
      ),
    );
  }
}

