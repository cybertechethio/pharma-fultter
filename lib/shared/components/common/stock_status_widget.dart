import 'package:cyber_pos/app/theme/text_styles.dart';
import 'package:flutter/material.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../core/enums/stock_status_enum.dart' as stock_enum;

class StockStatusWidget extends StatelessWidget {
  final stock_enum.StockStatus status;
  final bool showIcon;
  final bool showText;
  final double iconSize;

  const StockStatusWidget({
    super.key,
    required this.status,
    this.showIcon = true,
    this.showText = true,
    this.iconSize = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final Color color = status.getColor();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showIcon) ...[
          Icon(
            status.getIcon(),
            size: iconSize,
            color: color.withValues(alpha: 0.8),
          ),
          const SizedBox(width: AppSizes.xs),
        ],
        if (showText)
          Text(
            status.getDisplayText(),
            style: context.label(color: color, bold: false),
          ),
      ],
    );
  }
}


