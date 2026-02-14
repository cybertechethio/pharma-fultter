import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/enums/transaction_type_enum.dart';

enum TransactionFlowStep {
  type,
  items,
  attachments,
  paymentMethods,
}

class TransactionFlowHeader extends StatelessWidget {
  final TransactionFlowStep currentStep;
  final TransactionType? selectedType;
  final int itemCount;
  final int attachmentCount;
  final int paymentMethodCount;
  final VoidCallback? onTypeTap;
  final VoidCallback? onItemsTap;
  final VoidCallback? onAttachmentsTap;
  final VoidCallback? onPaymentMethodsTap;

  const TransactionFlowHeader({
    super.key,
    required this.currentStep,
    this.selectedType,
    this.itemCount = 0,
    this.attachmentCount = 0,
    this.paymentMethodCount = 0,
    this.onTypeTap,
    this.onItemsTap,
    this.onAttachmentsTap,
    this.onPaymentMethodsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.lg,
        vertical: AppSizes.md,
      ),
      decoration: BoxDecoration(
        color: BrandColors.background,
        border: Border(
          bottom: BorderSide(
            color: BrandColors.divider,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          _buildStep(
            context: context,
            step: TransactionFlowStep.type,
            icon: Icons.receipt_long_rounded,
            label: selectedType?.getDisplayLabel() ?? 'Type',
            isActive: _isStepActive(TransactionFlowStep.type),
            isCompleted: selectedType != null,
            onTap: onTypeTap,
          ),
          _buildStep(
            context: context,
            step: TransactionFlowStep.items,
            icon: Icons.inventory_2_rounded,
            label: AppLocalizations.of(context).items,
            isActive: _isStepActive(TransactionFlowStep.items),
            isCompleted: itemCount > 0,
            badge: itemCount > 0 ? '$itemCount' : null,
            onTap: onItemsTap,
          ),
          _buildStep(
            context: context,
            step: TransactionFlowStep.attachments,
            icon: Icons.attach_file_rounded,
            label: AppLocalizations.of(context).attachments,
            isActive: _isStepActive(TransactionFlowStep.attachments),
            isCompleted: attachmentCount > 0,
            badge: attachmentCount > 0 ? '$attachmentCount' : null,
            onTap: onAttachmentsTap,
            isEnabled: _isAttachmentsEnabled(),
          ),
          _buildStep(
            context: context,
            step: TransactionFlowStep.paymentMethods,
            icon: Icons.payment_rounded,
            label: AppLocalizations.of(context).payment,
            isActive: _isStepActive(TransactionFlowStep.paymentMethods),
            isCompleted: paymentMethodCount > 0,
            badge: paymentMethodCount > 0 ? '$paymentMethodCount' : null,
            onTap: onPaymentMethodsTap,
            isEnabled: _isPaymentMethodsEnabled(),
          ),
        ],
      ),
    );
  }

  bool _isStepActive(TransactionFlowStep step) {
    return currentStep == step;
  }

  bool _isAttachmentsEnabled() {
    return selectedType != null &&
        (selectedType == TransactionType.sale ||
            selectedType == TransactionType.purchase ||
            selectedType == TransactionType.imported);
  }

  bool _isPaymentMethodsEnabled() {
    return selectedType != null &&
        (selectedType == TransactionType.sale ||
            selectedType == TransactionType.purchase ||
            selectedType == TransactionType.imported);
  }

  Widget _buildStep({
    required BuildContext context,
    required TransactionFlowStep step,
    required IconData icon,
    required String label,
    required bool isActive,
    required bool isCompleted,
    String? badge,
    VoidCallback? onTap,
    bool isEnabled = true,
  }) {
    final isClickable = onTap != null && isEnabled;
    final stepColor = isActive
        ? BrandColors.primary
        : isCompleted
            ? BrandColors.success
            : BrandColors.textSecondary;

    return Expanded(
      child: InkWell(
        onTap: isClickable ? onTap : null,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.sm,
            vertical: AppSizes.sm,
          ),
          decoration: BoxDecoration(
            color: isActive
                ? stepColor.withValues(alpha: 0.1)
                : BrandColors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSizes.sm),
                    decoration: BoxDecoration(
                      color: isEnabled
                          ? stepColor.withValues(alpha: 0.15)
                          : BrandColors.textDisabled.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      size: AppSizes.iconSize,
                      color: isEnabled ? stepColor : BrandColors.textDisabled,
                    ),
                  ),
                  if (badge != null)
                    Positioned(
                      top: -4,
                      right: -4,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.xs,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: isCompleted
                              ? BrandColors.success
                              : BrandColors.primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: BrandColors.background,
                            width: 1.5,
                          ),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 18,
                          minHeight: 18,
                        ),
                        child: Center(
                          child: Text(
                            badge,
                            style: context.caption(
                              color: BrandColors.textLight,
                              bold: true,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: AppSizes.xs),
              Text(
                label,
                style: context.small(
                  color: isEnabled ? stepColor : BrandColors.textDisabled,
                  bold: isActive,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

}

