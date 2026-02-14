import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/enums/stock_status_enum.dart';
import '../../../../shared/components/dialogs/standard_form_dialog.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/stock.dart';
import '../providers/stock_events.dart';
import '../providers/stock_loading_providers.dart';
import '../providers/stocks_provider.dart';

class UpdateStockDialog extends ConsumerStatefulWidget {
  final Stock stock;

  const UpdateStockDialog({
    super.key,
    required this.stock,
  });

  @override
  ConsumerState<UpdateStockDialog> createState() => _UpdateStockDialogState();
}

class _UpdateStockDialogState extends ConsumerState<UpdateStockDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _thresholdController;
  late final TextEditingController _locationController;
  late StockStatus _selectedStatus;

  @override
  void initState() {
    super.initState();
    _thresholdController = TextEditingController(
      text: widget.stock.lowStockThreshold ?? '',
    );
    _locationController = TextEditingController(
      text: widget.stock.location ?? '',
    );
    _selectedStatus = widget.stock.lowStockStatus;
  }

  @override
  void dispose() {
    _thresholdController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final updatingSet = ref.watch(stockUpdateLoadingProvider);
    final isUpdating = updatingSet.contains(widget.stock.id);

    return StandardFormDialog(
      title: l10n.updateStock,
      buttonText: l10n.update,
      formKey: _formKey,
      isLoading: isUpdating,
      loadingText: l10n.updating,
      onSubmit: () async {
        if (!mounted) return;
        await ref.read(stockProvider.notifier).updateStock(
          id: widget.stock.id,
          lowStockThreshold: _thresholdController.text.trim().isEmpty 
              ? null 
              : _thresholdController.text.trim(),
          location: _locationController.text.trim().isEmpty 
              ? null 
              : _locationController.text.trim(),
          lowStockStatus: _selectedStatus,
        );
      },
      formFieldsBuilder: (context, l10n) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item name (read-only info)
          _buildItemInfo(context),
          const SizedBox(height: AppSizes.lg),

          // Low Stock Threshold
          CustomTextField(
            labelText: l10n.lowStockThreshold,
            controller: _thresholdController,
            prefixIcon: Icons.warning_amber_outlined,
            inputType: TextInputType.number,
            subtle: true,
          ),
          const SizedBox(height: AppSizes.md),

          // Location
          CustomTextField(
            labelText: l10n.location,
            controller: _locationController,
            prefixIcon: Icons.location_on_outlined,
            subtle: true,
          ),
          const SizedBox(height: AppSizes.md),

          // Status Dropdown
          _buildStatusDropdown(context, l10n),
        ],
      ),
      eventProvider: stockUiEventsProvider,
      shouldCloseOnEvent: (event) => 
          event is StockUpdated && event.entity.id == widget.stock.id,
      onEventHandled: () => ref.read(stockUiEventsProvider.notifier).clear(),
    );
  }

  Widget _buildItemInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Row(
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: AppSizes.iconSize,
            color: BrandColors.textSecondary,
          ),
          const SizedBox(width: AppSizes.sm),
          Expanded(
            child: Text(
              widget.stock.item?.name ?? AppLocalizations.of(context).unknownItem,
              style: context.body(bold: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusDropdown(BuildContext context, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.status,
          style: context.small(color: BrandColors.textMuted),
        ),
        const SizedBox(height: AppSizes.xs),
        DropdownButtonFormField<StockStatus>(
          value: _selectedStatus,
          isExpanded: false,
          menuMaxHeight: 200,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              borderSide: BorderSide(
                color: BrandColors.outline.withOpacity(0.5),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              borderSide: BorderSide(
                color: BrandColors.outline.withOpacity(0.5),
              ),
            ),
            isDense: true,
          ),
          items: StockStatus.values.map((status) {
            return DropdownMenuItem(
              value: status,
              child: Text(status.getDisplayText()),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() => _selectedStatus = value);
            }
          },
        ),
      ],
    );
  }
}
