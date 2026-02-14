import 'package:flutter/material.dart';

import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../app/theme/text_styles.dart';

/// Dropdown item model
class DropdownItem<T> {
  final T value;
  final String label;
  /// When false, the item is shown but not selectable (e.g. greyed out).
  final bool enabled;

  const DropdownItem({
    required this.value,
    required this.label,
    this.enabled = true,
  });
}

/// Custom dropdown component with search functionality
class CustomDropdown<T> extends StatefulWidget {
  final T? value;
  final List<DropdownItem<T>> items;
  final ValueChanged<T?> onChanged;
  final String label;
  final String? hintText;
  final bool required;
  final bool hideLabel;
  final String? errorText;
  final bool searchable;
  final String? searchHint;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.label,
    this.hintText,
    this.required = false,
    this.hideLabel = false,
    this.errorText,
    this.searchable = false,
    this.searchHint,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.searchable) {
      _searchController.addListener(_filterItems);
    }
  }

  @override
  void didUpdateWidget(CustomDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items && widget.searchable) {
      _filterItems();
    }
  }

  void _filterItems() {
    // This is used by the search controller listener
    // The actual filtering happens in the dialog
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Find selected item only if value is not null and items are not empty
    DropdownItem<T>? selectedItem;
    if (widget.value != null && widget.items.isNotEmpty) {
      try {
        selectedItem = widget.items.firstWhere(
          (item) => item.value == widget.value,
          orElse: () => widget.items.first,
        );
      } catch (e) {
        selectedItem = null;
      }
    }

    final isEmpty = widget.items.isEmpty;
    final displayText = widget.value != null && selectedItem != null
        ? selectedItem.label
        : widget.hintText ?? 'Select an option';

    // Match CustomTextField: subtle label (bodySmall, fuzzy), same padding/size/border
    final labelStyle = context.small(color: BrandColors.inputPlaceholder);
    final hintStyle = context.small(color: BrandColors.inputPlaceholder);
    final valueStyle = context.body(color: BrandColors.inputText);
    final isEmptyStyle = context.small(color: BrandColors.textMuted);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.hideLabel) ...[
          Row(
            children: [
              Text(
                widget.label,
                style: labelStyle,
              ),
              if (widget.required)
                Text(
                  ' *',
                  style: labelStyle.copyWith(color: BrandColors.error),
                ),
            ],
          ),
          const SizedBox(height: AppSizes.sm),
        ],
        InkWell(
          onTap: isEmpty ? null : () => _showDropdownDialog(context),
          borderRadius: BorderRadius.circular(AppSizes.radius),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.md,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: isEmpty
                  ? BrandColors.inputBackground
                  : BrandColors.background,
              borderRadius: BorderRadius.circular(AppSizes.radius),
              border: Border.all(
                color: widget.errorText != null
                    ? BrandColors.inputErrorBorder
                    : BrandColors.inputBorder,
                width: AppSizes.br,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    isEmpty
                        ? 'No ${widget.label.toLowerCase()} available'
                        : displayText,
                    style: isEmpty
                        ? isEmptyStyle
                        : (widget.value != null && selectedItem != null)
                            ? valueStyle
                            : hintStyle,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: AppSizes.iconSizeLg,
                  color: isEmpty
                      ? BrandColors.textDisabled
                      : BrandColors.inputPlaceholder,
                ),
              ],
            ),
          ),
        ),
        if (widget.errorText != null) ...[
          const SizedBox(height: AppSizes.xs),
          Text(
            widget.errorText!,
            style: context.small(color: BrandColors.error),
          ),
        ],
      ],
    );
  }

  void _showDropdownDialog(BuildContext context) {
    if (widget.items.isEmpty) return; // Don't show dialog if no items
    
    showDialog(
      context: context,
      builder: (context) => _DropdownDialog<T>(
        items: widget.items,
        selectedValue: widget.value,
        searchable: widget.searchable,
        searchHint: widget.searchHint,
        onSelected: (value) {
          widget.onChanged(value);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class _DropdownDialog<T> extends StatefulWidget {
  final List<DropdownItem<T>> items;
  final T? selectedValue;
  final bool searchable;
  final String? searchHint;
  final ValueChanged<T?> onSelected;

  const _DropdownDialog({
    required this.items,
    required this.selectedValue,
    required this.searchable,
    this.searchHint,
    required this.onSelected,
  });

  @override
  State<_DropdownDialog<T>> createState() => _DropdownDialogState<T>();
}

class _DropdownDialogState<T> extends State<_DropdownDialog<T>> {
  final TextEditingController _searchController = TextEditingController();
  List<DropdownItem<T>> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items;
    if (widget.searchable) {
      _searchController.addListener(_filterItems);
    }
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = widget.items
          .where((item) => item.label.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Search field (if searchable)
            if (widget.searchable) ...[
              Padding(
                padding: const EdgeInsets.all(AppSizes.lg),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: widget.searchHint ?? 'Search...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radius),
                    ),
                  ),
                ),
              ),
            ],
            // Items list
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  final isSelected = item.value == widget.selectedValue;
                  final isEnabled = item.enabled;

                  return ListTile(
                    title: Text(
                      item.label,
                      style: isEnabled
                          ? null
                          : context.body(
                              color: BrandColors.textPrimary.withValues(alpha: 0.38),
                            ),
                    ),
                    selected: isSelected,
                    enabled: isEnabled,
                    onTap: isEnabled
                        ? () => widget.onSelected(item.value)
                        : null,
                    trailing: isSelected
                        ? Icon(Icons.check, color: BrandColors.primary)
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

