import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../shared/components/common/fab_button.dart';
import '../../../../shared/components/forms/search_bar.dart' as search;
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../providers/bank_notifier.dart';
import '../providers/bank_events.dart';
import '../widgets/bank_card.dart';
import '../widgets/bank_form_dialog.dart';

class BankListScreen extends ConsumerWidget {
  const BankListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    ref.listen<BankUiEvent?>(
      bankUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is BankFailure) {
          snackbar.showError(next.failure);
        } else if (next is BankCreated) {
          snackbar.showSuccess(l10n.bankCreatedSuccessfully);
        } else if (next is BankUpdated) {
          snackbar.showSuccess(l10n.bankUpdatedSuccessfully);
        } else if (next is BankDeleted) {
          snackbar.showSuccess(l10n.bankDeletedSuccessfully);
        }
        ref.read(bankUiEventsProvider.notifier).clear();
      },
    );
    final asyncList = ref.watch(bankProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.banks,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: search.AppSearchBar(
            hintText: l10n.searchByName,
            onSearch: (query) => ref.read(bankProvider.notifier).search(query),
            onClear: () => ref.read(bankProvider.notifier).load(),
          ),
        ),
      ),
      body: asyncList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.account_balance_outlined,
                title: l10n.noBanks,
                message: l10n.noBanksMessage,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(bankProvider.notifier).load(),
            color: BrandColors.primary,
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: BrandColors.divider,
              ),
              itemBuilder: (context, index) => BankCard(item: items[index]),
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
                onPressed: () => ref.read(bankProvider.notifier).load(),
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
      builder: (context) => BankFormDialog(
        title: l10n.createBank,
        buttonText: l10n.create,
      ),
    );
  }
}

