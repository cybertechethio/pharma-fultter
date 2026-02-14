import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../routes/route_name.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/alert.dart';

/// Alert banner widget for low stock notifications
class AlertBanner extends StatelessWidget {
  final Alert alert;

  const AlertBanner({
    super.key,
    required this.alert,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    // Format stock value (handle decimal if needed)
    final stockText = alert.stock % 1 == 0
        ? alert.stock.toString()
        : alert.stock.toStringAsFixed(1);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.xl),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.sm2,
      ),
      decoration: BoxDecoration(
        color: BrandColors.alertBackground,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(
          color: BrandColors.alertBorder.withValues(alpha: 0.5),
          width: AppSizes.br,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Info icon
          Container(
            width: AppSizes.xxxl,
            height: AppSizes.xxxl,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: BrandColors.alertIcon,
                width: AppSizes.br,
              ),
            ),
            child: Icon(
              Icons.info_outline,
              color: BrandColors.alertIcon,
              size: AppSizes.iconSizeSm,
            ),
          ),
          const SizedBox(width: AppSizes.sm2),
          // Alert message and button (inline using RichText)
          Flexible(
            child: RichText(
              text: TextSpan(
                style: context.small(color: BrandColors.textPrimary).copyWith(
                  height: 1.3,
                ),
                children: [
                  TextSpan(
                    text: '${l10n.yourProduct} ',
                  ),
                  TextSpan(
                    text: alert.name,
                    style: context.small(color: BrandColors.textPrimary, bold: true),
                  ),
                  TextSpan(
                    text: ' ${l10n.isRunningLowAlreadyBelow} ',
                  ),
                  TextSpan(
                    text: '$stockText ${l10n.pcs}',
                    style: context.small(color: BrandColors.textPrimary, bold: true),
                  ),
                  const TextSpan(text: ' '),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        context.push(RouteName.stocks);
                      },
                      child: Text(
                        l10n.addStock,
                        style: context.small(
                          color: BrandColors.alertIcon,
                          bold: true,
                        ).copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: BrandColors.alertIcon,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
