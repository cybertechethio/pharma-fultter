import 'package:flutter/material.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../app/theme/text_styles.dart';

/// Reusable edit and delete action buttons component
/// 
/// Supports two modes:
/// - [ActionButtonStyle.text] - Text button with icon and label (default)
/// - [ActionButtonStyle.icon] - Icon button only
class ActionButtons extends StatelessWidget {
  /// Callback when edit button is pressed
  final VoidCallback? onEdit;
  
  /// Callback when delete button is pressed
  final VoidCallback? onDelete;
  
  /// Whether edit action is loading
  final bool isEditing;
  
  /// Whether delete action is loading
  final bool isDeleting;
  
  /// Button style (text or icon)
  final ActionButtonStyle style;
  
  /// Edit button label (only used in text style)
  final String? editLabel;
  
  /// Delete button label (only used in text style)
  final String? deleteLabel;
  
  /// Icon size for icon buttons
  final double iconSize;

  const ActionButtons({
    super.key,
    required this.onEdit,
    this.onDelete,
    this.isEditing = false,
    this.isDeleting = false,
    this.style = ActionButtonStyle.text,
    this.editLabel,
    this.deleteLabel,
    this.iconSize = AppSizes.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    if (style == ActionButtonStyle.icon) {
      return _buildIconButtons(context);
    } else {
      return _buildTextButtons(context);
    }
  }

  Widget _buildIconButtons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: isEditing ? null : onEdit,
          icon: isEditing
              ? SizedBox(
                  width: iconSize,
                  height: iconSize,
                  child: const CircularProgressIndicator(
                    strokeWidth: AppSizes.loaderStrokeWidth,
                    valueColor: AlwaysStoppedAnimation<Color>(BrandColors.primary),
                  ),
                )
              : const Icon(
                  Icons.edit_outlined,
                  color: BrandColors.primary,
                ),
          tooltip: editLabel ?? 'Edit',
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
        if (onDelete != null) ...[
          const SizedBox(width: AppSizes.xs),
          IconButton(
            onPressed: isDeleting ? null : onDelete,
            icon: isDeleting
                ? SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: const CircularProgressIndicator(
                      strokeWidth: AppSizes.loaderStrokeWidth,
                      valueColor: AlwaysStoppedAnimation<Color>(BrandColors.error),
                    ),
                  )
                : const Icon(
                    Icons.delete_outline,
                    color: BrandColors.error,
                  ),
            tooltip: deleteLabel ?? 'Delete',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ],
    );
  }

  Widget _buildTextButtons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Edit Button
        TextButton.icon(
          onPressed: isEditing ? null : onEdit,
          icon: isEditing
              ? const SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: AppSizes.loaderStrokeWidth,
                    valueColor: AlwaysStoppedAnimation<Color>(BrandColors.primary),
                  ),
                )
              : const Icon(
                  Icons.edit_outlined,
                  size: 16,
                  color: BrandColors.primary,
                ),
          label: Text(
            editLabel ?? 'Edit',
            style: context.small(
              color: BrandColors.primary,
              bold: true,
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.sm,
              vertical: AppSizes.xs,
            ),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        if (onDelete != null) ...[
          const SizedBox(width: AppSizes.xs),
          // Delete Button
          TextButton.icon(
            onPressed: isDeleting ? null : onDelete,
            icon: isDeleting
                ? const SizedBox(
                    width: 14,
                    height: 14,
                    child: CircularProgressIndicator(
                      strokeWidth: AppSizes.loaderStrokeWidth,
                      valueColor: AlwaysStoppedAnimation<Color>(BrandColors.error),
                    ),
                  )
                : const Icon(
                    Icons.delete_outline,
                    size: 16,
                    color: BrandColors.error,
                  ),
            label: Text(
              deleteLabel ?? 'Delete',
              style: context.small(
                color: BrandColors.error,
                bold: true,
              ),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.sm,
                vertical: AppSizes.xs,
              ),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ],
    );
  }
}

/// Action button style options
enum ActionButtonStyle {
  /// Text button with icon and label
  text,
  
  /// Icon button only
  icon,
}

