import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../shared/components/common/initial_avatar.dart';
import '../../../../../shared/components/common/card_title.dart';
import '../../../domain/entities/supplier_customer.dart';

class SupplierCustomerHeaderSection extends StatelessWidget {
  final SupplierCustomer supplierCustomer;

  const SupplierCustomerHeaderSection({
    super.key,
    required this.supplierCustomer,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isCustomer = supplierCustomer.type == SupplierCustomerType.customer;

    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.outline.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          // Avatar and Name row
          Row(
            children: [
              InitialAvatar(name: supplierCustomer.name, size: 48),
              const SizedBox(width: AppSizes.sm),
              Expanded(child: cardTitle(title: supplierCustomer.name)),
            ],
          ),
          const SizedBox(height: AppSizes.sm),
          // Type and Status badges
          Row(
            children: [
              _Badge(
                label: isCustomer ? l10n.customer : l10n.supplier,
                color: isCustomer ? BrandColors.primary : BrandColors.secondary,
              ),
              const SizedBox(width: AppSizes.xs),
              _Badge(
                label: supplierCustomer.isActive ? l10n.active : l10n.inactive,
                color: supplierCustomer.isActive ? BrandColors.success : BrandColors.error,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          const Divider(),
          const SizedBox(height: AppSizes.sm),
          // Info rows
          _InfoRow(label: l10n.phone, value: supplierCustomer.phone),
          const SizedBox(height: AppSizes.sm),
          _InfoRow(label: l10n.accountCode, value: supplierCustomer.accountCode),
          if (supplierCustomer.tinNumber.isNotEmpty) ...[
            const SizedBox(height: AppSizes.sm),
            _InfoRow(label: l10n.tinNumber, value: supplierCustomer.tinNumber),
          ],
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;

  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.xs),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Text(
        label,
        style: context.small(bold: true, color: color),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: context.body(color: BrandColors.textSecondary)),
        Text(value, style: context.body(bold: true)),
      ],
    );
  }
}
