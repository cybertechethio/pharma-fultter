import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/branch.dart';
import '../../../../shared/components/dialogs/standard_form_dialog.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/utils/validators.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/branch_notifier.dart';
import '../providers/branch_loading_providers.dart';
import '../providers/branch_events.dart';

class BranchFormDialog extends ConsumerStatefulWidget {
  final Branch? branch; // null for create, Branch for edit
  final String title;
  final String buttonText;

  const BranchFormDialog({
    super.key,
    this.branch,
    required this.title,
    required this.buttonText,
  });

  @override
  ConsumerState<BranchFormDialog> createState() => _BranchFormDialogState();
}

class _BranchFormDialogState extends ConsumerState<BranchFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.branch != null) {
      _nameController.text = widget.branch!.name;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final creating = ref.watch(branchCreateLoadingProvider);
    final updatingSet = ref.watch(branchUpdateLoadingProvider);
    final isEditing = widget.branch != null;
    final isUpdating = isEditing && updatingSet.contains(widget.branch!.id);

    return StandardFormDialog(
      title: widget.title,
      buttonText: widget.buttonText,
      formKey: _formKey,
      isLoading: creating || isUpdating,
      loadingText: isEditing ? l10n.updating : l10n.creating,
      onSubmit: () async {
        if (!mounted) return;
        if (widget.branch == null) {
          await ref.read(branchProvider.notifier).createBranch(
                _nameController.text.trim(),
              );
        } else {
          await ref.read(branchProvider.notifier).updateBranch(
                widget.branch!.id,
                _nameController.text.trim(),
              );
        }
      },
      formFieldsBuilder: (context, l10n) => CustomTextField(
        controller: _nameController,
        labelText: l10n.branchName,
        validator: Validators.validateCompanyName,
      ),
      eventProvider: branchUiEventsProvider,
      shouldCloseOnEvent: (event) => event is BranchCreated || event is BranchUpdated,
      onEventHandled: () => ref.read(branchUiEventsProvider.notifier).clear(),
    );
  }
}