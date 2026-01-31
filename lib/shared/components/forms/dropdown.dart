import 'package:flutter/material.dart';

/// Dropdown item model
class DropdownItem<T> {
  final T value;
  final String label;

  const DropdownItem({
    required this.value,
    required this.label,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // Find selected item only if value is not null and items are not empty
    DropdownItem<T>? selectedItem;
    if (widget.value != null && widget.items.isNotEmpty) {
      try {
        selectedItem = widget.items.firstWhere(
          (item) => item.value == widget.value,
          orElse: () => widget.items.first,
        );
      } catch (e) {
        // If no matching item found, selectedItem remains null
        selectedItem = null;
      }
    }

    final isEmpty = widget.items.isEmpty;
    final displayText = widget.value != null && selectedItem != null
        ? selectedItem.label
        : widget.hintText ?? 'Select an option';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          children: [
            Text(
              widget.label,
              style: textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            if (widget.required)
              Text(
                ' *',
                style: textTheme.labelLarge?.copyWith(
                  color: colorScheme.error,
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        // Dropdown
        InkWell(
          onTap: isEmpty ? null : () => _showDropdownDialog(context),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: isEmpty
                  ? colorScheme.surface.withOpacity(0.5)
                  : colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: widget.errorText != null
                    ? colorScheme.error
                    : colorScheme.outline.withOpacity(0.5),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    isEmpty
                        ? 'No ${widget.label.toLowerCase()} available'
                        : displayText,
                    style: textTheme.bodyLarge?.copyWith(
                      color: isEmpty
                          ? colorScheme.onSurface.withOpacity(0.4)
                          : widget.value != null
                              ? colorScheme.onSurface
                              : colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: isEmpty
                      ? colorScheme.onSurface.withOpacity(0.3)
                      : colorScheme.onSurface.withOpacity(0.6),
                ),
              ],
            ),
          ),
        ),
        // Error text
        if (widget.errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            widget.errorText!,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.error,
            ),
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Search field (if searchable)
            if (widget.searchable) ...[
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: widget.searchHint ?? 'Search...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
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

                  return ListTile(
                    title: Text(item.label),
                    selected: isSelected,
                    onTap: () => widget.onSelected(item.value),
                    trailing: isSelected
                        ? Icon(Icons.check, color: colorScheme.primary)
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

