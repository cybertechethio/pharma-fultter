import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../branch/presentation/providers/branch_notifier.dart';
import '../providers/form/transfer_form_notifier.dart';

class TransferBranchDropdown extends ConsumerWidget {
  const TransferBranchDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final formState = ref.watch(transferFormProvider);
    final branchesAsync = ref.watch(branchProvider);
    final branches = branchesAsync.value ?? [];
    final formNotifier = ref.read(transferFormProvider.notifier);

    return CustomDropdown<int>(
      value: formState.request.destinationBranchId,
      items: branches.map((branch) {
        return DropdownItem<int>(
          value: int.parse(branch.id),
          label: branch.name,
        );
      }).toList(),
      onChanged: (value) {
        formNotifier.setDestinationBranch(value);
      },
      label: l10n.destinationBranch,
      hintText: l10n.selectBranch,
      required: false,
    );
  }
}

