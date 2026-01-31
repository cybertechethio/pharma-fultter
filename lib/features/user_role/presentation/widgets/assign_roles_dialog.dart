import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../domain/entities/user_role.dart';
import '../../domain/repositories/user_role_repository.dart';
import '../../../branch/presentation/providers/branch_notifier.dart';
import '../../../role/presentation/providers/role_notifier.dart';
import '../providers/user_role_notifier.dart';

class AssignRolesDialog extends ConsumerStatefulWidget {
  final int userId;
  final String userName;
  final List<UserBranchRoleAssignment>? currentAssignments;

  const AssignRolesDialog({
    super.key,
    required this.userId,
    required this.userName,
    this.currentAssignments,
  });

  @override
  ConsumerState<AssignRolesDialog> createState() => _AssignRolesDialogState();
}

class _AssignRolesDialogState extends ConsumerState<AssignRolesDialog> {
  final Map<int, Set<int>> _selectedRolesByBranch = {}; // branchId -> Set<roleId>
  final Set<int> _selectedBranches = {}; // Set<branchId>

  @override
  void initState() {
    super.initState();
    _initializeSelections();
  }

  void _initializeSelections() {
    // Pre-select branches that have assignments
    if (widget.currentAssignments != null) {
      for (final assignment in widget.currentAssignments!) {
        _selectedBranches.add(assignment.branchId);
        _selectedRolesByBranch[assignment.branchId] = 
            assignment.roles.map((r) => r.id).toSet();
      }
    }
  }

  void _toggleBranch(int branchId, bool selected) {
    setState(() {
      if (selected) {
        _selectedBranches.add(branchId);
        // Initialize with empty set if branch doesn't have assignments
        _selectedRolesByBranch.putIfAbsent(branchId, () => <int>{});
      } else {
        _selectedBranches.remove(branchId);
        _selectedRolesByBranch.remove(branchId);
      }
    });
  }

  void _toggleRole(int branchId, int roleId, bool selected) {
    setState(() {
      _selectedRolesByBranch.putIfAbsent(branchId, () => <int>{});
      if (selected) {
        _selectedRolesByBranch[branchId]!.add(roleId);
      } else {
        _selectedRolesByBranch[branchId]!.remove(roleId);
      }
    });
  }

  void _selectAllBranches(bool selectAll) {
    final branchesAsync = ref.read(branchProvider);
    branchesAsync.whenData((branches) {
      setState(() {
        if (selectAll) {
          for (final branch in branches) {
            final branchId = int.tryParse(branch.id);
            if (branchId != null) {
              _selectedBranches.add(branchId);
              _selectedRolesByBranch.putIfAbsent(branchId, () => <int>{});
            }
          }
        } else {
          _selectedBranches.clear();
          _selectedRolesByBranch.clear();
        }
      });
    });
  }

  Future<void> _handleSave() async {
    if (_selectedBranches.isEmpty) {
      final snackbar = ref.read(snackbarServiceProvider);
      snackbar.showWarning('Please select at least one branch');
      return;
    }

    // Build assignments list
    final assignments = _selectedBranches.map((branchId) {
      final roleIds = _selectedRolesByBranch[branchId]?.toList() ?? [];
      return BranchRoleAssignmentRequest(
        branchId: branchId,
        roleIds: roleIds,
      );
    }).toList();

    final notifier = ref.read(userRoleProvider(widget.userId).notifier);
    await notifier.assignRoles(assignments: assignments);

    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final branchesAsync = ref.watch(branchProvider);
    final rolesAsync = ref.watch(roleProvider);

    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600, maxHeight: 700),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Assign Roles to User',
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'User: ${widget.userName}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: branchesAsync.when(
                  loading: () => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  error: (error, stack) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: app_err.ErrorsWidget(
                      failure: error is Failure
                          ? error
                          : Failure.unexpectedError(error.toString()),
                    ),
                  ),
                  data: (branches) {
                    if (branches.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('No branches available'),
                      );
                    }

                    final allSelected = branches.every((branch) {
                      final branchId = int.tryParse(branch.id);
                      return branchId != null && _selectedBranches.contains(branchId);
                    });

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header with Select All
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Select branches and assign roles',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () => _selectAllBranches(!allSelected),
                              child: Text(allSelected ? 'Clear All' : 'Select All'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Branches with roles grouped together
                        ...branches.map((branch) {
                          final branchId = int.tryParse(branch.id);
                          if (branchId == null) return const SizedBox.shrink();

                          final isSelected = _selectedBranches.contains(branchId);
                          final currentRoleIds = _selectedRolesByBranch[branchId] ?? {};

                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Branch checkbox
                                CheckboxListTile(
                                  value: isSelected,
                                  onChanged: (value) => _toggleBranch(branchId, value ?? false),
                                  title: Text(
                                    branch.name,
                                    style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  dense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                ),
                                // Roles section (only show if branch is selected)
                                if (isSelected) ...[
                                  const Divider(height: 1),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        rolesAsync.when(
                                          loading: () => const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(16.0),
                                              child: CircularProgressIndicator(),
                                            ),
                                          ),
                                          error: (error, stack) => Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Text('Error loading roles'),
                                          ),
                                          data: (roles) {
                                            if (roles.isEmpty) {
                                              return Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Text(
                                                  'No roles available',
                                                  style: theme.textTheme.bodyMedium?.copyWith(
                                                    color: colorScheme.onSurfaceVariant,
                                                  ),
                                                ),
                                              );
                                            }

                                            return Wrap(
                                              spacing: 8,
                                              runSpacing: 8,
                                              children: roles.map((role) {
                                                final isRoleSelected = currentRoleIds.contains(role.id);

                                                return FilterChip(
                                                  selected: isRoleSelected,
                                                  label: Text(role.name),
                                                  onSelected: (selected) =>
                                                      _toggleRole(branchId, role.id, selected),
                                                  avatar: isRoleSelected
                                                      ? const Icon(Icons.check, size: 18)
                                                      : null,
                                                );
                                              }).toList(),
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          'Selected: ${currentRoleIds.length} ${currentRoleIds.length == 1 ? 'role' : 'roles'}',
                                          style: theme.textTheme.bodySmall?.copyWith(
                                            color: colorScheme.onSurfaceVariant,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          );
                        }).toList(),

                        const SizedBox(height: 16),

                        // Summary
                        if (_selectedBranches.isNotEmpty)
                          Card(
                            color: colorScheme.surfaceContainerHighest,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Summary:',
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  ..._selectedBranches.map((branchId) {
                                    final roleCount = _selectedRolesByBranch[branchId]?.length ?? 0;
                                    final branchName = branches.firstWhere(
                                      (b) => int.tryParse(b.id) == branchId,
                                      orElse: () => throw Exception('Branch not found'),
                                    ).name;

                                    return Text(
                                      '• $branchName: $roleCount ${roleCount == 1 ? 'role' : 'roles'}',
                                      style: theme.textTheme.bodySmall,
                                    );
                                  }).toList(),
                                  const SizedBox(height: 4),
                                  Builder(
                                    builder: (context) {
                                      final totalRoles = _selectedRolesByBranch.values
                                          .fold<int>(0, (sum, roleIds) => sum + roleIds.length);
                                      return Text(
                                        'Total: ${_selectedBranches.length} branches, $totalRoles role assignments',
                                        style: theme.textTheme.bodySmall?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // Footer
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(l10n.cancel),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: CustomButton(
                      text: 'Save All Assignments',
                      onPressed: _handleSave,
                      width: null, // Let Flexible handle the width
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

