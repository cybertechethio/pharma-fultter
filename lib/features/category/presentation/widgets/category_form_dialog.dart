import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/dialogs/standard_form_dialog.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../domain/entities/category.dart';
import '../providers/category_notifier.dart';
import '../providers/category_loading_providers.dart';
import '../providers/category_events.dart';

class CategoryFormDialog extends ConsumerStatefulWidget {
  final String title;
  final String buttonText;
  final Category? initial;

  const CategoryFormDialog({
    super.key,
    required this.title,
    required this.buttonText,
    this.initial,
  });

  @override
  ConsumerState<CategoryFormDialog> createState() => _CategoryFormDialogState();
}

class _CategoryFormDialogState extends ConsumerState<CategoryFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _description;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.initial?.name ?? '');
    _description = TextEditingController(text: widget.initial?.description ?? '');
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
    final creating = ref.watch(categoryCreateLoadingProvider);
    final updatingSet = ref.watch(categoryUpdateLoadingProvider);
    final isEditing = widget.initial != null;
    final isUpdating = isEditing && updatingSet.contains(widget.initial!.id);

    return StandardFormDialog(
      title: widget.title,
      buttonText: widget.buttonText,
      formKey: _formKey,
      isLoading: creating || isUpdating,
      loadingText: isEditing ? l10n.updating : l10n.creating,
      onSubmit: () async {
        if (!mounted) return;
        if (isEditing) {
          await ref.read(categoryProvider.notifier).updateCategory(
                id: widget.initial!.id,
                name: _name.text.trim(),
                description: _description.text.trim(),
              );
        } else {
          await ref.read(categoryProvider.notifier).create(
                name: _name.text.trim(),
                description: _description.text.trim(),
              );
        }
      },
      formFieldsBuilder: (context, l10n) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
      ),
      eventProvider: categoryUiEventsProvider,
      shouldCloseOnEvent: (event) => event is CategoryCreated || event is CategoryUpdated,
      onEventHandled: () => ref.read(categoryUiEventsProvider.notifier).clear(),
    );
  }
}

