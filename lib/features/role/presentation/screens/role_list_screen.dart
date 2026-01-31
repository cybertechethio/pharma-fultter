import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../shared/components/common/fab_button.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../routes/route_name.dart';
import '../providers/role_notifier.dart';
import '../providers/role_events.dart';
import '../widgets/role_card.dart';

class RoleListScreen extends ConsumerWidget {
  const RoleListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    // Listen to UI events for snackbars
    ref.listen<RoleUiEvent?>(
      roleUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is RoleFailure) {
          snackbar.showError(next.failure);
        } else if (next is RoleCreated) {
          snackbar.showSuccess(next.message);
        } else if (next is RoleUpdated) {
          snackbar.showSuccess(next.message);
        } else if (next is RoleDeleted) {
          snackbar.showSuccess(next.message);
        }
        ref.read(roleUiEventsProvider.notifier).clear();
      },
    );

    final roleState = ref.watch(roleProvider);

    return Scaffold(
      backgroundColor: BrandColors.background,
      appBar: CustomAppBar(
        title: l10n.roles,
      ),
      body: roleState.when(
        loading: () => Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(BrandColors.primary),
          ),
        ),
        data: (roles) {
          if (roles.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.badge_outlined,
                title: l10n.noRoles,
                message: l10n.noRolesMessage,
                showTitle: true,
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(roleProvider.notifier).load(),
            color: BrandColors.primary,
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: roles.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: BrandColors.divider,
              ),
              itemBuilder: (context, index) {
                return RoleCard(item: roles[index]);
              },
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.xl),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                app_err.ErrorsWidget(
                  failure: error is Failure
                      ? error
                      : Failure.unexpectedError(error.toString()),
                ),
                const SizedBox(height: AppSizes.lg),
                ElevatedButton(
                  onPressed: () => ref.read(roleProvider.notifier).load(),
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
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () => context.push('${RouteName.roles}/create'),
      ),
    );
  }
}
