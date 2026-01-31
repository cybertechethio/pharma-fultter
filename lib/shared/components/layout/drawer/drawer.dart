import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../features/auth/presentation/providers/current_context_provider.dart';
import '../../../../features/auth/presentation/providers/auth_providers.dart';
import '../../../../features/profile/presentation/providers/profile_notifier.dart';
import '../../../../features/profile/presentation/providers/profile_providers.dart';
import '../../../../features/branch/domain/entities/branch.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/errors/failure.dart';
import 'drawer_header.dart' as custom;
import 'drawer_branch_switcher.dart';
import 'drawer_navigation_group.dart';
import 'drawer_footer.dart';

/// A stunning, professional drawer with modular components.
/// Features gradient header, organized navigation groups, and smooth animations.
class AppDrawer extends ConsumerStatefulWidget {
  const AppDrawer({super.key});

  @override
  ConsumerState<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
  bool _hasTriggeredRefresh = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final contextAsync = ref.watch(currentContextProvider);
    final branchesAsync = ref.watch(localBranchesProviderProvider);
    final userAsync = ref.watch(profileProvider);
    final cachedUserAsync = ref.watch(cachedUserProvider);

    // Get company name from user
    final companyName =
        userAsync.value?.companyName ?? cachedUserAsync.value?.companyName;

    // Only trigger profile provider refresh once
    final hasCachedCompanyName = cachedUserAsync.hasValue &&
        cachedUserAsync.value?.companyName != null &&
        cachedUserAsync.value!.companyName!.isNotEmpty;

    if (!_hasTriggeredRefresh && userAsync.isLoading && !hasCachedCompanyName) {
      _hasTriggeredRefresh = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(profileProvider.notifier).loadUser();
      });
    }

    // Get active branch info
    String? activeBranchId;
    String? activeBranchName;
    if (contextAsync.hasValue && contextAsync.value?.currentBranchId != null) {
      activeBranchId = contextAsync.value!.currentBranchId;
      if (branchesAsync.hasValue && branchesAsync.value != null) {
        final branches = branchesAsync.value!;
        if (branches.isNotEmpty) {
          final branch = branches.firstWhere(
            (b) => b.id == activeBranchId,
            orElse: () => branches.first,
          );
          activeBranchName = branch.name;
        }
      }
    }

    return Drawer(
      backgroundColor: colorScheme.surface,
      child: Column(
        children: [
          // Header Section
          custom.DrawerHeader(
            companyName: companyName,
            isLoading: userAsync.isLoading && !hasCachedCompanyName,
          ),

          // Scrollable Navigation Section
          Expanded(
            child: _DrawerScrollableContent(
              activeBranchId: activeBranchId,
              activeBranchName: activeBranchName,
              onBranchSelected: (branch) => _selectBranch(context, branch),
              onNavigate: (route) => _go(context, route),
            ),
          ),

          // Footer Section
          DrawerFooter(
            onSettingsTap: () => _go(context, RouteName.settings),
            onHelpTap: () => _go(context, RouteName.help),
          ),
        ],
      ),
    );
  }

  Future<void> _selectBranch(BuildContext context, Branch branch) async {
    try {
      await ref.read(currentContextProvider.notifier).setBranch(branch.id);
      if (mounted) {
        Navigator.of(context).maybePop();
        ref.read(snackbarServiceProvider).showSuccess('Switched to ${branch.name}');
      }
    } catch (e) {
      if (mounted) {
        ref.read(snackbarServiceProvider).showError(
              Failure.unexpectedError('Failed to switch branch'),
            );
      }
    }
  }

  void _go(BuildContext context, String route) {
    Navigator.of(context).maybePop();
    context.push(route);
  }
}

/// Scrollable content with branch switcher and navigation groups.
class _DrawerScrollableContent extends StatelessWidget {
  final String? activeBranchId;
  final String? activeBranchName;
  final Function(Branch) onBranchSelected;
  final Function(String) onNavigate;

  const _DrawerScrollableContent({
    this.activeBranchId,
    this.activeBranchName,
    required this.onBranchSelected,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            colorScheme.surface,
            colorScheme.surface,
            Colors.transparent,
          ],
          stops: const [0.0, 0.02, 0.98, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 16),
        children: [
          // Branch Switcher
          DrawerBranchSwitcher(
            activeBranchId: activeBranchId,
            activeBranchName: activeBranchName,
            onBranchSelected: onBranchSelected,
          ),

          const SizedBox(height: 8),

          // Core Navigation
          DrawerNavigationGroup(
            title: 'Core',
            items: [
              DrawerNavItemData(
                icon: Icons.account_tree_rounded,
                label: l10n.branches,
                onTap: () => onNavigate(RouteName.branches),
                route: RouteName.branches,
              ),
              DrawerNavItemData(
                icon: Icons.people_rounded,
                label: l10n.customers,
                onTap: () => onNavigate(RouteName.customers),
                route: RouteName.customers,
              ),
              DrawerNavItemData(
                icon: Icons.local_shipping_rounded,
                label: l10n.suppliers,
                onTap: () => onNavigate(RouteName.suppliers),
                route: RouteName.suppliers,
              ),
            ],
          ),

          // Inventory Navigation
          DrawerNavigationGroup(
            title: 'Inventory',
            items: [
              DrawerNavItemData(
                icon: Icons.category_rounded,
                label: l10n.categories,
                onTap: () => onNavigate(RouteName.categories),
                route: RouteName.categories,
              ),
              DrawerNavItemData(
                icon: Icons.subdirectory_arrow_right_rounded,
                label: l10n.subCategories,
                onTap: () => onNavigate(RouteName.subCategories),
                route: RouteName.subCategories,
              ),
              DrawerNavItemData(
                icon: Icons.straighten_rounded,
                label: l10n.units,
                onTap: () => onNavigate(RouteName.units),
                route: RouteName.units,
              ),
              DrawerNavItemData(
                icon: Icons.branding_watermark_rounded,
                label: l10n.brands,
                onTap: () => onNavigate(RouteName.brands),
                route: RouteName.brands,
              ),
              DrawerNavItemData(
                icon: Icons.model_training_rounded,
                label: l10n.models,
                onTap: () => onNavigate(RouteName.models),
                route: RouteName.models,
              ),
              DrawerNavItemData(
                icon: Icons.inventory_2_rounded,
                label: l10n.items,
                onTap: () => onNavigate(RouteName.items),
                route: RouteName.items,
              ),
              DrawerNavItemData(
                icon: Icons.layers_rounded,
                label: l10n.batches,
                onTap: () => onNavigate(RouteName.batches),
                route: RouteName.batches,
              ),
              DrawerNavItemData(
                icon: Icons.warehouse_rounded,
                label: l10n.stocks,
                onTap: () => onNavigate(RouteName.stocks),
                route: RouteName.stocks,
              ),
            ],
          ),

          // Operations Navigation
          DrawerNavigationGroup(
            title: 'Operations',
            items: [
              DrawerNavItemData(
                icon: Icons.swap_horiz_rounded,
                label: l10n.transactions,
                onTap: () {
                   Navigator.of(context).maybePop();
                   context.go(RouteName.transaction);
                },
                route: RouteName.transaction,
              ),
              DrawerNavItemData(
                icon: Icons.compare_arrows_rounded,
                label: l10n.transfers,
                onTap: () => onNavigate(RouteName.transfer),
                route: RouteName.transfer,
              ),
              DrawerNavItemData(
                icon: Icons.category_rounded,
                label: l10n.expenseCategories,
                onTap: () => onNavigate(RouteName.expenseCategories),
                route: RouteName.expenseCategories,
              ),
              DrawerNavItemData(
                icon: Icons.attach_money_rounded,
                label: l10n.expenses,
                onTap: () => onNavigate(RouteName.expenses),
                route: RouteName.expenses,
              ),
            ],
          ),

          // Administration Navigation
          DrawerNavigationGroup(
            title: 'Administration',
            items: [
              DrawerNavItemData(
                icon: Icons.badge_rounded,
                label: l10n.roles,
                onTap: () => onNavigate(RouteName.roles),
                route: RouteName.roles,
              ),
              DrawerNavItemData(
                icon: Icons.person_rounded,
                label: l10n.users,
                onTap: () => onNavigate(RouteName.users),
                route: RouteName.users,
              ),
              
              DrawerNavItemData(
                icon: Icons.account_balance_rounded,
                label: l10n.banks,
                onTap: () => onNavigate(RouteName.banks),
                route: RouteName.banks,
              ),
              DrawerNavItemData(
                icon: Icons.bar_chart_rounded,
                label: l10n.reports,
                onTap: () => onNavigate(RouteName.reports),
                route: RouteName.reports,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
