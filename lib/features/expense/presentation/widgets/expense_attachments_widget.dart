import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/full_screen_image_viewer.dart';
import '../../../../shared/utils/url_utils.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';

class ExpenseAttachmentsWidget extends StatelessWidget {
  final List<String> attachments;

  const ExpenseAttachmentsWidget({
    super.key,
    required this.attachments,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (attachments.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.attach_file,
                  size: AppSizes.iconSize,
                  color: BrandColors.primary,
                ),
                const SizedBox(width: AppSizes.sm),
                Text(
                  l10n.attachmentsCount(attachments.length),
                  style: context.subtitle(bold: true),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.md),
            SizedBox(
              height: AppSizes.horizontalListHeight + AppSizes.xxl,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: attachments.length,
                itemBuilder: (context, index) {
                  final attachment = attachments[index];
                  final imageUrl = UrlUtils.getFullImageUrl(attachment);

                  if (imageUrl == null) {
                    return _buildPlaceholder(context, index);
                  }

                  return GestureDetector(
                    onTap: () {
                      final l10n = AppLocalizations.of(context);
                      FullScreenImageViewer.show(
                        context: context,
                        imageUrl: imageUrl,
                        heroTag: 'expense_attachment_$index',
                        title: l10n.attachmentNumber(index + 1),
                      );
                    },
                    child: Container(
                      width: AppSizes.attachmentThumbSize,
                      height: AppSizes.attachmentThumbSize,
                      margin: const EdgeInsets.only(right: AppSizes.md),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                        border: Border.all(
                          color: BrandColors.outline.withValues(alpha: 0.2),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                        child: Hero(
                          tag: 'expense_attachment_$index',
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              color: BrandColors.surfaceVariant,
                              child: Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: AppSizes.xxs,
                                  color: BrandColors.primary,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: BrandColors.surfaceVariant,
                              child: Icon(
                                Icons.broken_image,
                                color: BrandColors.textSecondary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context, int index) {
    return Container(
      width: AppSizes.attachmentThumbSize,
      height: AppSizes.attachmentThumbSize,
      margin: const EdgeInsets.only(right: AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.surfaceVariant,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(
          color: BrandColors.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Icon(
        Icons.image_not_supported,
        color: BrandColors.textSecondary,
      ),
    );
  }
}
