import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../category/presentation/providers/category_filter_provider.dart';
import '../../../category/domain/entities/category.dart';

/// Category selection dialog with search functionality
class CategorySelectionDialog extends ConsumerStatefulWidget {
  final int? selectedCategoryId;

  const CategorySelectionDialog({
    super.key,
    this.selectedCategoryId,
  });

  @override
  ConsumerState<CategorySelectionDialog> createState() => _CategorySelectionDialogState();
}

class _CategorySelectionDialogState extends ConsumerState<CategorySelectionDialog> {
  final TextEditingController _searchController = TextEditingController();
  List<Category> _filteredCategories = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterCategories);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCategories() {
    final categories = ref.read(categoryFilterProvider);
    final query = _searchController.text.toLowerCase().trim();

    setState(() {
      if (query.isEmpty) {
        _filteredCategories = categories;
      } else {
        _filteredCategories = categories
            .where((category) => category.name.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categories = ref.watch(categoryFilterProvider);

    // Initialize filtered list
    if (_filteredCategories.isEmpty && categories.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _filteredCategories = categories;
          });
        }
      });
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.selectCategory,
                    style: context.subtitle(bold: true),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                    tooltip: l10n.close,
                  ),
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: l10n.searchCategories,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radius),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.md),
                ),
              ),
            ),

            const SizedBox(height: AppSizes.sm),

            // Categories list
            Expanded(
              child: _filteredCategories.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSizes.xxxl),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.category_outlined,
                              size: AppSizes.xxxxl + AppSizes.lg,
                              color: BrandColors.textPrimary.withOpacity(0.3),
                            ),
                            const SizedBox(height: AppSizes.lg),
                            Text(
                              categories.isEmpty
                                  ? l10n.noCategoriesFound
                                  : l10n.noCategoriesMatchSearch,
                              style: context.body(color: BrandColors.textPrimary.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredCategories.length,
                      itemBuilder: (context, index) {
                        final category = _filteredCategories[index];
                        final categoryId = int.parse(category.id);
                        final isSelected = widget.selectedCategoryId == categoryId;

                        return ListTile(
                          title: Text(category.name),
                          selected: isSelected,
                          selectedTileColor: BrandColors.primaryContainer.withOpacity(0.3),
                          onTap: () {
                            Navigator.of(context).pop(categoryId);
                          },
                          trailing: isSelected
                              ? Icon(
                                  Icons.check_circle,
                                  color: BrandColors.primary,
                                )
                              : null,
                        );
                      },
                    ),
            ),

            // Clear selection button
            if (widget.selectedCategoryId != null)
              Padding(
                padding: const EdgeInsets.all(AppSizes.lg),
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.of(context).pop(null),
                  icon: const Icon(Icons.clear),
                  label: Text(l10n.clearSelection),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

