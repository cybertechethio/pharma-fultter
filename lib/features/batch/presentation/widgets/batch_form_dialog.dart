import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/dialogs/standard_form_dialog.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../domain/entities/batch.dart';
import '../providers/batch_notifier.dart';
import '../providers/batch_loading_providers.dart';
import '../providers/batch_events.dart';
import '../../../item/presentation/providers/item_notifier.dart';

class BatchFormDialog extends ConsumerStatefulWidget {
  final String title;
  final String buttonText;
  final BatchEntity? initial;

  const BatchFormDialog({
    super.key,
    required this.title,
    required this.buttonText,
    this.initial,
  });

  @override
  ConsumerState<BatchFormDialog> createState() => _BatchFormDialogState();
}

class _BatchFormDialogState extends ConsumerState<BatchFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _batchName;
  int? _selectedItemId;

  @override
  void initState() {
    super.initState();
    _batchName = TextEditingController(text: widget.initial?.batchName ?? '');
    _selectedItemId = widget.initial?.itemId;
  }

  @override
  void dispose() {
    _batchName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final snackbar = ref.read(snackbarServiceProvider);
    final creating = ref.watch(batchCreateLoadingProvider);
    final updatingSet = ref.watch(batchUpdateLoadingProvider);
    final isEditing = widget.initial != null;
    final isUpdating = isEditing && updatingSet.contains(widget.initial!.id);

    // Get items for dropdown
    final itemsAsync = ref.watch(itemProvider);

    return StandardFormDialog(
      title: widget.title,
      buttonText: widget.buttonText,
      formKey: _formKey,
      isLoading: creating || isUpdating,
      loadingText: isEditing ? l10n.updating : l10n.creating,
      onSubmit: () async {
        if (!isEditing && _selectedItemId == null) {
          snackbar.showWarning('Please select an item');
          return;
        }
        if (!mounted) return;
        if (isEditing) {
          await ref.read(batchProvider.notifier).updateBatch(
                id: widget.initial!.id,
                batchName: _batchName.text.trim(),
              );
        } else {
          await ref.read(batchProvider.notifier).create(
                itemId: _selectedItemId!,
                batchName: _batchName.text.trim(),
              );
        }
      },
      formFieldsBuilder: (context, l10n) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Item Dropdown (only show when creating, not when editing)
            if (!isEditing) ...[
              itemsAsync.when(
                loading: () => const CircularProgressIndicator(),
                data: (items) {
                  // Convert item String id to int for comparison
                  final itemList = items
                      .map((item) {
                        final itemIdInt = int.tryParse(item.id);
                        if (itemIdInt == null) return null;
                        return DropdownItem<int>(
                          value: itemIdInt,
                          label: '${item.name} (${item.code})',
                        );
                      })
                      .whereType<DropdownItem<int>>()
                      .toList();

                  return CustomDropdown<int>(
                    value: _selectedItemId,
                    items: itemList,
                    onChanged: (value) {
                      setState(() {
                        _selectedItemId = value;
                      });
                    },
                    label: l10n.item,
                    hintText: 'Select an item',
                    required: true,
                  );
                },
                error: (error, stack) => Text('Error loading items: $error'),
              ),
              const SizedBox(height: AppSizes.md),
            ],
            // Batch Name Field
            CustomTextField(
              labelText: l10n.batchName,
              controller: _batchName,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.batchNameRequired;
                }
                return null;
              },
            ),
          ],
        );
      },
      eventProvider: batchUiEventsProvider,
      shouldCloseOnEvent: (event) => event is BatchCreated || event is BatchUpdated,
      onEventHandled: () => ref.read(batchUiEventsProvider.notifier).clear(),
    );
  }
}

