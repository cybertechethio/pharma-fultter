import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/enums/payment_type_enum.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../../shared/components/common/full_screen_image_viewer.dart';
import '../../../../shared/utils/url_utils.dart';
import '../../../../shared/utils/formatters.dart';
import '../../domain/entities/payment_detail.dart';
import '../../domain/entities/payment_method_detail.dart';

class TransactionPaymentDetailWidget extends StatelessWidget {
  final PaymentDetail payment;

  const TransactionPaymentDetailWidget({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.payment,
                  size: 20,
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Payment Details',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _PaymentInfoRow(
              label: 'Payment Type',
              value: payment.paymentType.getDisplayLabel(),
              theme: theme,
              colorScheme: colorScheme,
            ),
            const SizedBox(height: 8),
            _PaymentInfoRow(
              label: 'Total Amount',
              value: Formatters.formatAmount(payment.totalAmount),
              theme: theme,
              colorScheme: colorScheme,
            ),
            const SizedBox(height: 8),
            _PaymentInfoRow(
              label: 'Paid Amount',
              value: Formatters.formatAmount(payment.paidAmount),
              theme: theme,
              colorScheme: colorScheme,
            ),
            const SizedBox(height: 8),
            _PaymentInfoRow(
              label: 'Date',
              value: Formatters.formatDateTime(payment.createdAt),
              theme: theme,
              colorScheme: colorScheme,
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 12),
            Text(
              'Payment Methods (${payment.paymentMethods.length})',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            ...payment.paymentMethods.map((method) => _PaymentMethodCard(
              method: method,
              theme: theme,
              colorScheme: colorScheme,
            )),
          ],
        ),
      ),
    );
  }
}

class _PaymentInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final ThemeData theme;
  final ColorScheme colorScheme;

  const _PaymentInfoRow({
    required this.label,
    required this.value,
    required this.theme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  final PaymentMethodDetail method;
  final ThemeData theme;
  final ColorScheme colorScheme;

  const _PaymentMethodCard({
    required this.method,
    required this.theme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  method.method.toApiString().toUpperCase(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                Formatters.formatAmount(method.amount),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
          if (method.referenceNumber != null) ...[
            const SizedBox(height: 8),
            Text(
              'Reference: ${method.referenceNumber}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          if (method.bankName != null) ...[
            const SizedBox(height: 4),
            Text(
              'Bank: ${method.bankName}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          if (method.attachment != null) ...[
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                final imageUrl = UrlUtils.getFullImageUrl(method.attachment!);
                if (imageUrl != null) {
                  FullScreenImageViewer.show(
                    context: context,
                    imageUrl: imageUrl,
                    heroTag: 'payment_attachment_${method.id}',
                    title: 'Payment Attachment',
                  );
                }
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: colorScheme.outline.withOpacity(0.2),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: UrlUtils.getFullImageUrl(method.attachment!) != null
                      ? CachedNetworkImage(
                          imageUrl: UrlUtils.getFullImageUrl(method.attachment!)!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: colorScheme.surfaceVariant,
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: colorScheme.surfaceVariant,
                            child: Icon(
                              Icons.broken_image,
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        )
                      : Container(
                          color: colorScheme.surfaceVariant,
                          child: Icon(
                            Icons.image_not_supported,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

