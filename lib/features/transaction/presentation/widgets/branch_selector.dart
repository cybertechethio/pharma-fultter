import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../branch/presentation/providers/branch_notifier.dart';
import '../../../../shared/components/forms/dropdown.dart';

class BranchSelector extends ConsumerWidget {
  final int? selectedId;
  final ValueChanged<int?> onChanged;
  final String? errorText;
  final String? label;

  const BranchSelector({
    super.key,
    required this.selectedId,
    required this.onChanged,
    this.errorText,
    this.label,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final branchesAsync = ref.watch(branchProvider);

    return branchesAsync.when(
      loading: () => const CircularProgressIndicator(),
      data: (branches) {
        final dropdownItems = branches
            .map((branch) {
              final id = int.tryParse(branch.id);
              if (id == null) return null;
              return DropdownItem<int>(
                value: id,
                label: branch.name,
              );
            })
            .whereType<DropdownItem<int>>()
            .toList();

        return CustomDropdown<int>(
          value: selectedId,
          items: dropdownItems,
          onChanged: onChanged,
          label: label ?? 'Branch *',
          hintText: 'Select a branch',
          required: true,
          errorText: errorText,
          searchable: true,
          searchHint: 'Search branches...',
        );
      },
      error: (error, stack) => const Text('Error loading branches'),
    );
  }
}

