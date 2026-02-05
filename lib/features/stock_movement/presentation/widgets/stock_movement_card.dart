import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../core/enums/stock_movement_type_enum.dart';
import '../../../../core/enums/stock_movement_status_enum.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/utils/formatters.dart';
import '../../domain/entities/stock_movement.dart';

class StockMovementCard extends StatelessWidget {
  final StockMovement movement;
  final VoidCallback? onTap;

  const StockMovementCard({
    super.key,
    required this.movement,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.sm,
          horizontal: AppSizes.xs,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: Item name, type badge, and eye icon
            Row(
              children: [
                Expanded(
                  child: cardTitle(
                    title: movement.item?.name ?? l10n.itemNumber(movement.itemId.toString()),
                  ),
                ),
                const SizedBox(width: AppSizes.xs),
                _TypeBadge(movement: movement),
                const SizedBox(width: AppSizes.xs),
                // Eye icon for navigation
                IconButton(
                  onPressed: () {
                    context.push(
                      RouteName.stockMovementDetail,
                      extra: movement,
                    );
                  },
                  icon: const Icon(
                    Icons.visibility_outlined,
                    size: 20,
                  ),
                  color: BrandColors.primary,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
            const SizedBox(height: AppSizes.xs),

            // Row 2: Code, Qty, Inbound/Outbound
            Wrap(
              spacing: AppSizes.sm,
              runSpacing: AppSizes.xs,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if (movement.item?.code != null)
                  Text(movement.item!.code!, style: context.small()),
                Text(l10n.quantityLabel(movement.quantity.toString()), style: context.small()),
                if (movement.inbound > 0)
                  Text(
                    l10n.inboundLabel(movement.inbound.toStringAsFixed(0)),
                    style: context.small(color: BrandColors.info),
                  ),
                if (movement.outbound > 0)
                  Text(
                    l10n.outboundLabel(movement.outbound.toStringAsFixed(0)),
                    style: context.small(color: BrandColors.error),
                  ),
              ],
            ),
            const SizedBox(height: AppSizes.xs),

            // Row 3: Status, Branches, Creator, Date
            Row(
              children: [
                _StatusBadge(movement: movement),
                if (_hasBranchInfo()) ...[
                  const SizedBox(width: AppSizes.sm),
                  Expanded(
                    child: Text(
                      _getBranchText(l10n),
                      style: context.small(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ] else
                  const Spacer(),
                if (movement.creatorName != null) ...[
                  Text(movement.creatorName!, style: context.small()),
                  const SizedBox(width: AppSizes.xs),
                  Text('•', style: context.small()),
                  const SizedBox(width: AppSizes.xs),
                ],
                Text(
                  Formatters.formatRelativeDate(movement.createdAt),
                  style: context.small(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool _hasBranchInfo() {
    return movement.sourceBranchName != null ||
        movement.destinationBranchName != null;
  }

  String _getBranchText(AppLocalizations l10n) {
    final source = movement.sourceBranchName;
    final dest = movement.destinationBranchName;

    if (source != null && dest != null) {
      return '$source → $dest';
    } else if (source != null) {
      return l10n.fromLabel(source);
    } else if (dest != null) {
      return l10n.toLabel(dest);
    }
    return '';
  }
}

class _TypeBadge extends StatelessWidget {
  final StockMovement movement;

  const _TypeBadge({required this.movement});

  @override
  Widget build(BuildContext context) {
    final color = movement.type.getColor();

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.xs,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusXs),
      ),
      child: Text(
        movement.type.getDisplayLabel().toUpperCase(),
        style: context.caption(color: color),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final StockMovement movement;

  const _StatusBadge({required this.movement});

  @override
  Widget build(BuildContext context) {
    final color = movement.status.getColor();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSizes.xs),
        Text(
          movement.status.getDisplayText(),
          style: context.label(color: color),
        ),
      ],
    );
  }
}
