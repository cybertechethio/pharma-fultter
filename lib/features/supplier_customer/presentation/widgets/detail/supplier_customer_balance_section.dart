import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../domain/entities/supplier_customer.dart';
import 'supplier_customer_payment_dialog.dart';

class SupplierCustomerBalanceSection extends StatelessWidget {
  final SupplierCustomer supplierCustomer;

  const SupplierCustomerBalanceSection({
    super.key,
    required this.supplierCustomer,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final balanceValue = double.tryParse(supplierCustomer.balance) ?? 0.0;
    final isPositive = balanceValue >= 0;
    final valueColor = isPositive ? BrandColors.success : BrandColors.error;

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.balance,
                style: context.body(color: BrandColors.textSecondary),
              ),
              Text(
                NumberFormat.currency(symbol: 'ETB ', decimalDigits: 2).format(balanceValue),
                style: context.subtitle(bold: true, color: valueColor),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: () => SupplierCustomerPaymentDialog.show(
                    context,
                    supplierCustomer: supplierCustomer,
                    isRefund: false,
                  ),
                  icon: Icon(Icons.add_circle_outline, size: AppSizes.iconSizeSm, color: BrandColors.success),
                  label: Text(
                    l10n.addBalance,
                    style: context.body(color: BrandColors.success),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: TextButton.icon(
                  onPressed: () => SupplierCustomerPaymentDialog.show(
                    context,
                    supplierCustomer: supplierCustomer,
                    isRefund: true,
                  ),
                  icon: Icon(Icons.replay_outlined, size: AppSizes.iconSizeSm, color: BrandColors.warning),
                  label: Text(
                    l10n.refund,
                    style: context.body(color: BrandColors.warning),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
