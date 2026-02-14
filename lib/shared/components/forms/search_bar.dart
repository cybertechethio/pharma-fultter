import 'dart:async';
import 'package:flutter/material.dart';

import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../app/theme/text_styles.dart';

/// Reusable search bar widget with debounce functionality
/// 
/// Features:
/// - Debounced search (configurable delay)
/// - Auto-show/hide clear button
/// - Theme-aware styling
/// - Customizable hint text
/// 
/// Usage:
/// ```dart
/// AppSearchBar(
///   hintText: 'Search by name...',
///   onSearch: (query) => ref.read(provider.notifier).search(query),
///   onClear: () => ref.read(provider.notifier).load(),
/// )
/// ```
class AppSearchBar extends StatefulWidget {
  /// Hint text displayed in the search field
  final String hintText;
  
  /// Callback called when search query changes (after debounce)
  final ValueChanged<String> onSearch;
  
  /// Callback called when clear button is pressed
  final VoidCallback? onClear;
  
  /// Debounce duration (default: 500ms)
  final Duration debounceDuration;
  
  /// Padding around the search bar
  final EdgeInsets padding;
  
  /// Whether to show the search bar with filled background
  final bool filled;
  
  /// Custom border radius
  final double borderRadius;

  const AppSearchBar({
    super.key,
    required this.hintText,
    required this.onSearch,
    this.onClear,
    this.debounceDuration = const Duration(milliseconds: 500),
    this.padding = const EdgeInsets.all(AppSizes.sm),
    this.filled = true,
    this.borderRadius = AppSizes.radiusMd,
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounceTimer;

  @override
  void dispose() {
    _controller.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    // Cancel previous timer
    _debounceTimer?.cancel();
    
    // Create new timer for debounce
    _debounceTimer = Timer(widget.debounceDuration, () {
      if (mounted) {
        widget.onSearch(value);
      }
    });
  }

  void _onClear() {
    _controller.clear();
    _debounceTimer?.cancel();
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.all(AppSizes.md2),
          child: TextField(
            controller: _controller,
            style: context.body(),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: context.body(
                color: BrandColors.textSecondary.withValues(alpha: 0.5),
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 20,
                color: BrandColors.textPrimary.withValues(alpha: 0.6),
              ),
              suffixIcon: value.text.isNotEmpty
                  ? IconButton(
                      icon: Icon(
                        Icons.clear,
                        size: 18,
                        color: BrandColors.textPrimary.withValues(alpha: 0.6),
                      ),
                      onPressed: _onClear,
                      tooltip: 'Clear search',
                      padding: const EdgeInsets.all(AppSizes.sm),
                      constraints: const BoxConstraints(),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: BrandColors.outline.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: BrandColors.outline.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                borderSide: BorderSide(
                  color: BrandColors.primary.withValues(alpha: 0.5),
                  width: 1.5,
                ),
              ),
              filled: widget.filled,
              fillColor: BrandColors.background,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSizes.lg,
                vertical: AppSizes.md,
              ),
              isDense: true,
            ),
            onChanged: _onSearchChanged,
          ),
        );
      },
    );
  }
}
