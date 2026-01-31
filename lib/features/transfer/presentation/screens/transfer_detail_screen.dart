import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../core/errors/failure.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/utils/formatters.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../domain/entities/transfer.dart';
import '../providers/transfer_detail_notifier.dart';

class TransferDetailScreen extends ConsumerWidget {
  final int transferId;

  const TransferDetailScreen({
    super.key,
    required this.transferId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final asyncDetail = ref.watch(transferDetailProvider(transferId));

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Transfer Details',
      ),
      body: asyncDetail.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (detail) {
          if (detail == null) {
            return const Center(child: Text('Transfer not found'));
          }
          return _buildContent(context, detail, ref);
        },
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              app_err.ErrorsWidget(
                failure: error is Failure ? error : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: AppSizes.lg),
              ElevatedButton(
                onPressed: () => ref.invalidate(transferDetailProvider(transferId)),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, Transfer transfer, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(transferDetailProvider(transferId));
        await ref.read(transferDetailProvider(transferId).future);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transfer.transferNumber,
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: AppSizes.xs),
                              _buildTypeBadge(context, transfer.transferType),
                            ],
                          ),
                        ),
                        _buildStatusBadge(context, transfer.status),
                      ],
                    ),
                    const SizedBox(height: AppSizes.lg),
                    const Divider(),
                    const SizedBox(height: AppSizes.lg),
                    
                    // Branch Info
                    _buildInfoRow(
                      context,
                      l10n.sourceBranch,
                      transfer.sourceBranchName ?? l10n.notAvailable,
                      theme,
                      colorScheme,
                    ),
                    const SizedBox(height: AppSizes.sm),
                    _buildInfoRow(
                      context,
                      l10n.destinationBranch,
                      transfer.destinationBranchName ?? l10n.notAvailable,
                      theme,
                      colorScheme,
                    ),
                    const SizedBox(height: AppSizes.lg),
                    const Divider(),
                    const SizedBox(height: AppSizes.lg),
                    
                    // Dates
                    _buildInfoRow(
                      context,
                      l10n.createdAt,
                      Formatters.formatDateTime(transfer.createdAt),
                      theme,
                      colorScheme,
                    ),
                    if (transfer.updatedAt != null) ...[
                      const SizedBox(height: AppSizes.sm),
                      _buildInfoRow(
                        context,
                        l10n.lastUpdated,
                        Formatters.formatDateTime(transfer.updatedAt!),
                        theme,
                        colorScheme,
                      ),
                    ],
                    
                    // Notes
                    if (transfer.notes != null && transfer.notes!.isNotEmpty) ...[
                      const SizedBox(height: AppSizes.lg),
                      const Divider(),
                      const SizedBox(height: AppSizes.lg),
                      Text(
                        l10n.notes,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppSizes.sm),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(AppSizes.md),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                        ),
                        child: Text(
                          transfer.notes!,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ],
                    
                    // Related Transfer
                    if (transfer.relatedTransferId != null) ...[
                      const SizedBox(height: AppSizes.lg),
                      const Divider(),
                      const SizedBox(height: AppSizes.lg),
                      _buildInfoRow(
                        context,
                        'Related Transfer ID',
                        '#${transfer.relatedTransferId}',
                        theme,
                        colorScheme,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSizes.lg),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeBadge(BuildContext context, String transferType) {
    final theme = Theme.of(context);
    final color = _getTypeColor(transferType);
    final label = _getTypeLabel(transferType);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: AppSizes.xs),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusXs),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String status) {
    final theme = Theme.of(context);
    final color = _getStatusColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: AppSizes.xs2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(color: color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_getStatusIcon(status), size: AppSizes.iconSizeSm, color: color),
          const SizedBox(width: AppSizes.xs2),
          Text(
            status.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value,
    ThemeData theme,
    ColorScheme colorScheme,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(width: AppSizes.lg),
        Flexible(
          child: Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  String _getTypeLabel(String transferType) {
    switch (transferType.toLowerCase()) {
      case 'transfer_out':
        return 'Transfer Out';
      case 'transfer_in':
        return 'Transfer In';
      case 'transfer_in_return':
        return 'Transfer In Return';
      case 'transfer_out_return':
        return 'Transfer Out Return';
      default:
        return transferType;
    }
  }

  Color _getTypeColor(String transferType) {
    switch (transferType.toLowerCase()) {
      case 'transfer_out':
        return BrandColors.info;
      case 'transfer_in':
        return BrandColors.success;
      case 'transfer_in_return':
        return BrandColors.warning;
      case 'transfer_out_return':
        return BrandColors.error;
      default:
        return BrandColors.secondary;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return BrandColors.success;
      case 'pending':
        return BrandColors.warning;
      case 'cancelled':
        return BrandColors.error;
      default:
        return BrandColors.textMuted;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Icons.check_circle;
      case 'pending':
        return Icons.hourglass_empty;
      case 'cancelled':
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }
}








