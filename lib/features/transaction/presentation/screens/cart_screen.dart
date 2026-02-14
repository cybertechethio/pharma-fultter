import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../core/errors/failure.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../shared/components/forms/search_bar.dart' as search;
import '../../../item/domain/entities/item_with_batches.dart';
import '../../../item/presentation/providers/item_with_batches_notifier.dart';
import '../providers/form/transaction_form_notifier.dart';

import '../widgets/cart_card.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      final notifier = ref.read(itemWithBatchesProvider.notifier);
      if (notifier.canLoadMore) {
        notifier.loadMore();
      }
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.8);
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(transactionFormProvider);
    final itemsAsync = ref.watch(itemWithBatchesProvider);
    final notifier = ref.read(itemWithBatchesProvider.notifier);
    final canLoadMore = notifier.canLoadMore;

    // Sort items: cart items first, then others
    final sortedItems = itemsAsync.maybeWhen(
      data: (items) {
        final cartItemIds = formState.cartItems.keys.toSet();
        final cartItems = items.where((item) => cartItemIds.contains(item.id)).toList();
        final otherItems = items.where((item) => !cartItemIds.contains(item.id)).toList();
        return [...cartItems, ...otherItems];
      },
      orElse: () => <ItemWithBatches>[],
    );

    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.selectItems,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
            child: search.AppSearchBar(
              hintText: l10n.searchByNameCodeSku,
              onSearch: (query) => ref.read(itemWithBatchesProvider.notifier).search(query),
              onClear: () => ref.read(itemWithBatchesProvider.notifier).refresh(),
              padding: const EdgeInsets.all(AppSizes.sm),
            ),
          ),
        ),
      ),
      body: itemsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.inventory_2_outlined,
                title: l10n.noItems,
                message: l10n.noItemsMessage,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(itemWithBatchesProvider.notifier).refresh(),
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: sortedItems.length + (canLoadMore ? 1 : 0),
              separatorBuilder: (context, index) {
                if (index == sortedItems.length - 1 && canLoadMore) {
                  return const SizedBox.shrink();
                }
                return const Divider(
                  height: 1,
                  thickness: 1,
                  color: BrandColors.divider,
                );
              },
              itemBuilder: (context, index) {
                if (index == sortedItems.length) {
                  return const Padding(
                    padding: EdgeInsets.all(AppSizes.lg),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                final item = sortedItems[index];
                final isInCart = formState.cartItems.containsKey(item.id);
                final batches = formState.cartItemBatches[item.id] ?? [];
                final addDisabled = item.batches.isEmpty;

                return CartCard(
                  itemWithBatches: item,
                  isInCart: isInCart,
                  batchSelections: batches,
                  isInDialog: true,
                  addDisabled: addDisabled,
                );
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
                onPressed: () => ref.read(itemWithBatchesProvider.notifier).refresh(),
                child: Text(AppLocalizations.of(context).retry),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

