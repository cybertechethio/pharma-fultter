import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../shared/components/forms/search_bar.dart' as search;
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../providers/stocks_provider.dart';
import '../providers/stock_events.dart';
import '../widgets/stock_card.dart';

class StockListScreen extends ConsumerStatefulWidget {
  const StockListScreen({super.key});

  @override
  ConsumerState<StockListScreen> createState() => _StockListScreenState();
}

class _StockListScreenState extends ConsumerState<StockListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Listen to scroll events for infinite scroll
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Detect when user scrolls near bottom, then load more
  void _onScroll() {
    if (_isBottom) {
      final notifier = ref.read(stockProvider.notifier);
      if (notifier.canLoadMore) {
        notifier.loadMore();
      }
    }
  }

  /// Check if user has scrolled to bottom (with threshold)
  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    // Load more when 80% scrolled
    return currentScroll >= (maxScroll * 0.8);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    // Listen to UI events for snackbar feedback and invalidate
    ref.listen<StockUiEvent?>(
      stockUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        final l10n = AppLocalizations.of(context);
        if (next is StockUpdated) {
          snackbar.showSuccess(l10n.stockUpdatedSuccessfully);
          ref.invalidate(stockProvider);
        } else if (next is StockFailure) {
          snackbar.showError(next.failure);
        }
        ref.read(stockUiEventsProvider.notifier).clear();
      },
    );
    
    final asyncStocks = ref.watch(stockProvider);
    final notifier = ref.read(stockProvider.notifier);
    final canLoadMore = notifier.canLoadMore;
    final isLoadingMore = notifier.isLoadingMore;

    return Scaffold(
      body: asyncStocks.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (stocks) {
          if (stocks.isEmpty) {
            return Expanded(
              child: Center(
                child: EmptyWidget(
                  icon: Icons.inventory_2_outlined,
                  title: l10n.noStocks,
                  message: l10n.noStocksMessage,
                ),
              ),
            );
          }
          return Column(
            children: [
              // Fixed search bar at top (not scrollable)
              search.AppSearchBar(
                hintText: l10n.searchByItemName,
                onSearch: (query) => ref.read(stockProvider.notifier).search(query),
                onClear: () => ref.read(stockProvider.notifier).refresh(),
              ),
              // Scrollable content (title + list)
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => ref.read(stockProvider.notifier).refresh(),
                  color: BrandColors.primary,
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      // Header title (scrollable)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(AppSizes.sm2, 0, AppSizes.sm2, 0),
                          child: Text(
                            l10n.stocks,
                            style: context.title(color: BrandColors.textPrimary),
                          ),
                        ),
                      ),
                      // Stocks list
                      SliverPadding(
                        padding: const EdgeInsets.all(AppSizes.sm),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate((context, index) {
                            // Loading indicator at bottom
                            if (index == stocks.length) {
                              return const Padding(
                                padding: EdgeInsets.all(AppSizes.lg),
                                child: Center(child: CircularProgressIndicator()),
                              );
                            }

                            final stock = stocks[index];

                            return Column(
                              children: [
                                StockCard(stock: stock),
                                if (index < stocks.length - 1)
                                  const Divider(
                                    height: 1,
                                    thickness: 1,
                                    color: BrandColors.divider,
                                  ),
                              ],
                            );
                          }, childCount: stocks.length + (canLoadMore || isLoadingMore ? 1 : 0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
              CustomButton(
                onPressed: () => ref.read(stockProvider.notifier).refresh(),
                text: l10n.retry,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

