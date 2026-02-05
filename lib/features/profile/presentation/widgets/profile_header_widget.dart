import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../app/theme/brand_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/errors/failure.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../shared/utils/url_utils.dart';
import '../../../../shared/components/common/full_screen_image_viewer.dart';
import '../providers/profile_notifier.dart';
import '../providers/profile_loading_providers.dart';

/// Profile header widget displaying user's profile picture and basic info
class ProfileHeaderWidget extends ConsumerWidget {
  final User user;

  const ProfileHeaderWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isUploading = ref.watch(profilePictureUploadLoadingProvider);
    
    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary.withOpacity(0.1),
            colorScheme.secondary.withOpacity(0.05),
            colorScheme.surface,
          ],
        ),
      ),
      child: Column(
        children: [
          // Profile Picture
          Stack(
            children: [
              GestureDetector(
                onTap: user.profilePicture != null && user.profilePicture!.isNotEmpty
                    ? () {
                        final imageUrl = UrlUtils.getFullImageUrl(user.profilePicture!);
                        if (imageUrl != null) {
                          final heroTag = 'profile_image_${user.id}';
                          FullScreenImageViewer.show(
                            context: context,
                            imageUrl: imageUrl,
                            heroTag: heroTag,
                            title: user.fullName,
                          );
                        }
                      }
                    : null,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: colorScheme.outline,
                      width: 2,
                    ),
                  ),
                  child: user.profilePicture != null && user.profilePicture!.isNotEmpty
                      ? Hero(
                          tag: 'profile_image_${user.id}',
                          child: ClipOval(
                            child: Builder(
                              builder: (context) {
                                // Get full image URL
                                final imageUrl = UrlUtils.getFullImageUrl(user.profilePicture!);
                                
                                if (imageUrl == null) {
                                  return _buildDefaultAvatar(context, colorScheme);
                                }
                                
                                // Use profilePicture URL as cache key to ensure cache updates when URL changes
                                // Adding user ID ensures uniqueness per user
                                final cacheKey = 'profile_${user.id}_${user.profilePicture}';
                                
                                return CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  cacheKey: cacheKey,
                                  placeholder: (context, url) => _buildDefaultAvatar(context, colorScheme),
                                  errorWidget: (context, url, error) {
                                    // Log error for debugging
                                    debugPrint('Error loading profile image: $error');
                                    debugPrint('Image URL: $imageUrl');
                                    debugPrint('Profile Picture: ${user.profilePicture}');
                                    return _buildDefaultAvatar(context, colorScheme);
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      : _buildDefaultAvatar(context, colorScheme),
                ),
              ),
              // Edit Icon
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: isUploading ? null : () => _showImagePicker(context, ref),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.surface,
                        width: 2,
                      ),
                    ),
                    child: isUploading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(BrandColors.textLight),
                            ),
                          )
                        : const Icon(
                            Icons.edit,
                            color: BrandColors.textLight,
                            size: 16,
                          ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          // Full Name with Verification Badge
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  user.fullName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              if (user.isAccountVerified) ...[
                const SizedBox(width: AppSizes.sm),
                Icon(
                  Icons.verified,
                  color: colorScheme.primary,
                  size: 20,
                ),
              ],
            ],
          ),
          const SizedBox(height: AppSizes.xs),
          // Email
          if (user.email != null && user.email!.isNotEmpty)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: AppSizes.xs),
                Text(
                  user.email!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          const SizedBox(height: AppSizes.xs),
          // Phone
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone_outlined,
                size: 16,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: AppSizes.xs),
              Text(
                user.phone,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAvatar(BuildContext context, ColorScheme colorScheme) {
    final initials = user.fullName
        .split(' ')
        .map((n) => n.isNotEmpty ? n[0].toUpperCase() : '')
        .take(2)
        .join();
    
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initials.isNotEmpty ? initials : 'U',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Future<void> _showImagePicker(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final ImagePicker picker = ImagePicker();

    // Show bottom sheet with options
    final ImageSource? source = await showModalBottomSheet<ImageSource>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(l10n.chooseFromGallery),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(l10n.takePhoto),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.cancel),
                title: Text(l10n.cancel),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );

    if (source == null) return;

    try {
      // Pick image
      final XFile? image = await picker.pickImage(
        source: source,
        imageQuality: 85, // Compress image to 85% quality
        maxWidth: 1024, // Limit width to reduce file size
        maxHeight: 1024, // Limit height to reduce file size
      );

      if (image != null) {
        final File imageFile = File(image.path);
        
        // Upload the image
        await ref.read(profileProvider.notifier).uploadProfilePicture(
          imageFile: imageFile,
        );
      }
    } catch (e) {
      // Handle errors (permissions, etc.)
      if (context.mounted) {
        final snackbar = ref.read(snackbarServiceProvider);
        snackbar.showError(Failure.unexpectedError(l10n.errorPickingImage(e.toString())));
      }
    }
  }
}

