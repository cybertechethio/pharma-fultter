import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../shared/components/common/fab_button.dart';
import '../providers/model_notifier.dart';
import '../providers/model_events.dart';
import '../widgets/model_card.dart';
import '../widgets/model_form_dialog.dart';

class ModelListScreen extends ConsumerWidget {
  const ModelListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    ref.listen<ModelUiEvent?>(
      modelUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is ModelFailure) {
          snackbar.showError(next.failure);
        } else if (next is ModelCreated) {
          snackbar.showSuccess(l10n.modelCreatedSuccessfully);
        } else if (next is ModelUpdated) {
          snackbar.showSuccess(l10n.modelUpdatedSuccessfully);
        } else if (next is ModelDeleted) {
          snackbar.showSuccess(l10n.modelDeletedSuccessfully);
        }
        ref.read(modelUiEventsProvider.notifier).clear();
      },
    );
    final asyncList = ref.watch(modelProvider);
  
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.models,
      ),
      body: asyncList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.model_training_outlined,
                title: l10n.noModels,
                message: l10n.noModelsMessage,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(modelProvider.notifier).load(),
            color: BrandColors.primary,
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: BrandColors.divider,
              ),
              itemBuilder: (context, index) => ModelCard(item: items[index]),
            ),
          );
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
                onPressed: () => ref.read(modelProvider.notifier).load(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => _openCreateDialog(context),
      ),
    );
  }

  void _openCreateDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => ModelFormDialog(
        title: l10n.createModel,
        buttonText: l10n.create,
      ),
    );
  }
}

