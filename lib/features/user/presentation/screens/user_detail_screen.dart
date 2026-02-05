import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../routes/route_name.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../core/enums/user_type_enum.dart';
import '../../domain/entities/user.dart';
import '../providers/user_notifier.dart';
import '../providers/user_loading_providers.dart';
import '../../../user_role/presentation/widgets/branch_role_assignment_card.dart';
import '../../../user_role/presentation/widgets/assign_roles_dialog.dart';
import '../../../user_role/presentation/providers/user_role_notifier.dart';
import '../../../user_role/presentation/providers/user_role_events.dart';
import '../../../../core/services/snackbar_service.dart';

class UserDetailScreen extends ConsumerWidget {
  final int userId;

  const UserDetailScreen({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final usersAsync = ref.watch(userProvider);
    final deleting = ref.watch(userDeleteLoadingProvider).contains(userId);
    final updating = ref.watch(userUpdateLoadingProvider).contains(userId);

    // Listen to user role UI events
    ref.listen<UserRoleUiEvent?>(
      userRoleUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is UserRoleFailure) {
          snackbar.showError(next.failure);
        } else if (next is UserRolesAssigned) {
          snackbar.showSuccess(next.message);
          // Reload assignments after successful save
          ref.read(userRoleProvider(userId).notifier).load();
        }
        ref.read(userRoleUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.userDetails,
        
      ),
      body: usersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: colorScheme.error,
              ),
              const SizedBox(height: AppSizes.lg),
              Text(
                l10n.errorLoadingUser(error.toString()),
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.lg),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: Text(l10n.goBack),
              ),
            ],
          ),
        ),
        data: (users) {
          final user = users.firstWhere(
            (u) => u.id == userId,
            orElse: () => throw Exception('User not found'),
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Compact User Summary Card
                Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        // Small Avatar
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: colorScheme.primaryContainer,
                          child: Text(
                            '${user.firstName[0]}${user.lastName[0]}'.toUpperCase(),
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSizes.lg),
                        // Name and ID
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${user.firstName} ${user.lastName}',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: AppSizes.xs),
                              Text(
                                'ID: ${user.id}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Status Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: user.isActive
                                ? BrandColors.successWithOpacity(0.1)
                                : BrandColors.textMuted.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                            border: Border.all(
                              color: user.isActive ? BrandColors.success : BrandColors.textMuted,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                user.isActive ? Icons.check_circle : Icons.cancel,
                                size: 14,
                                color: user.isActive ? BrandColors.success : BrandColors.textMuted,
                              ),
                              const SizedBox(width: AppSizes.xs),
                              Text(
                                user.isActive ? l10n.active : l10n.inactive,
                                style: TextStyle(
                                  color: user.isActive ? BrandColors.success : BrandColors.textMuted,
                                  fontSize: AppSizes.fontSizeLabel,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: AppSizes.lg),

                // Personal Information Card
                _InfoCard(
                  title: l10n.personalInformation,
                  icon: Icons.person_outline,
                  children: [
                    _InfoRow(
                      icon: Icons.badge_outlined,
                      label: l10n.firstName,
                      value: user.firstName,
                    ),
                    Divider(height: AppSizes.xxl),
                    _InfoRow(
                      icon: Icons.badge_outlined,
                      label: l10n.lastName,
                      value: user.lastName,
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.lg),

                // Contact Information Card
                _InfoCard(
                  title: l10n.contactInformation,
                  icon: Icons.contact_mail_outlined,
                  children: [
                    _InfoRow(
                      icon: Icons.email_outlined,
                      label: l10n.email,
                      value: user.email,
                    ),
                    Divider(height: AppSizes.xxl),
                    _InfoRow(
                      icon: Icons.phone_outlined,
                      label: l10n.phone,
                      value: user.phone,
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.lg),

                // Account Details Card
                _InfoCard(
                  title: l10n.accountDetails,
                  icon: Icons.info_outline,
                  children: [
                    _InfoRow(
                      icon: Icons.fingerprint_outlined,
                      label: l10n.userId,
                      value: user.id.toString(),
                    ),
                    Divider(height: AppSizes.xxl),
                    _UserTypeRow(userType: user.userType, l10n: l10n),
                    Divider(height: AppSizes.xxl),
                    _InfoRow(
                      icon: Icons.toggle_on_outlined,
                      label: l10n.status,
                      value: user.isActive ? l10n.active : l10n.inactive,
                    ),
                    Divider(height: AppSizes.xxl),
                    _InfoRow(
                      icon: Icons.calendar_today_outlined,
                      label: l10n.createdAt,
                      value: DateFormat('MMM dd, yyyy • hh:mm a').format(user.createdAt),
                    ),
                  ],
                ),

                const SizedBox(height: AppSizes.lg),

                // Role Assignments Section
                _RoleAssignmentsSection(userId: userId, userName: '${user.firstName} ${user.lastName}'),

                const SizedBox(height: AppSizes.xxl),

                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: updating
                            ? null
                            : () {
                                context.push('${RouteName.users}/$userId/edit');
                              },
                        icon: updating
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.edit_outlined),
                        label: Text(l10n.edit),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSizes.md),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: deleting
                            ? null
                            : () => _confirmDelete(context, ref, usersAsync, l10n),
                        icon: deleting
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.delete_outline),
                        label: Text(l10n.delete),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          foregroundColor: colorScheme.error,
                          side: BorderSide(color: colorScheme.error),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<List<UserEntity>> usersAsync,
    AppLocalizations l10n,
  ) async {
    final user = usersAsync.value?.firstWhere(
      (u) => u.id == userId,
      orElse: () => throw Exception('User not found'),
    );

    if (user == null) return;

    final confirmed = await DeleteConfirmationHelper.showDeleteConfirmation(
      context: context,
      title: l10n.deleteUser,
      message: l10n.confirmDeleteUser('${user.firstName} ${user.lastName}'),
    );
    if (!confirmed) return;

    await ref.read(userProvider.notifier).delete(id: userId);
    if (context.mounted) {
      context.pop();
    }
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _InfoCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusSm),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: colorScheme.primary),
                const SizedBox(width: AppSizes.sm),
                Text(
                  title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.lg),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: AppSizes.fontSizeLabel,
                  ),
                ),
                const SizedBox(height: AppSizes.xs),
                Text(
                  value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserTypeRow extends StatelessWidget {
  final UserType userType;
  final AppLocalizations l10n;

  const _UserTypeRow({required this.userType, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    String getLocalizedLabel() {
      switch (userType) {
        case UserType.admin:
          return l10n.admin;
        case UserType.manager:
          return l10n.manager;
        case UserType.cashier:
          return l10n.cashier;
        case UserType.storekeeper:
          return l10n.storekeeper;
        case UserType.supervisor:
          return l10n.supervisor;
        case UserType.standard:
          return l10n.standard;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            userType.getIcon(),
            size: 20,
            color: userType.getColor(),
          ),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.userType,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontSize: AppSizes.fontSizeLabel,
                  ),
                ),
                const SizedBox(height: AppSizes.xs),
                Text(
                  getLocalizedLabel(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: userType.getColor(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RoleAssignmentsSection extends ConsumerStatefulWidget {
  final int userId;
  final String userName;

  const _RoleAssignmentsSection({
    required this.userId,
    required this.userName,
  });

  @override
  ConsumerState<_RoleAssignmentsSection> createState() => _RoleAssignmentsSectionState();
}

class _RoleAssignmentsSectionState extends ConsumerState<_RoleAssignmentsSection> {
  final Map<int, bool> _expandedBranches = {}; // branchId -> isExpanded

  void _toggleBranch(int branchId) {
    setState(() {
      _expandedBranches[branchId] = !(_expandedBranches[branchId] ?? false);
    });
  }

  void _showAssignRolesDialog() {
    final assignmentsAsync = ref.read(userRoleProvider(widget.userId));
    final currentAssignments = assignmentsAsync.value;

    showDialog(
      context: context,
      builder: (context) => AssignRolesDialog(
        userId: widget.userId,
        userName: widget.userName,
        currentAssignments: currentAssignments,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final assignmentsAsync = ref.watch(userRoleProvider(widget.userId));

    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.badge_outlined, color: colorScheme.primary),
                const SizedBox(width: AppSizes.sm),
                Text(
                  l10n.roleAssignmentsByBranch,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.lg),
            assignmentsAsync.when(
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stack) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      l10n.errorLoadingRoleAssignments(error.toString()),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.error,
                      ),
                    ),
                    const SizedBox(height: AppSizes.sm),
                    TextButton(
                      onPressed: () => ref.read(userRoleProvider(widget.userId).notifier).load(),
                      child: Text(l10n.retry),
                    ),
                  ],
                ),
              ),
              data: (assignments) {
                if (assignments.isEmpty) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSizes.xxl),
                        child: Column(
                          children: [
                            Icon(
                              Icons.badge_outlined,
                              size: 48,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(height: AppSizes.lg),
                            Text(
                              l10n.noRoleAssignmentsFound,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: AppSizes.sm),
                            Text(
                              l10n.noRoleAssignmentsMessage,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSizes.lg),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: _showAssignRolesDialog,
                          icon: const Icon(Icons.add),
                          label: Text(AppLocalizations.of(context).assignRolesToBranches),
                        ),
                      ),
                    ],
                  );
                }

                return Column(
                  children: [
                    ...assignments.map((assignment) {
                      final isExpanded = _expandedBranches[assignment.branchId] ?? false;
                      return BranchRoleAssignmentCard(
                        assignment: assignment,
                        isExpanded: isExpanded,
                        onToggle: () => _toggleBranch(assignment.branchId),
                      );
                    }).toList(),
                    const SizedBox(height: AppSizes.lg),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _showAssignRolesDialog,
                        icon: const Icon(Icons.add),
                        label: Text(l10n.assignRolesToBranches),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

