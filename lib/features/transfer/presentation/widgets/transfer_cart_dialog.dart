import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/errors/failure.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../shared/components/forms/search_bar.dart' as search;
import '../../../item/domain/entities/item.dart';
import '../../../item/presentation/providers/item_notifier.dart';
import '../providers/form/transfer_form_notifier.dart';
import 'transfer_cart_card.dart';

class TransferCartDialog extends ConsumerStatefulWidget {
  const TransferCartDialog({super.key});

  static Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const TransferCartDialog(),
    );
  }

  @override
  ConsumerState<TransferCartDialog> createState() => _TransferCartDialogState();
}

class _TransferCartDialogState extends ConsumerState<TransferCartDialog> {
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
      final notifier = ref.read(itemProvider.notifier);
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
    final l10n = AppLocalizations.of(context);
    final formState = ref.watch(transferFormProvider);
    final itemsAsync = ref.watch(itemProvider);
    final notifier = ref.read(itemProvider.notifier);
    final canLoadMore = notifier.canLoadMore;

    // Sort items: cart items first, then others
    final sortedItems = itemsAsync.maybeWhen(
      data: (items) {
        final cartItemIds = formState.cartItems.keys.toSet();
        final cartItems = items.where((item) => cartItemIds.contains(item.id)).toList();
        final otherItems = items.where((item) => !cartItemIds.contains(item.id)).toList();
        return [...cartItems, ...otherItems];
      },
      orElse: () => <Item>[],
    );

    return Dialog(
      insetPadding: EdgeInsets.all(AppSizes.lg),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 800,
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Container(
              padding: EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: BrandColors.divider,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context).selectItems,
                    style: context.subtitle(bold: true),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => context.pop(),
                  ),
                ],
              ),
            ),
            // Search bar
            Padding(
              padding: EdgeInsets.all(AppSizes.md),
              child: search.AppSearchBar(
                hintText: l10n.searchByNameCodeSku,
                onSearch: (query) => ref.read(itemProvider.notifier).search(query),
                onClear: () => ref.read(itemProvider.notifier).refresh(),
                padding: EdgeInsets.zero,
              ),
            ),
            // Items list
            Flexible(
              child: itemsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                data: (items) {
                  if (items.isEmpty) {
                    return Center(
                      child: EmptyWidget(
                        icon: Icons.inventory_2_outlined,
                        title: AppLocalizations.of(context).noItems,
                        message: AppLocalizations.of(context).noItemsMessage,
                      ),
                    );
                  }
                  return RefreshIndicator(
                    onRefresh: () => ref.read(itemProvider.notifier).refresh(),
                    child: ListView.separated(
                      controller: _scrollController,
                      padding: EdgeInsets.all(AppSizes.md),
                      shrinkWrap: true,
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
                        final quantity = formState.cartQuantities[item.id] ?? 0;

                        return TransferCartCard(
                          item: item,
                          isInCart: isInCart,
                          quantity: quantity,
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
                        onPressed: () => ref.read(itemProvider.notifier).refresh(),
                        child: Text(AppLocalizations.of(context).retry),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

