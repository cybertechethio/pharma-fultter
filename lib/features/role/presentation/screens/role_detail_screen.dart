import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../routes/route_name.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../domain/entities/role.dart';
import '../../domain/entities/role_permission.dart';
import '../providers/role_notifier.dart';

class RoleDetailScreen extends ConsumerWidget {
  final int roleId;

  const RoleDetailScreen({
    super.key,
    required this.roleId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final rolesAsync = ref.watch(roleProvider);

    return Scaffold(
      backgroundColor: BrandColors.background,
      body: rolesAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(BrandColors.primary),
          ),
        ),
        error: (error, stack) => _buildErrorState(context, l10n, error),
        data: (roles) {
          try {
            final role = roles.firstWhere((r) => r.id == roleId);
            return _buildContent(context, ref, role, l10n);
          } catch (e) {
            return _buildErrorState(context, l10n, 'Role not found');
          }
        },
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, AppLocalizations l10n, Object error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSizes.xl),
              decoration: BoxDecoration(
                color: BrandColors.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: BrandColors.error,
              ),
            ),
            const SizedBox(height: AppSizes.lg),
            Text(
              l10n.errorLoadingRole(error.toString()),
              style: context.body(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSizes.xl),
            ElevatedButton.icon(
              onPressed: () => context.pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: BrandColors.primary,
                foregroundColor: BrandColors.textLight,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.xl,
                  vertical: AppSizes.md,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                ),
              ),
              icon: const Icon(Icons.arrow_back_rounded),
              label: Text(l10n.goBack),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, RoleEntity role, AppLocalizations l10n) {
    return CustomScrollView(
      slivers: [
        // Custom App Bar with gradient
        _buildSliverAppBar(context, ref, role, l10n),
        
        // Content
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Stats Cards
              _buildStatsSection(context, role, l10n),
              
              // Description Section
              if (role.description != null && role.description!.isNotEmpty)
                _buildDescriptionSection(context, role, l10n),
              
              // Permissions Section
              _buildPermissionsHeader(context, role, l10n),
              
              // Permissions List
              if (role.permissions.isEmpty)
                _buildEmptyPermissions(context, l10n)
              else
                _buildPermissionsList(context, role.permissions),
              
              const SizedBox(height: AppSizes.xxl),
              
              // Action Buttons
              _buildActionButtons(context, ref, role, l10n),
              
              const SizedBox(height: AppSizes.xxl),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSliverAppBar(BuildContext context, WidgetRef ref, RoleEntity role, AppLocalizations l10n) {
    return SliverAppBar(
      expandedHeight: 140,
      pinned: true,
      backgroundColor: BrandColors.background,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: BrandColors.textPrimary),
        onPressed: () => context.pop(),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.edit_rounded, color: BrandColors.primary),
          onPressed: () => context.push('${RouteName.roles}/$roleId/edit'),
        ),
        const SizedBox(width: AppSizes.xs),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(AppSizes.lg, 56, AppSizes.lg, AppSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSizes.md),
                      decoration: BoxDecoration(
                        color: BrandColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppSizes.radius),
                      ),
                      child: Icon(
                        Icons.admin_panel_settings_rounded,
                        color: BrandColors.primary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: AppSizes.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            role.name,
                            style: context.title(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppSizes.xs),
                          Row(
                            children: [
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: role.isActive ? BrandColors.success : BrandColors.error,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: AppSizes.xs),
                              Text(
                                role.isActive ? l10n.active : l10n.inactive,
                                style: context.small(
                                  color: role.isActive ? BrandColors.success : BrandColors.error,
                                  bold: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context, RoleEntity role, AppLocalizations l10n) {
    final groupedPermissions = _groupPermissionsByCategory(role.permissions);
    
    return Padding(
      padding: const EdgeInsets.all(AppSizes.lg),
      child: Row(
        children: [
          Expanded(
            child: _StatCard(
              icon: Icons.shield_rounded,
              iconColor: BrandColors.primary,
              value: '${role.permissions.length}',
              label: l10n.permissions,
            ),
          ),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: _StatCard(
              icon: Icons.category_rounded,
              iconColor: BrandColors.warning,
              value: '${groupedPermissions.length}',
              label: 'Categories',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection(BuildContext context, RoleEntity role, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSizes.lg),
        decoration: BoxDecoration(
          color: BrandColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSizes.radius),
          border: Border.all(color: BrandColors.divider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  size: 18,
                  color: BrandColors.textSecondary,
                ),
                const SizedBox(width: AppSizes.sm),
                Text(
                  'Description',
                  style: context.label(color: BrandColors.textSecondary),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.sm),
            Text(
              role.description!,
              style: context.body(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionsHeader(BuildContext context, RoleEntity role, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.xl, AppSizes.lg, AppSizes.md),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizes.sm),
            decoration: BoxDecoration(
              color: BrandColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            ),
            child: Icon(
              Icons.security_rounded,
              size: 20,
              color: BrandColors.primary,
            ),
          ),
          const SizedBox(width: AppSizes.md),
          Text(
            l10n.permissions,
            style: context.subtitle(bold: true),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.sm,
              vertical: AppSizes.xs,
            ),
            decoration: BoxDecoration(
              color: BrandColors.primaryLight.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            ),
            child: Text(
              '${role.permissions.length}',
              style: context.small(color: BrandColors.primary, bold: true),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyPermissions(BuildContext context, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.xl),
      child: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(AppSizes.lg),
              decoration: BoxDecoration(
                color: BrandColors.textMuted.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.lock_open_rounded,
                size: 32,
                color: BrandColors.textMuted,
              ),
            ),
            const SizedBox(height: AppSizes.md),
            Text(
              l10n.noPermissionsAssigned,
              style: context.body(color: BrandColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionsList(BuildContext context, List<RolePermissionEntity> permissions) {
    final grouped = _groupPermissionsByCategory(permissions);
    final sortedCategories = grouped.keys.toList()..sort();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: Column(
        children: sortedCategories.map((category) {
          return _PermissionCategoryCard(
            category: category,
            permissions: grouped[category]!,
          );
        }).toList(),
      ),
    );
  }

  Map<String, List<RolePermissionEntity>> _groupPermissionsByCategory(
    List<RolePermissionEntity> permissions,
  ) {
    final Map<String, List<RolePermissionEntity>> grouped = {};
    for (final permission in permissions) {
      final category = permission.category ?? 'General';
      grouped.putIfAbsent(category, () => []).add(permission);
    }
    return grouped;
  }

  Widget _buildActionButtons(BuildContext context, WidgetRef ref, RoleEntity role, AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => context.push('${RouteName.roles}/$roleId/edit'),
              style: OutlinedButton.styleFrom(
                foregroundColor: BrandColors.primary,
                side: const BorderSide(color: BrandColors.primary),
                padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
              ),
              icon: const Icon(Icons.edit_rounded, size: 18),
              label: Text(l10n.edit),
            ),
          ),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => _confirmDelete(context, ref, role),
              style: ElevatedButton.styleFrom(
                backgroundColor: BrandColors.error,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: AppSizes.md),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radius),
                ),
              ),
              icon: const Icon(Icons.delete_rounded, size: 18),
              label: Text(l10n.delete),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, RoleEntity role) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await DeleteConfirmationHelper.showDeleteConfirmation(
      context: context,
      title: l10n.deleteRole,
      message: l10n.confirmDeleteRole(role.name),
    );
    if (!confirmed) return;

    await ref.read(roleProvider.notifier).delete(id: role.id);
    if (context.mounted) {
      context.pop();
    }
  }
}

/// Stat card widget for displaying statistics
class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: BrandColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.divider),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizes.sm),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: AppSizes.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: context.title(),
              ),
              Text(
                label,
                style: context.small(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Permission category card with expandable list
class _PermissionCategoryCard extends StatefulWidget {
  final String category;
  final List<RolePermissionEntity> permissions;

  const _PermissionCategoryCard({
    required this.category,
    required this.permissions,
  });

  @override
  State<_PermissionCategoryCard> createState() => _PermissionCategoryCardState();
}

class _PermissionCategoryCardState extends State<_PermissionCategoryCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _iconTurns;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _iconTurns = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    if (_isExpanded) {
      _controller.value = 0.5;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  IconData _getCategoryIcon(String category) {
    final lower = category.toLowerCase();
    if (lower.contains('user')) return Icons.people_rounded;
    if (lower.contains('role')) return Icons.admin_panel_settings_rounded;
    if (lower.contains('product')) return Icons.inventory_2_rounded;
    if (lower.contains('order')) return Icons.shopping_cart_rounded;
    if (lower.contains('sale')) return Icons.point_of_sale_rounded;
    if (lower.contains('report')) return Icons.analytics_rounded;
    if (lower.contains('setting')) return Icons.settings_rounded;
    if (lower.contains('branch')) return Icons.business_rounded;
    if (lower.contains('inventory')) return Icons.warehouse_rounded;
    if (lower.contains('customer')) return Icons.person_rounded;
    if (lower.contains('payment')) return Icons.payment_rounded;
    if (lower.contains('dashboard')) return Icons.dashboard_rounded;
    return Icons.folder_rounded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.md),
      decoration: BoxDecoration(
        color: BrandColors.cardBackground,
        borderRadius: BorderRadius.circular(AppSizes.radius),
        border: Border.all(color: BrandColors.divider),
      ),
      child: Column(
        children: [
          // Header
          InkWell(
            onTap: _toggleExpand,
            borderRadius: BorderRadius.vertical(
              top: const Radius.circular(AppSizes.radius),
              bottom: _isExpanded ? Radius.zero : const Radius.circular(AppSizes.radius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSizes.sm),
                    decoration: BoxDecoration(
                      color: BrandColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    child: Icon(
                      _getCategoryIcon(widget.category),
                      size: 18,
                      color: BrandColors.primary,
                    ),
                  ),
                  const SizedBox(width: AppSizes.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _formatCategoryName(widget.category),
                          style: context.subtitle(bold: true),
                        ),
                        Text(
                          '${widget.permissions.length} permission${widget.permissions.length != 1 ? 's' : ''}',
                          style: context.small(),
                        ),
                      ],
                    ),
                  ),
                  RotationTransition(
                    turns: _iconTurns,
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: BrandColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Permissions List
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Column(
              children: [
                const Divider(height: 1, color: BrandColors.divider),
                ...widget.permissions.asMap().entries.map((entry) {
                  final index = entry.key;
                  final permission = entry.value;
                  final isLast = index == widget.permissions.length - 1;
                  return _PermissionItem(
                    permission: permission,
                    isLast: isLast,
                  );
                }),
              ],
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }

  String _formatCategoryName(String category) {
    return category
        .replaceAll('_', ' ')
        .split(' ')
        .map((word) => word.isNotEmpty
            ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
            : '')
        .join(' ');
  }
}

/// Individual permission item
class _PermissionItem extends StatelessWidget {
  final RolePermissionEntity permission;
  final bool isLast;

  const _PermissionItem({
    required this.permission,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.lg,
        vertical: AppSizes.md,
      ),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(
                bottom: BorderSide(color: BrandColors.divider, width: 0.5),
              ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSizes.xs),
            decoration: BoxDecoration(
              color: BrandColors.success.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_rounded,
              size: 14,
              color: BrandColors.success,
            ),
          ),
          const SizedBox(width: AppSizes.md),
          Expanded(
            child: Text(
              permission.description ?? 'Permission #${permission.id}',
              style: context.body(),
            ),
          ),
        ],
      ),
    );
  }
}
