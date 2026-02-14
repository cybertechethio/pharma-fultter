import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/active_status.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/utils/formatters.dart';
import '../../domain/entities/batch.dart';
import '../providers/batch_loading_providers.dart';
import '../widgets/batch_form_dialog.dart';

class BatchDetailScreen extends ConsumerWidget {
  final BatchEntity batch;

  const BatchDetailScreen({
    super.key,
    required this.batch,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final updating = ref.watch(batchUpdateLoadingProvider).contains(batch.id);
    final dateFormat = DateFormat('yyyy-MM-dd');
    final dateTimeFormat = DateFormat('yyyy-MM-dd HH:mm');

    return Scaffold(
      appBar: CustomAppBar(
        title: batch.batchName,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Hero card: identity + status + edit
            _HeroCard(
              batchNumber: batch.batchNumber,
              isActive: batch.isActive,
              itemName: batch.itemName,
              itemCode: batch.itemCode,
              onEdit: () {
                showDialog(
                  context: context,
                  builder: (context) => BatchFormDialog(
                    title: l10n.edit,
                    buttonText: l10n.update,
                    initial: batch,
                  ),
                );
              },
              isUpdating: updating,
            ),
            const SizedBox(height: AppSizes.lg),
            _SectionCard(
              children: [
                _DetailRow(
                  label: l10n.quantity,
                  value: batch.quantity.toString(),
                  highlight: true,
                ),
                if (batch.costPrice != null)
                  _DetailRow(
                    label: l10n.costPrice,
                    value: Formatters.formatCurrency(batch.costPrice!),
                  ),
                if (batch.unitPrice != null)
                  _DetailRow(
                    label: l10n.unitPrice,
                    value: Formatters.formatCurrency(batch.unitPrice!),
                  ),
              ],
            ),
            if (batch.expirationDate != null ||
                batch.manufacturingDate != null ||
                (batch.supplierBatchNumber != null && batch.supplierBatchNumber!.isNotEmpty)) ...[
              const SizedBox(height: AppSizes.lg),
              _SectionCard(
                children: [
                  if (batch.expirationDate != null)
                    _DetailRow(
                      label: l10n.expirationDate,
                      value: dateFormat.format(batch.expirationDate!),
                    ),
                  if (batch.manufacturingDate != null)
                    _DetailRow(
                      label: l10n.manufacturingDate,
                      value: dateFormat.format(batch.manufacturingDate!),
                    ),
                  if (batch.supplierBatchNumber != null && batch.supplierBatchNumber!.isNotEmpty)
                    _DetailRow(
                      label: l10n.supplierBatchNumber,
                      value: batch.supplierBatchNumber!,
                    ),
                ],
              ),
            ],
            if (batch.notes != null && batch.notes!.isNotEmpty) ...[
              const SizedBox(height: AppSizes.lg),
              _SectionCard(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: AppSizes.xs),
                    child: Text(
                      batch.notes!,
                      style: context.body(),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: AppSizes.lg),
            _SectionCard(
              children: [
                _DetailRow(
                  label: l10n.created,
                  value: dateTimeFormat.format(batch.createdAt),
                ),
                if (batch.createdBy != null)
                  _DetailRow(label: l10n.createdBy, value: batch.createdBy!),
                if (batch.updatedBy != null)
                  _DetailRow(label: l10n.updatedBy, value: batch.updatedBy!),
              ],
            ),
            const SizedBox(height: AppSizes.xl),
          ],
        ),
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  final String batchNumber;
  final bool isActive;
  final String itemName;
  final String itemCode;
  final VoidCallback? onEdit;
  final bool isUpdating;

  const _HeroCard({
    required this.batchNumber,
    required this.isActive,
    required this.itemName,
    required this.itemCode,
    this.onEdit,
    this.isUpdating = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  batchNumber,
                  style: context.titlePrimary(bold: true),
                ),
              ),
              if (onEdit != null)
                IconButton(
                  icon: isUpdating
                      ? SizedBox(
                          width: AppSizes.iconSize,
                          height: AppSizes.iconSize,
                          child: CircularProgressIndicator(
                            strokeWidth: AppSizes.loaderStrokeWidth,
                            color: BrandColors.primary,
                          ),
                        )
                      : Icon(Icons.edit_outlined, size: AppSizes.iconSizeLg, color: BrandColors.primary),
                  onPressed: isUpdating ? null : onEdit,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: AppSizes.xxxl, minHeight: AppSizes.xxxl),
                ),
            ],
          ),
          const SizedBox(height: AppSizes.sm),
          Row(
            children: [
              Icon(Icons.shopping_bag_outlined, size: AppSizes.iconSizeSm, color: BrandColors.textSecondary),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Text(
                  itemName,
                  style: context.body(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.xxs),
          Row(
            children: [
              if (itemCode.isNotEmpty)
                Text(
                  AppLocalizations.of(context).itemCodeLabel(itemCode),
                  style: context.small(),
                ),
              const Spacer(),
              ActiveStatus(isActive: isActive),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final List<Widget> children;

  const _SectionCard({
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool highlight;

  const _DetailRow({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: highlight ? context.bodySecondary(bold: true) : context.bodySecondary(),
          ),
          const SizedBox(width: AppSizes.md),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: highlight ? context.bodyPrimary(bold: true) : context.body(bold: true),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
