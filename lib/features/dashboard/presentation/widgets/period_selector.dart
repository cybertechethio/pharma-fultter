import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:abushakir/abushakir.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/models/calendar_type.dart';
import '../../../../shared/utils/calendar_converter.dart';
import '../../../../shared/components/date_picker/gregorian_range_picker.dart';
import '../../../../shared/components/date_picker/ethiopian_range_picker.dart';

/// A period selector widget that displays a date range and allows selection
class PeriodSelector extends ConsumerWidget {
  final DateTime startDate;
  final DateTime endDate;
  final ValueChanged<DateTimeRange> onDateRangeChanged;

  const PeriodSelector({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onDateRangeChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    const calendarType = CalendarType.gregorian;

    // Format date based on calendar type
    String formattedRange;
    if (calendarType == CalendarType.ethiopian) {
      final startEt = CalendarConverter.toEthiopian(startDate);
      final endEt = CalendarConverter.toEthiopian(endDate);
      formattedRange =
          '${CalendarConverter.formatEthiopianDate(startEt, l10n)} → ${CalendarConverter.formatEthiopianDate(endEt, l10n)}';
    } else {
      final dateFormat = DateFormat('MMM dd, yyyy');
      formattedRange =
          '${dateFormat.format(startDate)} → ${dateFormat.format(endDate)}';
    }

    return InkWell(
      onTap: () => _showPeriodSelectorSheet(context, ref),
      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.lg,
          vertical: AppSizes.md,
        ),
        decoration: BoxDecoration(
          color: BrandColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          border: Border.all(
            color: BrandColors.border.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: AppSizes.iconSizeSm + 2,
              color: BrandColors.textSecondary,
            ),
            const SizedBox(width: AppSizes.md),
            Flexible(
              child: Text(
                formattedRange,
                style: context.body(
                  color: BrandColors.textPrimary,
                  bold: true,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: AppSizes.sm),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: AppSizes.iconSize,
              color: BrandColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  void _showPeriodSelectorSheet(BuildContext context, WidgetRef ref) {
    final calendarType = CalendarType.gregorian;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: BrandColors.transparent,
      builder: (context) => _PeriodSelectorSheet(
        initialStartDate: startDate,
        initialEndDate: endDate,
        calendarType: calendarType,
        onDateRangeChanged: onDateRangeChanged,
      ),
    );
  }
}

/// Bottom sheet for period selection
class _PeriodSelectorSheet extends StatefulWidget {
  final DateTime initialStartDate;
  final DateTime initialEndDate;
  final CalendarType calendarType;
  final ValueChanged<DateTimeRange> onDateRangeChanged;

  const _PeriodSelectorSheet({
    required this.initialStartDate,
    required this.initialEndDate,
    required this.calendarType,
    required this.onDateRangeChanged,
  });

  @override
  State<_PeriodSelectorSheet> createState() => _PeriodSelectorSheetState();
}

class _PeriodSelectorSheetState extends State<_PeriodSelectorSheet> {
  late DateTime _startDate;
  late DateTime _endDate;
  int? _selectedQuickOption;

  final List<_QuickOption> _quickOptions = [
    _QuickOption(label: '1D', days: 1),
    _QuickOption(label: '2D', days: 2),
    _QuickOption(label: '7D', days: 7),
    _QuickOption(label: '10D', days: 10),
    _QuickOption(label: '30D', days: 30),
  ];

  @override
  void initState() {
    super.initState();
    _startDate = widget.initialStartDate;
    _endDate = widget.initialEndDate;
    _detectQuickOption();
  }

  void _detectQuickOption() {
    final diff = _endDate.difference(_startDate).inDays;
    final index = _quickOptions.indexWhere((o) => o.days == diff);
    _selectedQuickOption = index >= 0 ? index : null;
  }

  void _selectQuickOption(int index) {
    final option = _quickOptions[index];
    setState(() {
      _selectedQuickOption = index;
      _endDate = DateTime.now();
      _startDate = _endDate.subtract(Duration(days: option.days));
    });
  }

  void _clearSelection() {
    setState(() {
      _selectedQuickOption = null;
      _startDate = widget.initialStartDate;
      _endDate = DateTime.now();
    });
  }

  void _onRangeSelected(DateTime start, DateTime end) {
    setState(() {
      _startDate = start;
      _endDate = end;
      _selectedQuickOption = null;
      _detectQuickOption();
    });
  }

  void _onEthiopianRangeSelected(EtDatetime start, EtDatetime end) {
    setState(() {
      _startDate = CalendarConverter.toGregorian(start);
      _endDate = CalendarConverter.toGregorian(end);
      _selectedQuickOption = null;
      _detectQuickOption();
    });
  }

  void _applySelection() {
    widget.onDateRangeChanged(DateTimeRange(start: _startDate, end: _endDate));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      decoration: BoxDecoration(
        color: BrandColors.cardBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: AppSizes.sm),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: BrandColors.border.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(AppSizes.xxs),
                ),
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.selectDateRange,
                    style: context.title(color: BrandColors.textPrimary, bold: true)
                        .copyWith(fontSize: AppSizes.fontSizeTitle),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Quick select chips
            Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ..._quickOptions.asMap().entries.map((entry) {
                      final isSelected = _selectedQuickOption == entry.key;
                      return Padding(
                        padding: const EdgeInsets.only(right: AppSizes.sm),
                        child: _QuickSelectChip(
                          label: entry.value.label,
                          isSelected: isSelected,
                          onTap: () => _selectQuickOption(entry.key),
                        ),
                      );
                    }),
                    _ClearButton(
                      label: l10n.cancel,
                      onTap: _clearSelection,
                    ),
                  ],
                ),
              ),
            ),

            // Calendar picker
            Flexible(
              child: SingleChildScrollView(
                child: widget.calendarType == CalendarType.gregorian
                    ? GregorianRangePicker(
                        startDate: _startDate,
                        endDate: _endDate,
                        onRangeSelected: _onRangeSelected,
                      )
                    : EthiopianRangePicker(
                        startDate: CalendarConverter.toEthiopian(_startDate),
                        endDate: CalendarConverter.toEthiopian(_endDate),
                        onRangeSelected: _onEthiopianRangeSelected,
                      ),
              ),
            ),

            // OK button
            Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: SizedBox(
                width: double.infinity,
                height: AppSizes.btnHeight + 5,
                child: ElevatedButton(
                  onPressed: _applySelection,
                  child: Text(
                    l10n.ok,
                    style: context.body(color: BrandColors.buttonText, bold: true),
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

/// Quick option data class
class _QuickOption {
  final String label;
  final int days;

  const _QuickOption({required this.label, required this.days});
}

/// Quick select chip widget
class _QuickSelectChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _QuickSelectChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.sm2),
        decoration: BoxDecoration(
          color: isSelected ? BrandColors.primary : BrandColors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          border: Border.all(
            color: isSelected
                ? BrandColors.primary
                : BrandColors.border.withValues(alpha: 0.5),
          ),
        ),
        child: Text(
          label,
          style: context.body(
            color: isSelected ? BrandColors.textLight : BrandColors.textPrimary,
            bold: false,
          ).copyWith(fontWeight: FontWeight.w500, fontSize: AppSizes.md2),
        ),
      ),
    );
  }
}

/// Clear button widget
class _ClearButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _ClearButton({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.lg,
          vertical: AppSizes.sm2,
        ),
        decoration: BoxDecoration(
          color: BrandColors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          border: Border.all(
            color: BrandColors.error,
          ),
        ),
        child: Text(
          label,
          style: context.body(color: BrandColors.error, bold: true),
        ),
      ),
    );
  }
}