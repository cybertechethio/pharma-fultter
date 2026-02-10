import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../data/models/create_transfer_request.dart';
import '../providers/form/transfer_form_notifier.dart';
import '../providers/transfer_notifier.dart';
import '../providers/transfer_loading_providers.dart';

class TransferBottomSheet extends ConsumerWidget {
  const TransferBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the form state to trigger rebuilds when cart changes
    final formState = ref.watch(transferFormProvider);
    final createLoading = ref.watch(transferCreateLoadingProvider);
    
    final itemCount = formState.cartItems.length;

    // Only show if cart has items
    if (itemCount == 0) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: BrandColors.background,
        boxShadow: [
          BoxShadow(
            color: BrandColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Item Count
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Items',
                    style: context.small(
                      color: BrandColors.textSecondary,
                    ),
                  ),
                  Text(
                    '$itemCount',
                    style: context.subtitle(
                      bold: true,
                      color: BrandColors.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.md),
              // Create Transfer Button
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Create Transfer',
                  onPressed: createLoading
                      ? null
                      : () => _handleCreateTransfer(context, ref),
                  isLoading: createLoading,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleCreateTransfer(BuildContext context, WidgetRef ref) async {
    final formState = ref.read(transferFormProvider);
    final formNotifier = ref.read(transferFormProvider.notifier);
    final snackbar = ref.read(snackbarServiceProvider);

    // Check items that have no batch selected
    final itemIdsWithNoBatch = <int>[];
    for (final itemId in formState.cartItems.keys) {
      final batches = formState.cartItemBatches[itemId] ?? [];
      if (batches.isEmpty) {
        itemIdsWithNoBatch.add(itemId);
      }
    }
    if (itemIdsWithNoBatch.isNotEmpty) {
      formNotifier.setItemIdsRequiringBatch(itemIdsWithNoBatch);
      return;
    }

    formNotifier.setItemIdsRequiringBatch([]);

    // Build request from form state (with cart items)
    final request = formNotifier.buildRequest();

    // Validate the built request
    final validationError = request.validate();
    if (validationError != null) {
      snackbar.showWarning(validationError);
      return;
    }

    // Create transfer
    await ref.read(transferProvider.notifier).createTransfer(
      data: request,
    );
  }
}

