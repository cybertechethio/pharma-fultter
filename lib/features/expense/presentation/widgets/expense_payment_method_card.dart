import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../shared/utils/url_utils.dart';
import '../../../../shared/components/common/full_screen_image_viewer.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../domain/entities/expense_detail.dart';
import '../providers/expense_payment_methods_notifier.dart';
import '../providers/expense_loading_providers.dart';
import 'expense_payment_method_form_dialog.dart';

class ExpensePaymentMethodCard extends ConsumerWidget {
  final ExpensePaymentMethod paymentMethod;
  final String expenseId;
  final String heroTag;
  final bool canDelete;

  const ExpensePaymentMethodCard({
    super.key,
    required this.paymentMethod,
    required this.expenseId,
    required this.heroTag,
    this.canDelete = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final methodType = PaymentMethodType.values.firstWhere(
      (type) => type.toApiString() == paymentMethod.method,
      orElse: () => PaymentMethodType.cash,
    );
    final amount = double.tryParse(paymentMethod.amount) ?? 0.0;
    final updating =
        ref.watch(expensePaymentMethodUpdateLoadingProvider).contains(paymentMethod.id);
    final deleting =
        ref.watch(expensePaymentMethodDeleteLoadingProvider).contains(paymentMethod.id);

    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.surfaceContainerHighest.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(color: BrandColors.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(methodType.getIcon(), size: AppSizes.iconSize, color: BrandColors.primary),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Text(
                  methodType.getDisplayLabel().toUpperCase(),
                  style: context.body(bold: true),
                ),
              ),
              Text(
                Formatters.formatCurrency(amount),
                style: context.body(bold: true, color: BrandColors.primary),
              ),
              const SizedBox(width: AppSizes.sm),
              // Edit button
              IconButton(
                icon: updating
                    ? SizedBox(
                        width: AppSizes.iconSizeSm,
                        height: AppSizes.iconSizeSm,
                        child: const CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(Icons.edit_outlined, size: AppSizes.iconSizeSm),
                onPressed: updating
                    ? null
                    : () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) => ExpensePaymentMethodFormDialog(
                            expenseId: expenseId,
                            title: l10n.editPaymentMethod,
                            buttonText: l10n.update,
                            initial: paymentMethod,
                          ),
                        );
                      },
                color: BrandColors.primary,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: AppSizes.xs),
              // Delete button
              IconButton(
                icon: deleting
                    ? SizedBox(
                        width: AppSizes.iconSizeSm,
                        height: AppSizes.iconSizeSm,
                        child: const CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(Icons.delete_outline, size: AppSizes.iconSizeSm),
                onPressed: deleting || !canDelete ? null : () => _handleDelete(context, ref),
                color: BrandColors.error,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.sm),
          const Divider(height: AppSizes.xxs),
          const SizedBox(height: AppSizes.sm),
          // Details
          Row(
            children: [
              Expanded(
                  child: _DetailItem(label: l10n.id, value: '#${paymentMethod.id}')),
              Expanded(
                  child: _DetailItem(
                      label: l10n.bank,
                      value: paymentMethod.bankName ?? l10n.notAvailable)),
            ],
          ),
          const SizedBox(height: AppSizes.xs),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _DetailItem(
                  label: l10n.reference,
                  value: paymentMethod.referenceNumber ?? l10n.notAvailable,
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              _ReceiptPreview(
                attachment: paymentMethod.attachment,
                heroTag: heroTag,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _handleDelete(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await DeleteConfirmationHelper.showLocalizedDeleteConfirmation(
      context: context,
      title: l10n.deletePaymentMethod,
      message: l10n.confirmDeletePaymentMethod,
    );
    if (!confirmed) return;

    await ref.read(expensePaymentMethodsProvider.notifier).deletePaymentMethod(
          expenseId: expenseId,
          paymentMethodId: paymentMethod.id,
        );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final String value;

  const _DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.caption()),
        const SizedBox(height: AppSizes.xxs),
        Text(
          value,
          style: context.small(bold: true),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _ReceiptPreview extends StatelessWidget {
  final String? attachment;
  final String heroTag;

  const _ReceiptPreview({this.attachment, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    final imageUrl = UrlUtils.getFullImageUrl(attachment);

    // No attachment
    if (imageUrl == null) {
      final l10n = AppLocalizations.of(context);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.receipt, style: context.caption()),
          const SizedBox(height: AppSizes.xxs),
          Text(l10n.notAvailable, style: context.small(bold: true)),
        ],
      );
    }

    // Has attachment - show thumbnail
    final l10n = AppLocalizations.of(context);
    final thumbSize = AppSizes.attachmentThumbSize * 0.6;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.receipt, style: context.caption()),
        const SizedBox(height: AppSizes.xs),
        GestureDetector(
          onTap: () => FullScreenImageViewer.show(
            context: context,
            imageUrl: imageUrl,
            heroTag: heroTag,
            title: l10n.receipt,
          ),
          child: Hero(
            tag: heroTag,
            child: Container(
              width: thumbSize,
              height: thumbSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                border: Border.all(color: BrandColors.outline.withValues(alpha: 0.3)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: thumbSize,
                  height: thumbSize,
                  placeholder: (context, url) => Container(
                    color: BrandColors.surfaceContainerHighest,
                    child: Center(
                      child: SizedBox(
                        width: AppSizes.iconSizeSm,
                        height: AppSizes.iconSizeSm,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(BrandColors.primary),
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: BrandColors.surfaceContainerHighest,
                    child: Icon(
                      Icons.broken_image,
                      size: AppSizes.iconSize,
                      color: BrandColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
