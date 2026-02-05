import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/common/full_screen_image_viewer.dart';
import '../../../../../shared/utils/url_utils.dart';
import '../../../domain/entities/transaction.dart';

class TransactionAttachmentsSection extends StatelessWidget {
  final Transaction transaction;

  const TransactionAttachmentsSection({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final attachments = transaction.attachments;

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.outline.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.attachments, style: context.subtitle(bold: true)),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: AppSizes.xxs,
                ),
                decoration: BoxDecoration(
                  color: BrandColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Text(
                  '${attachments.length}',
                  style: context.small(color: BrandColors.primary, bold: true),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          if (attachments.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.lg),
                child: Text(l10n.noAttachments, style: context.body()),
              ),
            )
          else
            SizedBox(
              height: AppSizes.attachmentThumbSize,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: attachments.length,
                itemBuilder: (context, index) {
                  final attachment = attachments[index];
                  final heroTag = 'attachment_${transaction.id}_$index';
                  final imageUrl = UrlUtils.getFullImageUrl(attachment);

                  if (imageUrl == null) {
                    return _buildErrorThumbnail(context, index);
                  }

                  return _AttachmentThumbnail(
                    imageUrl: imageUrl,
                    index: index,
                    heroTag: heroTag,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildErrorThumbnail(BuildContext context, int index) {
    return Container(
      width: AppSizes.attachmentThumbSize,
      height: AppSizes.attachmentThumbSize,
      margin: EdgeInsets.only(right: AppSizes.sm),
      decoration: BoxDecoration(
        color: BrandColors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.outline.withOpacity(0.3)),
      ),
      child: Icon(
        Icons.broken_image,
        color: BrandColors.textSecondary,
      ),
    );
  }
}

class _AttachmentThumbnail extends StatelessWidget {
  final String imageUrl;
  final int index;
  final String heroTag;

  const _AttachmentThumbnail({
    required this.imageUrl,
    required this.index,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return GestureDetector(
      onTap: () => FullScreenImageViewer.show(
        context: context,
        imageUrl: imageUrl,
        heroTag: heroTag,
        title: l10n.attachmentNumber(index + 1),
      ),
      child: Container(
        width: AppSizes.attachmentThumbSize,
        height: AppSizes.attachmentThumbSize,
        margin: EdgeInsets.only(right: AppSizes.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.radius),
          border: Border.all(color: BrandColors.outline.withOpacity(0.3)),
        ),
        child: Stack(
          children: [
            Hero(
              tag: heroTag,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radius),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: AppSizes.attachmentThumbSize,
                  height: AppSizes.attachmentThumbSize,
                  placeholder: (context, url) => Container(
                    color: BrandColors.surfaceContainerHighest,
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(BrandColors.primary),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: BrandColors.surfaceContainerHighest,
                    child: Icon(
                      Icons.broken_image,
                      color: BrandColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
            // Index badge
            Positioned(
              top: AppSizes.xs,
              left: AppSizes.xs,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.xs, vertical: AppSizes.xxs),
                decoration: BoxDecoration(
                  color: BrandColors.overlaySolid.withOpacity(0.54),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Text(
                  '${index + 1}',
                  style: context.caption(color: BrandColors.textLight),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
