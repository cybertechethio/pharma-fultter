import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../common/image_picker_bottom_sheet.dart';

/// Modern attachment picker for receipts and files
class AttachmentPicker extends StatelessWidget {
  final String? filePath;
  final ValueChanged<String?> onChanged;
  final String label;
  final String? placeholder;
  final bool showPreview;

  const AttachmentPicker({
    super.key,
    this.filePath,
    required this.onChanged,
    this.label = 'Attachment',
    this.placeholder,
    this.showPreview = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final hasFile = filePath != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Picker button
        InkWell(
          onTap: () => _pickImage(context),
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: hasFile 
                  ? colorScheme.primaryContainer.withOpacity(0.15)
                  : colorScheme.surfaceContainerHighest.withOpacity(0.3),
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              border: Border.all(
                color: hasFile 
                    ? colorScheme.primary.withOpacity(0.3)
                    : colorScheme.outline.withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(AppSizes.sm),
                  decoration: BoxDecoration(
                    color: hasFile 
                        ? colorScheme.primary.withOpacity(0.1)
                        : colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  ),
                  child: Icon(
                    hasFile ? Icons.check_circle_rounded : Icons.add_photo_alternate_outlined,
                    color: hasFile ? colorScheme.primary : colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                // Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hasFile ? '$label attached' : placeholder ?? 'Add $label',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: hasFile ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
                          fontWeight: hasFile ? FontWeight.w500 : FontWeight.normal,
                        ),
                      ),
                      if (!hasFile)
                        Text(
                          'Tap to upload',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant.withOpacity(0.7),
                          ),
                        ),
                    ],
                  ),
                ),
                // Action
                if (hasFile)
                  IconButton(
                    icon: Icon(
                      Icons.close_rounded, 
                      size: AppSizes.iconSizeSm, 
                      color: colorScheme.onSurfaceVariant,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    visualDensity: VisualDensity.compact,
                    onPressed: () => onChanged(null),
                    tooltip: 'Remove',
                  )
                else
                  Icon(
                    Icons.chevron_right_rounded,
                    color: colorScheme.onSurfaceVariant.withOpacity(0.5),
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
        // Preview
        if (hasFile && showPreview) ...[
          const SizedBox(height: AppSizes.sm2),
          GestureDetector(
            onTap: () => _showFullPreview(context),
            child: Container(
              height: 72,
              width: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                border: Border.all(
                  color: colorScheme.outline.withOpacity(0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withOpacity(0.05),
                    blurRadius: AppSizes.sm,
                    offset: const Offset(0, AppSizes.xxs),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.file(
                      File(filePath!),
                      fit: BoxFit.cover,
                    ),
                    // Overlay on hover effect
                    Positioned.fill(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => _showFullPreview(context),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.3),
                                ],
                              ),
                            ),
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Icon(
                              Icons.zoom_in_rounded,
                              color: Colors.white.withOpacity(0.9),
                              size: AppSizes.iconSizeSm,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final source = await ImagePickerBottomSheet.show(context);
    if (source == null) return;

    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 1024,
      maxHeight: 1024,
    );

    if (image != null) {
      onChanged(image.path);
    }
  }

  void _showFullPreview(BuildContext context) {
    if (filePath == null) return;
    
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.radius),
              child: Image.file(
                File(filePath!),
                fit: BoxFit.contain,
              ),
            ),
            // Close button
            Positioned(
              top: AppSizes.sm,
              right: AppSizes.sm,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Container(
                  padding: const EdgeInsets.all(AppSizes.xs2),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close_rounded,
                    color: BrandColors.textLight,
                    size: AppSizes.iconSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

