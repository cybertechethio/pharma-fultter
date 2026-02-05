import 'package:flutter/material.dart';
import '../../domain/entities/user_role.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';

class BranchRoleAssignmentCard extends StatelessWidget {
  final UserBranchRoleAssignment assignment;
  final bool isExpanded;
  final VoidCallback onToggle;

  const BranchRoleAssignmentCard({
    super.key,
    required this.assignment,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.account_tree_outlined,
              color: colorScheme.primary,
            ),
            title: Text(
              assignment.branchName,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'ID: ${assignment.branchId}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Role count badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(AppSizes.radius),
                  ),
                  child: Text(
                    '${assignment.roles.length} ${assignment.roles.length == 1 ? 'role' : 'roles'}',
                    style: TextStyle(
                      color: colorScheme.onSecondaryContainer,
                      fontSize: AppSizes.fontSizeLabel,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: AppSizes.sm),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: colorScheme.onSurfaceVariant,
                ),
              ],
            ),
            onTap: onToggle,
          ),
          if (isExpanded) ...[
            const Divider(height: 1),
            Container(
              width: double.infinity,
              color: BrandColors.background,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Assigned Roles:',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: AppSizes.sm),
                  if (assignment.roles.isEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'No roles assigned',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )
                  else
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: assignment.roles.map((role) {
                        return Chip(
                          label: Text(role.name),
                          backgroundColor: colorScheme.surfaceContainerHighest,
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

