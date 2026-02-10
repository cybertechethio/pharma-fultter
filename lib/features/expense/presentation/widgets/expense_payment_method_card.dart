import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../shared/utils/url_utils.dart';
import '../../../../shared/components/common/full_screen_image_viewer.dart';
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
  final bool canDelete;

  const ExpensePaymentMethodCard({
    super.key,
    required this.paymentMethod,
    required this.expenseId,
    this.canDelete = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updating = ref.watch(expensePaymentMethodUpdateLoadingProvider).contains(paymentMethod.id);
    final deleting = ref.watch(expensePaymentMethodDeleteLoadingProvider).contains(paymentMethod.id);

    final method = PaymentMethodType.values.firstWhere(
      (type) => type.toApiString() == paymentMethod.method,
      orElse: () => PaymentMethodType.cash,
    );

    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.md),
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        border: Border.all(
          color: BrandColors.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    _buildPaymentMethodIconOrAttachment(method, context),
                    const SizedBox(width: AppSizes.sm),
                    Flexible(
                      child: Text(
                        method.getDisplayLabel().toUpperCase(),
                        style: context.body(bold: true),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                Formatters.formatAmount(double.tryParse(paymentMethod.amount) ?? 0.0),
                style: context.bodyPrimary(bold: true),
              ),
              if (updating || deleting) ...[
                const SizedBox(width: AppSizes.sm),
                SizedBox(
                  width: AppSizes.lg,
                  height: AppSizes.lg,
                  child: CircularProgressIndicator(
                    strokeWidth: AppSizes.xxs,
                    color: BrandColors.primary,
                  ),
                ),
              ] else ...[
                const SizedBox(width: AppSizes.sm),
                IconButton(
                  icon: Icon(Icons.edit, size: AppSizes.md2, color: BrandColors.primary),
                  onPressed: () => _handleEdit(context, ref),
                  tooltip: 'Edit payment method',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: AppSizes.xs),
                IconButton(
                  icon: Icon(Icons.delete, size: AppSizes.md2, color: BrandColors.error),
                  onPressed: canDelete ? () => _handleDelete(context, ref) : null,
                  tooltip: 'Delete payment method',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ],
          ),
          if (paymentMethod.referenceNumber != null) ...[
            const SizedBox(height: AppSizes.sm),
            Text(
              'Reference: ${paymentMethod.referenceNumber}',
              style: context.smallSecondary(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildPaymentMethodIconOrAttachment(PaymentMethodType method, BuildContext context) {
    final imageUrl = UrlUtils.getFullImageUrl(paymentMethod.attachment);

    if (imageUrl != null) {
      // Show attachment thumbnail
      final thumbSize = AppSizes.attachmentThumbSize * 0.6; // 60px - larger than icon but not full size
      return GestureDetector(
        onTap: () => FullScreenImageViewer.show(
          context: context,
          imageUrl: imageUrl,
          heroTag: 'expense_payment_receipt_${paymentMethod.id}',
          title: 'Receipt',
        ),
        child: Hero(
          tag: 'expense_payment_receipt_${paymentMethod.id}',
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
                    size: AppSizes.iconSizeSm,
                    color: BrandColors.textSecondary,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      // Show payment method icon
      return Icon(
        _getPaymentMethodIcon(method),
        size: AppSizes.iconSize,
        color: BrandColors.primary,
      );
    }
  }

  IconData _getPaymentMethodIcon(PaymentMethodType method) {
    switch (method) {
      case PaymentMethodType.cash:
        return Icons.money;
      case PaymentMethodType.telebirr:
        return Icons.phone_android;
      case PaymentMethodType.mPesa:
        return Icons.phone_android;
      case PaymentMethodType.bankTransfer:
        return Icons.account_balance;
      case PaymentMethodType.check:
        return Icons.receipt;

    }
  }

  void _handleEdit(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (dialogContext) => ExpensePaymentMethodFormDialog(
        expenseId: expenseId,
        title: AppLocalizations.of(context).editPaymentMethod,
        buttonText: AppLocalizations.of(context).update,
        initial: paymentMethod,
      ),
    );
  }

  Future<void> _handleDelete(BuildContext context, WidgetRef ref) async {
    // Check if this is the last payment method
    // The backend will handle this validation, but we can show a better message
    await ref.read(expensePaymentMethodsProvider.notifier).deletePaymentMethod(
      expenseId: expenseId,
      paymentMethodId: paymentMethod.id,
    );
  }
}
