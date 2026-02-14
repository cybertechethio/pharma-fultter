import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../shared/components/common/fab_button.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../providers/batch_notifier.dart';
import '../providers/batch_events.dart';
import '../widgets/batch_card.dart';
import '../widgets/batch_form_dialog.dart';
import '../../../item/domain/entities/item.dart';

class BatchListScreen extends ConsumerWidget {
  final Item item;

  const BatchListScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    // Listen to UI events for user feedback
    ref.listen<BatchUiEvent?>(
      batchUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is BatchFailure) {
          snackbar.showError(next.failure);
        } else if (next is BatchCreated) {
          snackbar.showSuccess(next.message);
        } else if (next is BatchUpdated) {
          snackbar.showSuccess(next.message);
        }
        ref.read(batchUiEventsProvider.notifier).clear();
      },
    );

    final asyncList = ref.watch(batchProvider(item.id));

    return Scaffold(
      appBar: CustomAppBar(
        title: '${item.name} ${l10n.batches}',
      ),
      body: asyncList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (batches) {
          if (batches.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.inventory_2_outlined,
                title: l10n.noBatches,
                message: l10n.noBatchesMessage,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(batchProvider(item.id));
            },
            color: BrandColors.primary,
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: batches.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: BrandColors.divider,
              ),
              itemBuilder: (context, index) {
                return BatchCard(batch: batches[index]);
              },
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              app_err.ErrorsWidget(
                failure: error is Failure
                    ? error
                    : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: AppSizes.lg),
              ElevatedButton(
                onPressed: () => ref.invalidate(batchProvider(item.id)),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => _openCreateDialog(context, ref),
      ),
    );
  }

  void _openCreateDialog(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => BatchFormDialog(
        title: l10n.createBatch,
        buttonText: l10n.create,
        itemId: item.id,
      ),
    );
  }
}
