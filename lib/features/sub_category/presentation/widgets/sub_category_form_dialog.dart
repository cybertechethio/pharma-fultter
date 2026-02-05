import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/dialogs/standard_form_dialog.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../domain/entities/sub_category.dart';
import '../providers/sub_category_notifier.dart';
import '../providers/sub_category_loading_providers.dart';
import '../providers/sub_category_events.dart';
import '../../../category/presentation/providers/category_notifier.dart';

class SubCategoryFormDialog extends ConsumerStatefulWidget {
  final String title;
  final String buttonText;
  final SubCategory? initial;
  final int? categoryId; // If provided, hide category dropdown and use this categoryId
  final String? currentViewCategoryId; // The categoryId of the current view (for provider updates)

  const SubCategoryFormDialog({
    super.key,
    required this.title,
    required this.buttonText,
    this.initial,
    this.categoryId,
    this.currentViewCategoryId,
  });

  @override
  ConsumerState<SubCategoryFormDialog> createState() => _SubCategoryFormDialogState();
}

class _SubCategoryFormDialogState extends ConsumerState<SubCategoryFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _description;
  int? _selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.initial?.name ?? '');
    _description = TextEditingController(text: widget.initial?.description ?? '');
    // Use provided categoryId or initial categoryId, or null if creating new without category filter
    _selectedCategoryId = widget.categoryId ?? widget.initial?.categoryId;
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final creating = ref.watch(subCategoryCreateLoadingProvider);
    final updatingSet = ref.watch(subCategoryUpdateLoadingProvider);
    final isEditing = widget.initial != null;
    final isUpdating = isEditing && updatingSet.contains(widget.initial!.id);
    
    // Only watch categories if categoryId is not provided (we need dropdown)
    final shouldShowCategoryDropdown = widget.categoryId == null;
    final categoriesAsync = shouldShowCategoryDropdown ? ref.watch(categoryProvider) : null;

    return StandardFormDialog(
      title: widget.title,
      buttonText: widget.buttonText,
      formKey: _formKey,
      isLoading: creating || isUpdating,
      loadingText: isEditing ? l10n.updating : l10n.creating,
      onSubmit: () async {
        // Use widget.categoryId if provided, otherwise use _selectedCategoryId
        final categoryIdToUse = widget.categoryId ?? _selectedCategoryId;
        if (categoryIdToUse == null) return;
        if (!mounted) return;
        // Use the provider that matches the current view's categoryId
        // This ensures updates appear in the correct view
        final providerToUpdate = widget.currentViewCategoryId;
        if (isEditing) {
          await ref.read(subCategoryProvider(providerToUpdate).notifier).updateSubCategory(
                id: widget.initial!.id,
                name: _name.text.trim(),
                categoryId: categoryIdToUse,
                description: _description.text.trim(),
              );
        } else {
          await ref.read(subCategoryProvider(providerToUpdate).notifier).create(
                name: _name.text.trim(),
                categoryId: categoryIdToUse,
                description: _description.text.trim(),
              );
        }
      },
      formFieldsBuilder: (context, l10n) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Category Dropdown - only show if categoryId is not provided
            if (shouldShowCategoryDropdown) ...[
              categoriesAsync!.when(
                loading: () => const CircularProgressIndicator(),
                data: (categories) {
                  if (categories.isEmpty) {
                    return Text(l10n.noCategoriesAvailable);
                  }
                  final categoryList = categories
                      .map((category) {
                        final categoryIdInt = int.tryParse(category.id);
                        if (categoryIdInt == null) return null;
                        return DropdownItem<int>(
                          value: categoryIdInt,
                          label: category.name,
                        );
                      })
                      .whereType<DropdownItem<int>>()
                      .toList();

                  return CustomDropdown<int>(
                    value: _selectedCategoryId,
                    items: categoryList,
                    onChanged: (value) {
                      setState(() {
                        _selectedCategoryId = value;
                      });
                    },
                    label: l10n.category,
                    hintText: l10n.selectCategory,
                    required: true,
                  );
                },
                error: (error, stackTrace) => Text(l10n.errorLoadingCategories(error.toString())),
              ),
              const SizedBox(height: AppSizes.md),
            ],
            CustomTextField(
              labelText: l10n.name,
              controller: _name,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.nameRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: AppSizes.md),
            CustomTextField(
              labelText: l10n.description,
              controller: _description,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.descriptionRequired;
                }
                return null;
              },
            ),
          ],
        );
      },
      eventProvider: subCategoryUiEventsProvider,
      shouldCloseOnEvent: (event) => event is SubCategoryCreated || event is SubCategoryUpdated,
      onEventHandled: () => ref.read(subCategoryUiEventsProvider.notifier).clear(),
    );
  }
}
