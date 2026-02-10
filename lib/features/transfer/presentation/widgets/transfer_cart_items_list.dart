import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/form/transfer_form_notifier.dart';
import 'transfer_cart_card.dart';
import '../../../../shared/components/common/empty_widget.dart';

class TransferCartItemsList extends ConsumerWidget {
  const TransferCartItemsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final formState = ref.watch(transferFormProvider);
    final cartItems = formState.cartItems.values.toList();

    if (cartItems.isEmpty) {
      return Center(
        child: EmptyWidget(
          icon: Icons.shopping_cart_outlined,
          title: l10n.noItemsInCart,
          message: l10n.tapItemsIconToAdd,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: cartItems.map((item) {
        final batches = formState.cartItemBatches[item.id] ?? [];
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.sm),
          child: TransferCartCard(
            itemWithBatches: item,
            isInCart: true,
            batchSelections: batches,
            isInDialog: false,
            addDisabled: false,
          ),
        );
      }).toList(),
    );
  }
}

