import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';

/// Full-screen image viewer with zoom and pan capabilities
/// 
/// Features:
/// - Pinch to zoom
/// - Pan/drag when zoomed
/// - Tap to close
/// - Loading indicator
/// - Error handling
class FullScreenImageViewer extends StatelessWidget {
  final String imageUrl;
  final String? heroTag;
  final String? title;
  final Widget? placeholder;
  final Widget? errorWidget;

  const FullScreenImageViewer({
    super.key,
    required this.imageUrl,
    this.heroTag,
    this.title,
    this.placeholder,
    this.errorWidget,
  });

  /// Show the full-screen image viewer as a modal
  static Future<void> show({
    required BuildContext context,
    required String imageUrl,
    String? heroTag,
    String? title,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    return showDialog(
      context: context,
      barrierColor: BrandColors.overlay,
      builder: (context) => FullScreenImageViewer(
        imageUrl: imageUrl,
        heroTag: heroTag,
        title: title,
        placeholder: placeholder,
        errorWidget: errorWidget,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.transparent,
      appBar: AppBar(
        backgroundColor: BrandColors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: BrandColors.textLight),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: title != null
            ? Text(
                title!,
                style: const TextStyle(color: BrandColors.textLight),
              )
            : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.fullscreen_exit, color: BrandColors.textLight),
            onPressed: () => Navigator.of(context).pop(),
            tooltip: 'Close',
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          color: BrandColors.overlaySolid,
          child: Center(
            child: Hero(
              tag: heroTag ?? imageUrl,
              child: PhotoView(
                imageProvider: CachedNetworkImageProvider(imageUrl),
                loadingBuilder: (context, event) => Center(
                  child: placeholder ??
                      CircularProgressIndicator(
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          BrandColors.primary,
                        ),
                      ),
                ),
                errorBuilder: (context, error, stackTrace) => Center(
                  child: errorWidget ??
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: BrandColors.textLight.withValues(alpha: 0.7),
                            size: AppSizes.xxxxxl,
                          ),
                          const SizedBox(height: AppSizes.lg),
                          Text(
                            'Failed to load image',
                            style: TextStyle(
                              color: BrandColors.textLight.withValues(alpha: 0.7),
                              fontSize: AppSizes.fontSizeBody,
                            ),
                          ),
                          const SizedBox(height: AppSizes.sm),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              'Close',
                              style: TextStyle(color: BrandColors.textLight),
                            ),
                          ),
                        ],
                      ),
                ),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
                initialScale: PhotoViewComputedScale.contained,
                backgroundDecoration: const BoxDecoration(
                  color: BrandColors.overlaySolid,
                ),
                enableRotation: true,
                // Allow panning when zoomed
                gestureDetectorBehavior: HitTestBehavior.translucent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

