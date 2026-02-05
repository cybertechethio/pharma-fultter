import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../app/theme/app_sizes.dart';
import '../providers/transfer_detail_notifier.dart';
import '../providers/transfer_events.dart';
import '../widgets/detail/transfer_header_section.dart';
import '../widgets/detail/transfer_overview_section.dart';
import '../widgets/detail/transfer_summary_section.dart';
import '../widgets/detail/transfer_items_section.dart';

class TransferDetailScreen extends ConsumerWidget {
  final int transferId;

  const TransferDetailScreen({
    super.key,
    required this.transferId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncDetail = ref.watch(transferDetailProvider(transferId));

    // Listen to UI events for user feedback
    ref.listen<TransferUiEvent?>(
      transferUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
          if (next is TransferFailure) {
            snackbar.showError(next.failure);
          } else if (next is TransferCreated) {
            snackbar.showSuccess(next.message);
            // Refresh the transfer detail
            ref.invalidate(transferDetailProvider(transferId));
          } else if (next is TransferStatusUpdated) {
            snackbar.showSuccess(next.message);
            // Refresh the transfer detail
          }
        ref.read(transferUiEventsProvider.notifier).clear();
      },
    );

    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.transferDetails,
      ),
      body: asyncDetail.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (transfer) => _buildContent(context, transfer, ref),
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

  Widget _buildContent(BuildContext context, transfer, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        ref.invalidate(transferDetailProvider(transferId));
        await ref.read(transferDetailProvider(transferId).future);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(AppSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header: Transfer Number, Type, Status
            TransferHeaderSection(transfer: transfer),
            const SizedBox(height: AppSizes.md),

            // 2. Overview: Branches, Dates, Creator/Updator
            TransferOverviewSection(transfer: transfer),
            const SizedBox(height: AppSizes.md),

            // 3. Summary: Notes
            TransferSummarySection(transfer: transfer),
            const SizedBox(height: AppSizes.md),

            // 4. Items: Full item details
            TransferItemsSection(transfer: transfer),
            const SizedBox(height: AppSizes.xl),
          ],
        ),
      ),
    );
  }
}

