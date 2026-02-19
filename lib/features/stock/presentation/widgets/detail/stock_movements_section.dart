import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../app/theme/app_sizes.dart';
import '../../../../../app/theme/brand_colors.dart';
import '../../../../../app/theme/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../shared/components/common/empty_widget.dart';
import '../../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../stock_movement/presentation/providers/stock_movements_notifier.dart';
import '../../../../stock_movement/presentation/widgets/stock_movement_card.dart';
import '../../../domain/entities/stock.dart';

class StockMovementsSection extends ConsumerStatefulWidget {
  final Stock stock;

  const StockMovementsSection({
    super.key,
    required this.stock,
  });

  @override
  ConsumerState<StockMovementsSection> createState() =>
      _StockMovementsSectionState();
}

class _StockMovementsSectionState extends ConsumerState<StockMovementsSection> {
  static const int _initialLimit = 10;
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final asyncMovements =
        ref.watch(stockMovementsProvider(widget.stock.itemId));

    return Padding(
      padding: const EdgeInsets.all(AppSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Icon(
                Icons.swap_vert_rounded,
                size: AppSizes.iconSize,
                color: BrandColors.primary,
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Text(
                  l10n.stockMovements,
                  style: context.subtitle(bold: true),
                ),
              ),
              // Refresh button
              asyncMovements.maybeWhen(
                data: (_) => IconButton(
                  onPressed: () => ref
                      .read(stockMovementsProvider(widget.stock.itemId).notifier)
                      .refresh(),
                  icon: Icon(
                    Icons.refresh_rounded,
                    size: AppSizes.iconSize,
                    color: BrandColors.primary,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  visualDensity: VisualDensity.compact,
                ),
                orElse: () => const SizedBox.shrink(),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),

          // Content
          asyncMovements.when(
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.xl),
              child: Center(
                child: SizedBox(
                  width: AppSizes.iconSizeLg,
                  height: AppSizes.iconSizeLg,
                  child: CircularProgressIndicator(
                    strokeWidth: AppSizes.loaderStrokeWidth,
                    valueColor: AlwaysStoppedAnimation<Color>(BrandColors.primary),
                  ),
                ),
              ),
            ),
            error: (error, _) => Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
              child: Center(
                child: Column(
                  children: [
                    app_err.ErrorsWidget(
                      failure: error is Failure
                          ? error
                          : Failure.unexpectedError(error.toString()),
                    ),
                    const SizedBox(height: AppSizes.sm),
                    ElevatedButton(
                      onPressed: () => ref
                          .read(stockMovementsProvider(widget.stock.itemId).notifier)
                          .refresh(),
                      child: Text(l10n.retry),
                    ),
                  ],
                ),
              ),
            ),
            data: (movements) {
              if (movements.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                  child: Center(
                    child: EmptyWidget(
                      icon: Icons.swap_vert_rounded,
                      title: l10n.noMovements,
                      message: l10n.noStockMovementsRecorded,
                    ),
                  ),
                );
              }

              final displayCount = _isExpanded
                  ? movements.length
                  : (movements.length > _initialLimit
                      ? _initialLimit
                      : movements.length);
              final hasMore = movements.length > _initialLimit;

              return Column(
                children: [
                  // Movement count
                  Row(
                    children: [
                      Text(
                        l10n.movementCount(movements.length),
                        style: context.small(),
                      ),
                    ],
                  ),

                  // Movement list
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: displayCount,
                    separatorBuilder: (_, __) => Divider(
                      height: 1,
                      color: BrandColors.divider,
                    ),
                    itemBuilder: (context, index) {
                      return StockMovementCard(
                        movement: movements[index],
                      );
                    },
                  ),

                  // Show more / Show less button
                  if (hasMore) ...[
                    const SizedBox(height: AppSizes.sm),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      borderRadius: BorderRadius.circular(AppSizes.radiusXs),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm,
                          vertical: AppSizes.xs,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _isExpanded
                                  ? Icons.keyboard_arrow_up_rounded
                                  : Icons.keyboard_arrow_down_rounded,
                              size: AppSizes.iconSize,
                              color: BrandColors.primary,
                            ),
                            const SizedBox(width: AppSizes.xs),
                            Text(
                              _isExpanded
                                  ? l10n.showLess
                                  : l10n.moreMovements(movements.length - _initialLimit),
                              style: context.small(color: BrandColors.primary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
