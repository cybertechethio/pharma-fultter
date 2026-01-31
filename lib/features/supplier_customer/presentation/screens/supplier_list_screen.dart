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
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/supplier_customer.dart';
import '../providers/supplier_customer_notifier.dart';
import '../providers/supplier_customer_events.dart';
import '../widgets/supplier_customer_card.dart';
import '../widgets/supplier_customer_form_dialog.dart';

class SupplierListScreen extends ConsumerWidget {
  const SupplierListScreen({super.key});

  static const SupplierCustomerType type = SupplierCustomerType.supplier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    ref.listen<SupplierCustomerUiEvent?>(
      supplierCustomerUiEventsProvider(type),
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is SupplierCustomerFailure) {
          snackbar.showError(next.failure);
        } else if (next is SupplierCustomerCreated) {
          snackbar.showSuccess(next.message);
        } else if (next is SupplierCustomerUpdated) {
          snackbar.showSuccess(next.message);
        } else if (next is SupplierCustomerDeleted) {
          snackbar.showSuccess(next.message);
        }
        ref.read(supplierCustomerUiEventsProvider(type).notifier).clear();
      },
    );
    final asyncList = ref.watch(supplierCustomerProvider(type));

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.suppliers,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: search.AppSearchBar(
            hintText: 'Search by name, phone, or account code...',
            onSearch: (query) => ref.read(supplierCustomerProvider(type).notifier).search(type, query),
            onClear: () => ref.read(supplierCustomerProvider(type).notifier).load(type),
          ),
        ),
      ),
      body: asyncList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.store_outlined,
                title: 'No suppliers',
                message: "You don't have any suppliers yet.",
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(supplierCustomerProvider(type).notifier).load(type),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
              itemCount: items.length,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                thickness: 1,
                color: BrandColors.divider,
                indent: AppSizes.lg,
                endIndent: AppSizes.lg,
              ),
              itemBuilder: (context, index) => SupplierCustomerCard(
                item: items[index],
                type: type,
              ),
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
                onPressed: () => ref.read(supplierCustomerProvider(type).notifier).load(type),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => _openCreateDialog(context, l10n),
      ),
    );
  }

  void _openCreateDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => SupplierCustomerFormDialog(
        type: type,
        title: 'Create Supplier',
        buttonText: 'Create',
      ),
    );
  }
}


