import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../auth/presentation/providers/current_context_provider.dart';
import '../../../branch/presentation/providers/branch_notifier.dart';
import '../providers/form/transfer_form_notifier.dart';

class TransferBranchDropdown extends ConsumerWidget {
  const TransferBranchDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final formState = ref.watch(transferFormProvider);
    final branchesAsync = ref.watch(branchProvider);
    final contextAsync = ref.watch(currentContextProvider);
    final currentBranchId = contextAsync.value?.currentBranchId;
    final allBranches = branchesAsync.value ?? [];
    final branches = currentBranchId == null
        ? allBranches
        : allBranches.where((b) => b.id != currentBranchId).toList();
    final formNotifier = ref.read(transferFormProvider.notifier);

    final branchId = formState.request.destinationBranchId;
    return CustomDropdown<int>(
      value: branchId <= 0 ? null : branchId,
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

