import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../shared/components/common/local_file_image_preview.dart';
import '../providers/form/transaction_form_notifier.dart';
import 'payment_method_dialog.dart';

class TransactionPaymentMethodsList extends ConsumerWidget {
  const TransactionPaymentMethodsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final formState = ref.watch(transactionFormProvider);
    final formNotifier = ref.read(transactionFormProvider.notifier);
    final paymentMethods = formState.request.paymentMethods ?? [];

    if (paymentMethods.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${l10n.paymentMethods} (${paymentMethods.length})',
          style: context.subtitle(),
        ),
        SizedBox(height: AppSizes.md),
        ...paymentMethods.asMap().entries.map((entry) {
          final index = entry.key;
          final method = entry.value;
          final methodType = PaymentMethodTypeExtension.fromString(method.method);

          return Container(
            margin: EdgeInsets.only(bottom: AppSizes.sm),
            padding: const EdgeInsets.all(AppSizes.sm),
            decoration: BoxDecoration(
              color: BrandColors.surfaceVariant.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(AppSizes.radius),
              border: Border.all(
                color: BrandColors.outline.withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                // Show receipt image if exists, otherwise show icon
                _buildLeadingWidget(
                  context,
                  ref,
                  method,
                  methodType,
                  formState,
                ),
                SizedBox(width: AppSizes.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        methodType.getDisplayLabel().toUpperCase(),
                        style: context.body(bold: true),
                      ),
                      if (method.bankName != null) ...[
                        SizedBox(height: AppSizes.xs),
                        Text(
                          method.bankName!,
                          style: context.small(),
                        ),
                      ],
                      if (method.referenceNumber != null) ...[
                        SizedBox(height: AppSizes.xs),
                        Text(
                          '${l10n.ref}: ${method.referenceNumber}',
                          style: context.small(),
                        ),
                      ],
                      if (method.attachment != null && method.attachment!.isNotEmpty) ...[
                        SizedBox(height: AppSizes.xs),
                        Row(
                          children: [
                            Icon(
                              Icons.attach_file,
                              size: AppSizes.iconSizeSm,
                              color: BrandColors.primary,
                            ),
                            SizedBox(width: AppSizes.xs),
                            Text(
                              l10n.receiptAttached,
                              style: context.smallPrimary(bold: true),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                Text(
                  Formatters.formatAmount(method.amount),
                  style: context.body(bold: true, color: BrandColors.primary),
                ),
                SizedBox(width: AppSizes.sm),
                IconButton(
                  icon: Icon(Icons.edit, size: AppSizes.iconSizeSm),
                  color: BrandColors.primary,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () async {
                    // Get attachment file path from form state if exists
                    final methodType = method.method;
                    final attachmentPath = formState.paymentAttachmentFilePaths[methodType];
                    
                    // Get existing payment methods excluding the current one being edited
                    final existingMethods = (formState.request.paymentMethods ?? [])
                        .where((pm) => pm != method)
                        .toList();
                    
                    final updated = await PaymentMethodDialog.show(
                      context,
                      initialPaymentMethod: method,
                      initialIndex: index,
                      initialAttachmentFilePath: attachmentPath,
                      existingPaymentMethods: existingMethods,
                    );
                    if (updated != null) {
                      formNotifier.updatePaymentMethod(index, updated);
                    }
                  },
                ),
                SizedBox(width: AppSizes.xs),
                IconButton(
                  icon: Icon(Icons.delete_outline, size: AppSizes.iconSizeSm),
                  color: BrandColors.error,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () => formNotifier.removePaymentMethod(index),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildLeadingWidget(
    BuildContext context,
    WidgetRef ref,
    dynamic method,
    PaymentMethodType methodType,
    dynamic formState,
  ) {
    // Check if attachment exists and is a file path (not URL)
    final hasAttachment = method.attachment != null &&
        method.attachment.isNotEmpty &&
        !method.attachment.startsWith('http');
    
    // Also check form state for attachment file path
    final attachmentPath = formState.paymentAttachmentFilePaths[method.method];
    final filePath = attachmentPath ?? (hasAttachment ? method.attachment : null);

    if (filePath != null) {
      return GestureDetector(
        onTap: () => LocalFileImagePreview.show(
          context: context,
          filePath: filePath,
        ),
        child: Container(
          width: AppSizes.attachmentThumbSize * 0.4,
          height: AppSizes.attachmentThumbSize * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            border: Border.all(
              color: BrandColors.outline.withValues(alpha: 0.2),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            child: Image.file(
              File(filePath),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to icon if image fails to load
                return Icon(
                  methodType.getIcon(),
                  size: AppSizes.iconSize,
                  color: BrandColors.primary,
                );
              },
            ),
          ),
        ),
      );
    }

    // Default icon if no attachment
    return Icon(
      methodType.getIcon(),
      size: AppSizes.iconSize,
      color: BrandColors.primary,
    );
  }
}

