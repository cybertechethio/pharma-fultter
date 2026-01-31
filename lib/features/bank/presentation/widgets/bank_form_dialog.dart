import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/dialogs/standard_form_dialog.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../domain/entities/bank.dart';
import '../providers/bank_notifier.dart';
import '../providers/bank_loading_providers.dart';
import '../providers/bank_events.dart';

class BankFormDialog extends ConsumerStatefulWidget {
  final String title;
  final String buttonText;
  final BankEntity? initial;

  const BankFormDialog({
    super.key,
    required this.title,
    required this.buttonText,
    this.initial,
  });

  @override
  ConsumerState<BankFormDialog> createState() => _BankFormDialogState();
}

class _BankFormDialogState extends ConsumerState<BankFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController(text: widget.initial?.name ?? '');
  }

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final creating = ref.watch(bankCreateLoadingProvider);
    final updatingSet = ref.watch(bankUpdateLoadingProvider);
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
          await ref.read(bankProvider.notifier).updateBank(
                id: widget.initial!.id,
                name: _name.text.trim(),
              );
        } else {
          await ref.read(bankProvider.notifier).create(
                name: _name.text.trim(),
              );
        }
      },
      formFieldsBuilder: (context, l10n) => CustomTextField(
        labelText: l10n.bankName,
        controller: _name,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return l10n.bankNameRequired;
          }
          return null;
        },
      ),
      eventProvider: bankUiEventsProvider,
      shouldCloseOnEvent: (event) => event is BankCreated || event is BankUpdated,
      onEventHandled: () => ref.read(bankUiEventsProvider.notifier).clear(),
    );
  }
}

