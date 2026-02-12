import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../core/enums/payment_method_type_enum.dart';
import '../../../../../shared/utils/formatters.dart';
import '../../../../../shared/utils/url_utils.dart';
import '../../../../../shared/components/common/full_screen_image_viewer.dart';
import '../../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../payment_method/presentation/widgets/payment_method_form_dialog.dart';
import '../../../../payment_method/presentation/providers/payment_method_notifier.dart';
import '../../../../payment_method/presentation/providers/payment_method_loading_providers.dart';
import '../../../domain/entities/transaction.dart';
import '../../../domain/entities/payment.dart';
import '../../../domain/entities/payment_method.dart';

class TransactionPaymentSection extends ConsumerWidget {
  final Transaction transaction;

  const TransactionPaymentSection({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

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
          _PaymentBlock(
            title: l10n.payment,
            payment: transaction.payment,
            transaction: transaction,
            expandable: false,
            heroTagPrefix: 'payment_receipt_',
          ),
          if (transaction.refund != null) ...[
            const SizedBox(height: AppSizes.md),
            _PaymentBlock(
              title: l10n.refund,
              payment: transaction.refund,
              transaction: transaction,
              expandable: true,
              heroTagPrefix: 'refund_receipt_',
            ),
          ],
        ],
      ),
    );
  }
}

class _PaymentBlock extends ConsumerWidget {
  final String title;
  final Payment? payment;
  final Transaction transaction;
  final bool expandable;
  final String heroTagPrefix;

  const _PaymentBlock({
    required this.title,
    required this.payment,
    required this.transaction,
    required this.expandable,
    required this.heroTagPrefix,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final content = payment == null
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Text(l10n.noPaymentData, style: context.body()),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PaymentSummary(payment: payment!),
              const SizedBox(height: AppSizes.md),
              if (payment!.paymentMethods.isNotEmpty) ...[
                const Divider(height: AppSizes.lg),
                Row(
                  children: [
                    Text(l10n.paymentMethods, style: context.body(bold: true)),
                    const SizedBox(width: AppSizes.xxs),
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
                        '${payment!.paymentMethods.length}',
                        style: context.small(color: BrandColors.primary, bold: true),
                      ),
                    ),
                    Spacer(),
                    TextButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (dialogContext) => PaymentMethodFormDialog(
                            paymentId: payment!.id,
                            title: l10n.addPaymentMethod,
                            buttonText: l10n.add,
                          ),
                        );
                      },
                      icon: const Icon(Icons.add, size: 18),
                      label: Text(l10n.add),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.sm),
                ...payment!.paymentMethods.asMap().entries.map((entry) {
                  final index = entry.key;
                  final method = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSizes.sm),
                    child: _PaymentMethodCard(
                      paymentMethod: method,
                      heroTag: '${heroTagPrefix}${transaction.id}_$index',
                      paymentId: payment!.id,
                    ),
                  );
                }),
              ],
              if (payment!.paymentMethods.isEmpty) ...[
                const Divider(height: AppSizes.lg),
                Text(l10n.paymentMethods, style: context.body(bold: true)),
                const SizedBox(height: AppSizes.sm),
                Text(l10n.noPaymentMethods, style: context.small()),
              ],
            ],
          );

    if (expandable) {
      return ExpansionTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(title, style: context.subtitle(bold: true)),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppSizes.xs, bottom: AppSizes.md),
            child: content,
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.subtitle(bold: true)),
        const SizedBox(height: AppSizes.md),
        content,
      ],
    );
  }
}

class _PaymentSummary extends StatelessWidget {
  final Payment payment;

  const _PaymentSummary({required this.payment});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final remaining = payment.totalAmount - payment.paidAmount;

    return Column(
      children: [
        _SummaryRow(label: l10n.paymentId, value: '#${payment.id}'),
        const SizedBox(height: AppSizes.sm),
        _SummaryRow(
          label: l10n.totalAmount,
          value: Formatters.formatCurrency(payment.totalAmount),
        ),
        const SizedBox(height: AppSizes.sm),
        _SummaryRow(
          label: l10n.paidAmount,
          value: Formatters.formatCurrency(payment.paidAmount),
          valueColor: BrandColors.primary,
        ),
        const SizedBox(height: AppSizes.sm),
        _SummaryRow(
          label: l10n.remaining,
          value: Formatters.formatCurrency(remaining),
          valueColor: remaining > 0 ? BrandColors.error : BrandColors.primary,
        ),
        const SizedBox(height: AppSizes.sm),
        _SummaryRow(
          label: l10n.type,
          value: payment.paymentType ?? l10n.notAvailable,
        ),
        const SizedBox(height: AppSizes.sm),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.notes, style: context.small()),
            const SizedBox(width: AppSizes.md),
            Expanded(
              child: Text(
                payment.notes ?? l10n.notAvailable,
                style: context.body(),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: context.body()),
        Text(
          value,
          style: context.body(bold: true, color: valueColor),
        ),
      ],
    );
  }
}

class _PaymentMethodCard extends ConsumerWidget {
  final PaymentMethod paymentMethod;
  final String heroTag;
  final int paymentId;

  const _PaymentMethodCard({
    required this.paymentMethod,
    required this.heroTag,
    required this.paymentId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final methodType = paymentMethod.method;
    final deleting = ref.watch(paymentMethodDeleteLoadingProvider).contains(paymentMethod.id);
    final updating = ref.watch(paymentMethodUpdateLoadingProvider).contains(paymentMethod.id);

    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(color: BrandColors.outline.withOpacity(0.1)),
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
                Formatters.formatCurrency(paymentMethod.amount),
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
                          builder: (dialogContext) => PaymentMethodFormDialog(
                            paymentId: paymentId,
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
                onPressed: deleting
                    ? null
                    : () => _handleDelete(context, ref),
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
              Expanded(child: _DetailItem(label: l10n.id, value: '#${paymentMethod.id}')),
              Expanded(child: _DetailItem(label: l10n.bank, value: paymentMethod.bankName ?? l10n.notAvailable)),
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

    await ref.read(paymentMethodProvider.notifier).delete(
          paymentId: paymentId,
          methodId: paymentMethod.id,
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
                border: Border.all(color: BrandColors.outline.withOpacity(0.3)),
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
                          valueColor: AlwaysStoppedAnimation<Color>(BrandColors.primary),
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
