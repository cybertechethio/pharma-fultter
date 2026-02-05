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
import '../../../setting/presentation/providers/company_notifier.dart';

/// Dashboard period selector widget that manages its own state
/// Reads default start date from company settings
/// Can sync with parent's dates via initialStartDate and initialEndDate
/// Displays date range as text with icon button to open bottom sheet
class DashboardPeriodSelector extends ConsumerStatefulWidget {
  final ValueChanged<DateTimeRange>? onDateRangeChanged;
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;

  const DashboardPeriodSelector({
    super.key,
    this.onDateRangeChanged,
    this.initialStartDate,
    this.initialEndDate,
  });

  @override
  ConsumerState<DashboardPeriodSelector> createState() =>
      _DashboardPeriodSelectorState();
}

class _DashboardPeriodSelectorState
    extends ConsumerState<DashboardPeriodSelector> {
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _startDate = widget.initialStartDate;
    _endDate = widget.initialEndDate ?? DateTime.now();
  }

  @override
  void didUpdateWidget(DashboardPeriodSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sync with parent's dates when they change
    if (widget.initialStartDate != oldWidget.initialStartDate ||
        widget.initialEndDate != oldWidget.initialEndDate) {
      setState(() {
        _startDate = widget.initialStartDate;
        _endDate = widget.initialEndDate ?? DateTime.now();
      });
    }
  }

  void _handleDateRangeChanged(DateTimeRange range) {
    setState(() {
      _startDate = range.start;
      _endDate = range.end;
    });
    // Notify parent about the change
    widget.onDateRangeChanged?.call(range);
  }

  void _showPeriodSelectorSheet() {
    final companyAsync = ref.read(companyProvider);
    final company = companyAsync.value;

    final calendarType = CalendarType.gregorian;

    final startDate = _startDate ??
        (company?.defaultStartDate ??
            DateTime.now().subtract(const Duration(days: 7)));
    final endDate = _endDate ?? DateTime.now();

    // Use PeriodSelector's bottom sheet by creating a temporary PeriodSelector
    // and calling its show method, or we can show it directly
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: BrandColors.transparent,
      builder: (context) => _PeriodSelectorSheet(
        initialStartDate: startDate,
        initialEndDate: endDate,
        calendarType: calendarType,
        onDateRangeChanged: _handleDateRangeChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final companyAsync = ref.watch(companyProvider);
    final l10n = AppLocalizations.of(context);

    final defaultStartDate = companyAsync.whenOrNull(
          data: (company) => company?.defaultStartDate,
        ) ??
        DateTime.now().subtract(const Duration(days: 7));

    final startDate = _startDate ?? defaultStartDate;
    final endDate = _endDate ?? DateTime.now();

    final calendarType = CalendarType.gregorian;

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

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSizes.lg,
        AppSizes.lg,
        AppSizes.lg,
        AppSizes.sm,
      ),
      child: InkWell(
        onTap: _showPeriodSelectorSheet,
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
        child: Row(
          children: [
            Expanded(
              child: Text(
                formattedRange,
                style: context.body(color: BrandColors.textPrimary, bold: true),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: AppSizes.sm),
            Icon(
              Icons.calendar_today_outlined,
              size: AppSizes.iconSize,
              color: BrandColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}

/// Bottom sheet for period selection (reused from PeriodSelector)
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
      // constraints: BoxConstraints(
      //   maxHeight: MediaQuery.of(context).size.height * 0.85,
      // ),
      decoration: BoxDecoration(
        color: BrandColors.cardBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: AppSizes.sm),
              width: AppSizes.xxxxl,
              height: AppSizes.xs,
              decoration: BoxDecoration(
                color: BrandColors.border.withOpacity(0.3),
                borderRadius: BorderRadius.circular(AppSizes.xxs),
              ),
            ),
          ),
      
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.lg,
              vertical: AppSizes.sm,
            ),
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
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
      
          // Quick options
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    _quickOptions.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: AppSizes.sm),
                      child: FilterChip(
                        label: Text(_quickOptions[index].label),
                        selected: _selectedQuickOption == index,
                        onSelected: (selected) {
                          if (selected) {
                            _selectQuickOption(index);
                          } else {
                            _clearSelection();
                          }
                        },
                      ),
                    ),
                  ),
                  _ClearButton(
                    onTap: _clearSelection,
                  ),
                ],
              ),
            ),
          ),
      
          const SizedBox(height: AppSizes.lg),
      
          // Date picker based on calendar type
          widget.calendarType == CalendarType.ethiopian
              ? EthiopianRangePicker(
                  startDate: CalendarConverter.toEthiopian(_startDate),
                  endDate: CalendarConverter.toEthiopian(_endDate),
                  onRangeSelected: _onEthiopianRangeSelected,
                )
              : GregorianRangePicker(
                  startDate: _startDate,
                  endDate: _endDate,
                  onRangeSelected: _onRangeSelected,
                ),
      
          // Apply button
          Center(
            child: OutlinedButton(
              onPressed: _applySelection,
              child: Text(l10n.ok),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickOption {
  final String label;
  final int days;

  _QuickOption({required this.label, required this.days});
}

/// Clear button widget
class _ClearButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ClearButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.sm2),
        decoration: BoxDecoration(
          color: BrandColors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          border: Border.all(
            color: BrandColors.error,
          ),
        ),
        child: Icon(
          Icons.close,
          size: AppSizes.iconSizeSm + 2,
          color: BrandColors.error,
        ),
      ),
    );
  }
}
