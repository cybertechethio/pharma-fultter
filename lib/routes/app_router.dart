import 'package:cyber_pos/features/setting/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../app/theme/app_sizes.dart';
import '../core/services/snackbar_service.dart';
import '../app/theme/brand_colors.dart';
import '../features/auth/presentation/providers/current_context_provider.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/registration_screen.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/validate_otp_screen.dart';
import '../features/auth/presentation/screens/reset_password_screen.dart';
import '../features/auth/presentation/screens/verify_account_screen.dart';
import '../features/branch/presentation/screens/branch_list_screen.dart';
import '../features/expense/presentation/screens/expense_form_screen.dart';
import '../features/expense/presentation/screens/expense_update_screen.dart';
import '../features/expense/presentation/screens/expense_detail_screen.dart';
import '../features/expense/domain/entities/expense.dart';
import '../features/supplier_customer/presentation/screens/customer_list_screen.dart';
import '../features/supplier_customer/presentation/screens/supplier_list_screen.dart';
import '../features/category/presentation/screens/category_list_screen.dart';
import '../features/expense_category/presentation/screens/expense_category_list_screen.dart';
import '../features/expense/presentation/screens/expense_list_screen.dart';
import '../features/sub_category/presentation/screens/sub_category_list_screen.dart';
import '../features/unit/presentation/screens/unit_list_screen.dart';
import '../features/brand/presentation/screens/brand_list_screen.dart';
import '../features/bank/presentation/screens/bank_list_screen.dart';
import '../features/model/presentation/screens/model_list_screen.dart';
import '../features/item/presentation/screens/item_list_screen.dart';
import '../features/item/presentation/screens/item_create_screen.dart';
import '../features/item/presentation/screens/item_detail_screen.dart';
import '../features/item/presentation/screens/item_update_screen.dart';
import '../features/item/domain/entities/item.dart';
import '../features/batch/presentation/screens/batch_list_screen.dart';
import '../features/batch/presentation/screens/batch_detail_screen.dart';
import '../features/batch/domain/entities/batch.dart';
import '../features/stock/presentation/screens/stock_list_screen.dart';
import '../features/stock/presentation/screens/stock_detail_screen.dart';
import '../features/stock/domain/entities/stock.dart';
import '../features/transaction/presentation/screens/transaction_form_screen.dart';
import '../features/transaction/presentation/screens/transaction_list_screen.dart';
import '../features/transaction/presentation/screens/transaction_detail_screen.dart';
import '../features/transfer/presentation/screens/transfer_list_screen.dart';
import '../features/transfer/presentation/screens/transfer_form_screen.dart';
import '../features/transfer/presentation/screens/transfer_detail_screen.dart';
import '../features/role/presentation/screens/role_list_screen.dart';
import '../features/role/presentation/screens/role_detail_screen.dart';
import '../features/role/presentation/screens/role_form_screen.dart';
import '../features/user/presentation/screens/user_list_screen.dart';
import '../features/user/presentation/screens/user_detail_screen.dart';
import '../features/user/presentation/screens/user_form_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../shared/components/common/app_bar.dart';
import '../shared/components/layout/bottom_nav_screen.dart';
import 'route_name.dart';

/// Singleton router instance - created once and reused
GoRouter? _routerInstance;

/// Provider for GoRouter instance - keeps router alive across rebuilds
/// This prevents navigation state from being lost when locale changes
final goRouterProvider = Provider<GoRouter>((ref) {
  _routerInstance ??= _createRouter();
  return _routerInstance!;
}, name: 'goRouterProvider');

/// Internal function to create the router
GoRouter _createRouter() {
  return GoRouter(
    navigatorKey: SnackbarService.rootNavigatorKey,
    initialLocation: RouteName.login,
    routes: AppRouter._buildRoutes(),
    errorBuilder: (context, state) => AppRouter._buildErrorPage(context, state),
  );
}

/// Simple application router configuration
class AppRouter {
  static GoRouter createRouter() {
    return _createRouter();
  }
  
  static List<RouteBase> _buildRoutes() {
    return [
        GoRoute(
          path: RouteName.login,
          name: 'login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: RouteName.register,
          name: 'register',
          builder: (context, state) => const RegistrationScreen(),
        ),
        GoRoute(
          path: RouteName.forgotPassword,
          name: 'forgot-password',
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
        GoRoute(
          path: RouteName.validateOtp,
          name: 'validate-otp',
          builder: (context, state) {
            final phoneNumber = state.extra as String? ?? '';
            return ValidateOtpScreen(phoneNumber: phoneNumber);
          },
        ),
        GoRoute(
          path: RouteName.resetPassword,
          name: 'reset-password',
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>? ?? {};
            final identifier = data['identifier'] as String? ?? '';
            final resetToken = data['resetToken'] as String? ?? '';
            return ResetPasswordScreen(identifier: identifier, resetToken: resetToken);
          },
        ),
        GoRoute(
          path: RouteName.verifyAccount,
          name: 'verify-account',
          builder: (context, state) {
            final identifier = state.extra as String? ?? '';
            return VerifyAccountScreen(identifier: identifier);
          },
        ),
        GoRoute(
          path: RouteName.branches,
          name: 'branches',
          builder: (context, state) => const BranchListScreen(),
        ),
        GoRoute(
          path: RouteName.customers,
          name: 'customers',
          builder: (context, state) => const CustomerListScreen(),
        ),
        GoRoute(
          path: RouteName.suppliers,
          name: 'suppliers',
          builder: (context, state) => const SupplierListScreen(),
        ),
        GoRoute(
          path: RouteName.categories,
          name: 'categories',
          builder: (context, state) => const CategoryListScreen(),
        ),
        GoRoute(
          path: RouteName.expenseCategories,
          name: 'expense-categories',
          builder: (context, state) => const ExpenseCategoryListScreen(),
        ),
        GoRoute(
          path: RouteName.expenses,
          name: 'expenses',
          builder: (context, state) => const ExpenseListScreen(),
        ),
        GoRoute(
          path: RouteName.expenseDetail,
          name: 'expense-detail',
          builder: (context, state) {
            final expenseId = state.uri.queryParameters['id'] ?? '';
            return ExpenseDetailScreen(expenseId: expenseId);
          },
        ),
        GoRoute(
          path: RouteName.expenseForm,
          name: 'expense-form',
          builder: (context, state) => const ExpenseFormScreen(),
        ),
        GoRoute(
          path: RouteName.expenseUpdate,
          name: 'expense-update',
          builder: (context, state) {
            final expense = state.extra as Expense?;
            return ExpenseUpdateScreen(expense: expense);
          },
        ),
        GoRoute(
          path: RouteName.subCategories,
          name: 'sub-categories',
          builder: (context, state) {
            final categoryId = state.uri.queryParameters['categoryId'];
            return SubCategoryListScreen(categoryId: categoryId);
          },
        ),
        GoRoute(
          path: RouteName.units,
          name: 'units',
          builder: (context, state) => const UnitListScreen(),
        ),
        GoRoute(
          path: RouteName.banks,
          name: 'banks',
          builder: (context, state) => const BankListScreen(),
        ),
        GoRoute(
          path: RouteName.brands,
          name: 'brands',
          builder: (context, state) => const BrandListScreen(),
        ),
        GoRoute(
          path: RouteName.models,
          name: 'models',
          builder: (context, state) => const ModelListScreen(),
        ),
        GoRoute(
          path: RouteName.items,
          name: 'items',
          builder: (context, state) => const ItemListScreen(),
          routes: [
            GoRoute(
              path: 'create',
              name: 'create-item',
              builder: (context, state) => const ItemCreateScreen(),
            ),
            GoRoute(
              path: ':id/edit',
              name: 'edit-item',
              builder: (context, state) {
                final item = state.extra as Item;
                return ItemUpdateScreen(item: item);
              },
            ),
          ],
        ),
        GoRoute(
          path: RouteName.itemDetail,
          name: 'item-detail',
          builder: (context, state) {
            final item = state.extra as Item;
            return ItemDetailScreen(item: item);
          },
        ),
        GoRoute(
          path: RouteName.batches,
          name: 'batches',
          builder: (context, state) => const BatchListScreen(),
        ),
        GoRoute(
          path: RouteName.batchDetail,
          name: 'batch-detail',
          builder: (context, state) {
            final batch = state.extra as BatchEntity;
            return BatchDetailScreen(batch: batch);
          },
        ),
        GoRoute(
          path: RouteName.stocks,
          name: 'stocks',
          builder: (context, state) => const StockListScreen(),
        ),
        GoRoute(
          path: RouteName.stockDetail,
          name: 'stock-detail',
          builder: (context, state) {
            final stock = state.extra as Stock;
            return StockDetailScreen(stock: stock);
          },
        ),
        GoRoute(
          path: RouteName.transactionForm,
          name: 'transaction-form',
          builder: (context, state) => const TransactionFormScreen(),
        ),
        GoRoute(
          path: RouteName.transactionDetail,
          name: 'transaction-detail',
          builder: (context, state) {
            final transactionId = state.extra as int? ?? 0;
            return TransactionDetailScreen(transactionId: transactionId);
          },
        ),
        GoRoute(
          path: RouteName.transfer,
          name: 'transfer',
          builder: (context, state) => const TransferListScreen(),
        ),
        GoRoute(
          path: RouteName.transferForm,
          name: 'transfer-form',
          builder: (context, state) => const TransferFormScreen(),
        ),
        GoRoute(
          path: RouteName.transferDetail,
          name: 'transfer-detail',
          builder: (context, state) {
            final transferId = state.extra as int? ?? 0;
            return TransferDetailScreen(transferId: transferId);
          },
        ),
        GoRoute(
          path: RouteName.roles,
          name: 'roles',
          builder: (context, state) => const RoleListScreen(),
          routes: [
            GoRoute(
              path: 'create',
              name: 'create-role',
              builder: (context, state) => const RoleFormScreen(),
            ),
            GoRoute(
              path: ':id',
              name: 'role-detail',
              builder: (context, state) {
                final id = int.parse(state.pathParameters['id']!);
                return RoleDetailScreen(roleId: id);
              },
              routes: [
                GoRoute(
                  path: 'edit',
                  name: 'edit-role',
                  builder: (context, state) {
                    final id = int.parse(state.pathParameters['id']!);
                    return RoleFormScreen(roleId: id);
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: RouteName.users,
          name: 'users',
          builder: (context, state) => const UserListScreen(),
          routes: [
            GoRoute(
              path: 'create',
              name: 'create-user',
              builder: (context, state) => const UserFormScreen(),
            ),
            GoRoute(
              path: ':id',
              name: 'user-detail',
              builder: (context, state) {
                final id = int.parse(state.pathParameters['id']!);
                return UserDetailScreen(userId: id);
              },
              routes: [
                GoRoute(
                  path: 'edit',
                  name: 'edit-user',
                  builder: (context, state) {
                    final id = int.parse(state.pathParameters['id']!);
                    return UserFormScreen(userId: id);
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: RouteName.employees,
          name: 'employees',
          builder: (context, state) => const _PlaceholderScreen(title: 'Employees'),
        ),
        GoRoute(
          path: RouteName.reports,
          name: 'reports',
          builder: (context, state) => const _PlaceholderScreen(title: 'Reports'),
        ),
        GoRoute(
          path: RouteName.help,
          name: 'help',
          builder: (context, state) => const _PlaceholderScreen(title: 'Help'),
        ),
        GoRoute(
          path: RouteName.settings,
          name: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        
        GoRoute(
          path: RouteName.profile,
          name: 'profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        // Bottom navigation shell with 4 tabs
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return BottomNavScreen(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RouteName.home,
                  name: 'home',
                  builder: (context, state) => const _ShellRouteScreen(title: 'Home'),
                ),
                
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RouteName.sell,
                  name: 'sell',
                  builder: (context, state) => const _ShellRouteScreen(title: 'Sell'),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RouteName.stock,
                  name: 'stock',
                  builder: (context, state) => const _ShellRouteScreen(title: 'Stock'),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RouteName.transaction,
                  name: 'transaction',
                  builder: (context, state) => const TransactionListScreen(),
                ),
              ],
            ),
          ],
        ),
    ];
  }
  
  /// Build error page for unknown routes
  static Widget _buildErrorPage(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Page Not Found',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: BrandColors.error,
            ),
            const SizedBox(height: AppSizes.lg),
            Text(
              'Page Not Found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSizes.sm),
            Text(
              'The page could not be found.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSizes.xxl),
            ElevatedButton(
              onPressed: () => context.go(RouteName.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;

  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headlineSmall;
    return Scaffold(
      appBar: CustomAppBar(
        title: title,
      ),
      body: Center(child: Text('$title screen', style: textStyle)),
    );
  }
}

class _ShellRouteScreen extends ConsumerWidget {
  final String title;

  const _ShellRouteScreen({required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.headlineSmall;
    final contextAsync = ref.watch(currentContextProvider);
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$title screen', style: textStyle),
            const SizedBox(height: AppSizes.xxl),
            contextAsync.when(
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Text(
                'Error loading context',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
                textAlign: TextAlign.center,
              ),
              data: (ctx) {
                String contextInfo = 'No context';
                if (ctx != null) {
                  contextInfo = 'Company ID: ${ctx.currentCompanyId ?? "None"}\n'
                      'Branch ID: ${ctx.currentBranchId ?? "None"}';
                }
                return Text(
              contextInfo,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}