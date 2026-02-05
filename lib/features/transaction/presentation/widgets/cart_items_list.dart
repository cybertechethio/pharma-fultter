import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/empty_widget.dart';
import '../providers/form/transaction_form_notifier.dart';
import 'cart_card.dart';

class CartItemsList extends ConsumerWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final formState = ref.watch(transactionFormProvider);
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
      children: [
        Text(
          l10n.itemsInCart,
          style: context.subtitle(),
        ),
        SizedBox(height: AppSizes.md),
        ...cartItems.map((item) {
          final quantity = formState.cartQuantities[item.id] ?? 0;
          return CartCard(
            item: item,
            isInCart: true,
            quantity: quantity,
          );
        }).toList(),
      ],
    );
  }
}

