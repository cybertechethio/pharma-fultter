import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';
import '../../../../routes/route_name.dart';
import '../../../../features/auth/presentation/providers/current_context_provider.dart';
import '../../../../features/auth/presentation/providers/auth_providers.dart';
import '../../../../features/profile/presentation/providers/profile_notifier.dart';
import '../../../../features/profile/presentation/providers/profile_providers.dart';
import '../../../../features/setting/presentation/providers/company_notifier.dart';
import '../../../../features/branch/domain/entities/branch.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/errors/failure.dart';
import 'drawer_header.dart' as custom;
import 'drawer_branch_switcher.dart';
import 'drawer_navigation_group.dart';
import 'drawer_expandable_item.dart';
import 'drawer_footer.dart';
import '../../../../features/dashboard/presentation/providers/dashboard_providers.dart';
import '../../../../features/stock/presentation/providers/stocks_provider.dart';
import '../../../../features/transaction/presentation/providers/transaction_notifier.dart';

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
    final companyAsync = ref.watch(companyProvider);

    // Get company name from user
    final companyName =
        userAsync.value?.companyName ?? cachedUserAsync.value?.companyName;

    // Get company logo
    final logoUrl = companyAsync.value?.logoUrl;

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
      width: AppSizes.drawerWidth,
      child: Column(
        children: [
          // Header Section (organisation)
          custom.DrawerHeader(
            companyName: companyName,
            logoUrl: logoUrl,
            isLoading: (userAsync.isLoading && !hasCachedCompanyName) ||
                companyAsync.isLoading,
          ),
          // Border below organisation section (thicker, bolder)
          Container(
            height: 2,
            color: BrandColors.primary,
          ),

          // Scrollable Navigation Section
          Expanded(
            child: _DrawerScrollableContent(
              onNavigate: (route) => _go(context, route),
            ),
          ),

          // Footer Section
          DrawerFooter(
            branchSwitcher: DrawerBranchSwitcher(
              activeBranchId: activeBranchId,
              activeBranchName: activeBranchName,
              onBranchSelected: (branch) => _selectBranch(context, branch),
            ),
            onSettingsTap: () => _go(context, RouteName.settings),
            onProfileTap: () => _go(context, RouteName.profile),
          ),
        ],
      ),
    );
  }

  Future<void> _selectBranch(BuildContext context, Branch branch) async {
    final l10n = AppLocalizations.of(context);
    try {
      await ref.read(currentContextProvider.notifier).setBranch(branch.id);
      if (mounted) {  
        // Invalidate providers to clear stale data and trigger re-fetch for the new branch
        ref.invalidate(getDashboardProvider);
        ref.invalidate(stockProvider);
        ref.invalidate(transactionProvider);

        Navigator.of(context).maybePop();
        ref.read(snackbarServiceProvider).showSuccess(
              l10n.switchedToBranch(branch.name),
            );
      }
    } catch (e) {
      if (mounted) {
        ref.read(snackbarServiceProvider).showError(
              Failure.unexpectedError(l10n.failedToSwitchBranch),
            );
      }
    }
  }

  void _go(BuildContext context, String route) {
    Navigator.of(context).maybePop();
    context.push(route);
  }
}

/// Scrollable content with navigation groups.
class _DrawerScrollableContent extends StatelessWidget {
  final Function(String) onNavigate;

  const _DrawerScrollableContent({
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
            BrandColors.transparent,
            colorScheme.surface,
            colorScheme.surface,
            BrandColors.transparent,
          ],
          stops: const [0.0, 0.02, 0.98, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 16),
        children: [
          // Main
          DrawerNavigationGroup(
            title: l10n.main,
            items: [
              DrawerNavItemData(
                icon: Icons.dashboard_outlined,
                label: l10n.home,
                onTap: () => onNavigate(RouteName.home),
                route: RouteName.home,
              ),
              DrawerNavItemData(
                icon: Icons.inventory_2_outlined,
                label: l10n.products,
                onTap: () => onNavigate(RouteName.items),
                route: RouteName.items,
              ),
              DrawerNavItemData(
                icon: Icons.point_of_sale_outlined,
                label: l10n.pointOfSale,
                onTap: () => onNavigate(RouteName.transactionForm),
                route: RouteName.transactionForm,
              ),
              DrawerNavItemData(
                icon: Icons.shopping_cart_outlined,
                label: l10n.purchase,
                onTap: () => onNavigate(RouteName.transaction),
                route: RouteName.transaction,
              ),
              DrawerNavItemData(
                icon: Icons.warehouse_outlined,
                label: l10n.stocks,
                onTap: () => onNavigate(RouteName.stocks),
                route: RouteName.stocks,
              ),
            ],
          ),
          // Border between Main and section below
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: AppSizes.xs),
            color: BrandColors.primary,
          ),

          // Inventory
          DrawerNavigationGroup(
            title: l10n.inventory,
            items: [
              DrawerNavItemData(
                icon: Icons.category_outlined,
                label: l10n.categories,
                onTap: () => onNavigate(RouteName.categories),
                route: RouteName.categories,
              ),
              DrawerNavItemData(
                icon: Icons.subdirectory_arrow_right_outlined,
                label: l10n.subCategories,
                onTap: () => onNavigate(RouteName.subCategories),
                route: RouteName.subCategories,
              ),
              DrawerNavItemData(
                icon: Icons.branding_watermark_outlined,
                label: l10n.brands,
                onTap: () => onNavigate(RouteName.brands),
                route: RouteName.brands,
              ),
              DrawerNavItemData(
                icon: Icons.straighten_outlined,
                label: l10n.units,
                onTap: () => onNavigate(RouteName.units),
                route: RouteName.units,
              ),
              DrawerNavItemData(
                icon: Icons.model_training_outlined,
                label: l10n.models,
                onTap: () => onNavigate(RouteName.models),
                route: RouteName.models,
              ),
              DrawerNavItemData(
                icon: Icons.inventory_2_outlined,
                label: l10n.items,
                onTap: () => onNavigate(RouteName.items),
                route: RouteName.items,
              ),
              DrawerNavItemData(
                icon: Icons.layers_outlined,
                label: l10n.batches,
                onTap: () => onNavigate(RouteName.batchItems),
                route: RouteName.batchItems,
              ),
            ],
          ),

          // Stock
          DrawerNavigationGroup(
            title: l10n.stock,
            items: [
              DrawerNavItemData(
                icon: Icons.compare_arrows_outlined,
                label: l10n.stockTransfer,
                onTap: () => onNavigate(RouteName.transfer),
                route: RouteName.transfer,
              ),
            ],
          ),

          // Orders
          DrawerNavigationGroup(
            title: l10n.orders,
            items: [
              DrawerNavItemData(
                icon: Icons.list_alt_outlined,
                label: l10n.transactions,
                onTap: () => onNavigate(RouteName.transaction),
                route: RouteName.transaction,
              ),
            ],
          ),

          // Expenses
          DrawerNavigationGroup(
            title: l10n.expenses,
            items: [
              DrawerNavItemData(
                icon: Icons.attach_money_outlined,
                label: l10n.expenses,
                onTap: () => onNavigate(RouteName.expenses),
                route: RouteName.expenses,
              ),
              DrawerNavItemData(
                icon: Icons.category_outlined,
                label: l10n.expenseCategories,
                onTap: () => onNavigate(RouteName.expenseCategories),
                route: RouteName.expenseCategories,
              ),
            ],
          ),

          // People
          DrawerNavigationGroup(
            title: l10n.people,
            items: [
              DrawerNavItemData(
                icon: Icons.people_outline_rounded,
                label: l10n.customers,
                onTap: () => onNavigate(RouteName.customers),
                route: RouteName.customers,
              ),
              DrawerNavItemData(
                icon: Icons.person_outline_rounded,
                label: l10n.billers,
                onTap: () => onNavigate(RouteName.users),
                route: RouteName.users,
              ),
              DrawerNavItemData(
                icon: Icons.local_shipping_outlined,
                label: l10n.suppliers,
                onTap: () => onNavigate(RouteName.suppliers),
                route: RouteName.suppliers,
              ),
              DrawerNavItemData(
                icon: Icons.account_tree_outlined,
                label: l10n.branches,
                onTap: () => onNavigate(RouteName.branches),
                route: RouteName.branches,
              ),
            ],
          ),

          // Administration
          DrawerNavigationGroup(
            title: l10n.administration,
            items: [
              DrawerNavItemData(
                icon: Icons.badge_outlined,
                label: l10n.roles,
                onTap: () => onNavigate(RouteName.roles),
                route: RouteName.roles,
              ),
              DrawerNavItemData(
                icon: Icons.person_outline_rounded,
                label: l10n.users,
                onTap: () => onNavigate(RouteName.users),
                route: RouteName.users,
              ),
              DrawerNavItemData(
                icon: Icons.account_balance_outlined,
                label: l10n.banks,
                onTap: () => onNavigate(RouteName.banks),
                route: RouteName.banks,
              ),
            ],
          ),

          // Reports - Expandable
          DrawerExpandableItem(
            icon: Icons.bar_chart_outlined,
            label: l10n.reports,
            children: [
              DrawerNavItemData(
                icon: Icons.trending_up_outlined,
                label: l10n.salesReport,
                onTap: () => onNavigate(RouteName.salesReport),
                route: RouteName.salesReport,
              ),
              DrawerNavItemData(
                icon: Icons.shopping_cart_outlined,
                label: l10n.purchaseReport,
                onTap: () => onNavigate(RouteName.purchaseReport),
                route: RouteName.purchaseReport,
              ),
              DrawerNavItemData(
                icon: Icons.people_outline_rounded,
                label: l10n.customerReport,
                onTap: () => onNavigate(RouteName.customerReport),
                route: RouteName.customerReport,
              ),
              DrawerNavItemData(
                icon: Icons.attach_money_outlined,
                label: l10n.expenseReport,
                onTap: () => onNavigate(RouteName.expenseReport),
                route: RouteName.expenseReport,
              ),
              DrawerNavItemData(
                icon: Icons.trending_up_outlined,
                label: l10n.dailySalesReport,
                onTap: () => onNavigate(RouteName.salesReport),
                route: RouteName.salesReport,
              ),
              DrawerNavItemData(
                icon: Icons.account_balance_wallet_outlined,
                label: l10n.profitLossReport,
                onTap: () => onNavigate(RouteName.profitLossReport),
                route: RouteName.profitLossReport,
              ),
              DrawerNavItemData(
                icon: Icons.calendar_today_outlined,
                label: l10n.annualReport,
                onTap: () => onNavigate(RouteName.annualReport),
                route: RouteName.annualReport,
              ),
              DrawerNavItemData(
                icon: Icons.star_outline_rounded,
                label: l10n.bestSellerReport,
                onTap: () => onNavigate(RouteName.bestSellerReport),
                route: RouteName.bestSellerReport,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
