import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../shared/components/forms/search_bar.dart' as search;
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../providers/stocks_provider.dart';
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
    
    final asyncStocks = ref.watch(stockProvider);
    final notifier = ref.read(stockProvider.notifier);
    final canLoadMore = notifier.canLoadMore;
    final isLoadingMore = notifier.isLoadingMore;

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.stocks,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: search.AppSearchBar(
            hintText: 'Search by item name...',
            onSearch: (query) => ref.read(stockProvider.notifier).search(query),
            onClear: () => ref.read(stockProvider.notifier).refresh(),
          ),
        ),
      ),
      body: asyncStocks.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (stocks) {
          if (stocks.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.inventory_2_outlined,
                title: l10n.noStocks,
                message: l10n.noStocksMessage,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(stockProvider.notifier).refresh(),
            color: BrandColors.primary,
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: stocks.length + (canLoadMore || isLoadingMore ? 1 : 0),
              separatorBuilder: (context, index) {
                // Don't show divider before loading indicator
                if (index == stocks.length - 1 && (canLoadMore || isLoadingMore)) {
                  return const SizedBox.shrink();
                }
                return const Divider(
                  height: 1,
                  thickness: 1,
                  color: BrandColors.divider,
                );
              },
              itemBuilder: (context, index) {
                // Show loading indicator at the end if loading more
                if (index == stocks.length) {
                  return const Padding(
                    padding: EdgeInsets.all(AppSizes.lg),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                return StockCard(stock: stocks[index]);
              },
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
                onPressed: () => ref.read(stockProvider.notifier).refresh(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

