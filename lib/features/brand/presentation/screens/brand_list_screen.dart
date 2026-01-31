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
import '../providers/brand_notifier.dart';
import '../providers/brand_events.dart';
import '../widgets/brand_card.dart';
import '../widgets/brand_form_dialog.dart';

class BrandListScreen extends ConsumerWidget {
  const BrandListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    ref.listen<BrandUiEvent?>(
      brandUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is BrandFailure) {
          snackbar.showError(next.failure);
        } else if (next is BrandCreated) {
          snackbar.showSuccess(next.message);
        } else if (next is BrandUpdated) {
          snackbar.showSuccess(next.message);
        } else if (next is BrandDeleted) {
          snackbar.showSuccess(next.message);
        }
        ref.read(brandUiEventsProvider.notifier).clear();
      },
    );
    final asyncList = ref.watch(brandProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.brands,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: search.AppSearchBar(
            hintText: 'Search by name...',
            onSearch: (query) => ref.read(brandProvider.notifier).search(query),
            onClear: () => ref.read(brandProvider.notifier).load(),
          ),
        ),
      ),
      body: asyncList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.branding_watermark_outlined,
                title: l10n.noBrands,
                message: l10n.noBrandsMessage,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(brandProvider.notifier).load(),
            color: BrandColors.primary,
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: items.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: BrandColors.divider,
              ),
              itemBuilder: (context, index) => BrandCard(item: items[index]),
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
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(brandProvider.notifier).load(),
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
      builder: (context) => BrandFormDialog(
        title: l10n.createBrand,
        buttonText: l10n.create,
      ),
    );
  }
}

