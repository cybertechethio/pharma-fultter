import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../l10n/app_localizations.dart';

/// Image picker bottom sheet helper
/// 
/// Shows a bottom sheet with options to pick image from gallery or camera
class ImagePickerBottomSheet {
  /// Show image source selection bottom sheet
  /// Returns the selected ImageSource or null if cancelled
  static Future<ImageSource?> show(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    return showModalBottomSheet<ImageSource>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusLg),
        ),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.photo_library, color: BrandColors.primary),
                  title: Text(l10n.chooseFromGallery),
                  onTap: () => context.pop(ImageSource.gallery),
                ),
                ListTile(
                  leading: Icon(Icons.camera_alt, color: BrandColors.primary),
                  title: Text(l10n.takePhoto),
                  onTap: () => context.pop(ImageSource.camera),
                ),
                Divider(color: BrandColors.divider),
                ListTile(
                  leading: Icon(Icons.cancel, color: BrandColors.textSecondary),
                  title: Text(l10n.cancel),
                  onTap: () => context.pop(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

