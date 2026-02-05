import 'package:flutter/material.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../core/enums/transaction_type_enum.dart';
import '../../../../../shared/utils/formatters.dart';
import '../../../domain/entities/transaction.dart';

class TransactionOverviewSection extends StatelessWidget {
  final Transaction transaction;

  const TransactionOverviewSection({
    super.key,
    required this.transaction,
  });

  String _getPartyLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (transaction.transactionType == TransactionType.sale) {
      return l10n.customer;
    } else if (transaction.transactionType == TransactionType.purchase) {
      return l10n.supplier;
    }
    return l10n.party;
  }

  String _getPartyName(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (transaction.transactionType == TransactionType.sale) {
      return transaction.customerName ?? l10n.notAvailable;
    } else if (transaction.transactionType == TransactionType.purchase) {
      return transaction.supplierName ?? l10n.notAvailable;
    }
    return transaction.customerName ?? transaction.supplierName ?? l10n.notAvailable;
  }

  bool _showParty() {
    return transaction.transactionType == TransactionType.sale ||
        transaction.transactionType == TransactionType.purchase;
  }

  @override
  Widget build(BuildContext context) {
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
          Text(l10n.overview, style: context.subtitle(bold: true)),
          const SizedBox(height: AppSizes.md),
          // Party (Customer/Supplier)
          if (_showParty()) ...[
            _InfoRow(
              icon: transaction.transactionType == TransactionType.sale
                  ? Icons.person_outline
                  : Icons.business_outlined,
              label: _getPartyLabel(context),
              value: _getPartyName(context),
            ),
            const Divider(height: AppSizes.lg),
          ],
          // Created At
          _InfoRow(
            icon: Icons.calendar_today_outlined,
            label: l10n.createdAt,
            value: Formatters.formatDateTime(transaction.createdAt),
          ),
          const Divider(height: AppSizes.lg),
          // Updated At
          _InfoRow(
            icon: Icons.update_outlined,
            label: l10n.updatedAt,
            value: Formatters.formatDateTime(transaction.updatedAt),
          ),
          const Divider(height: AppSizes.lg),
          // Creator
          _InfoRow(
            icon: Icons.person_add_outlined,
            label: l10n.createdBy,
            value: transaction.creatorName ?? l10n.notAvailable,
          ),
          const Divider(height: AppSizes.lg),
          // Updator
          _InfoRow(
            icon: Icons.edit_outlined,
            label: l10n.updatedBy,
            value: transaction.updatorName ?? l10n.notAvailable,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: AppSizes.iconSizeSm, color: BrandColors.primary),
        const SizedBox(width: AppSizes.sm),
        Expanded(
          child: Text(label, style: context.small()),
        ),
        Flexible(
          child: Text(
            value,
            style: context.body(bold: true),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

