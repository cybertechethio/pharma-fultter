import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/dialogs/standard_form_dialog.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../domain/entities/brand.dart';
import '../providers/brand_notifier.dart';
import '../providers/brand_loading_providers.dart';
import '../providers/brand_events.dart';

class BrandFormDialog extends ConsumerStatefulWidget {
  final String title;
  final String buttonText;
  final BrandEntity? initial;

  const BrandFormDialog({
    super.key,
    required this.title,
    required this.buttonText,
    this.initial,
  });

  @override
  ConsumerState<BrandFormDialog> createState() => _BrandFormDialogState();
}

class _BrandFormDialogState extends ConsumerState<BrandFormDialog> {
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
    final creating = ref.watch(brandCreateLoadingProvider);
    final updatingSet = ref.watch(brandUpdateLoadingProvider);
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
          await ref.read(brandProvider.notifier).updateBrand(
                id: widget.initial!.id,
                name: _name.text.trim(),
                description: _description.text.trim(),
              );
        } else {
          await ref.read(brandProvider.notifier).create(
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
      eventProvider: brandUiEventsProvider,
      shouldCloseOnEvent: (event) => event is BrandCreated || event is BrandUpdated,
      onEventHandled: () => ref.read(brandUiEventsProvider.notifier).clear(),
    );
  }
}

