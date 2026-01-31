import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/fab_button.dart';
import '../providers/branch_notifier.dart';
import '../providers/branch_events.dart';
import '../widgets/branch_card.dart';
import '../widgets/branch_form_dialog.dart';

class BranchListScreen extends ConsumerWidget {
  const BranchListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    ref.listen<BranchUiEvent?>(
      branchUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is BranchFailure) {
          snackbar.showError(next.failure);
        } else if (next is BranchCreated) {
          snackbar.showSuccess(next.message);
        } else if (next is BranchUpdated) {
          snackbar.showSuccess(next.message);
        } else if (next is BranchDeleted) {
          snackbar.showSuccess(next.message);
        }
        ref.read(branchUiEventsProvider.notifier).clear();
      },
    );
    final branchesAsync = ref.watch(branchProvider);

    return Scaffold(
      backgroundColor: BrandColors.background,
        appBar: CustomAppBar(title: l10n.branches),
      body: branchesAsync.when(
        loading: () => Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(BrandColors.primary),
          ),
        ),
        data: (branches) {
          if (branches.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.business_outlined,
                title: l10n.noBranches,
                message: l10n.noBranchesMessage,
                showTitle: true,
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(branchProvider.notifier).load(),
            color: BrandColors.primary,
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: branches.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: BrandColors.divider,
              ),
              itemBuilder: (context, index) {
                return BranchCard(
                  branch: branches[index],
                );
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
                  failure: error is Failure ? error : Failure.unexpectedError(error.toString()),
                ),
                const SizedBox(height: AppSizes.lg),
                ElevatedButton(
                  onPressed: () => ref.read(branchProvider.notifier).load(),
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
        onPressed: () => _showCreateDialog(context),
      ),
    );
  }

  void _showCreateDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => BranchFormDialog(
        title: l10n.createBranch,
        buttonText: l10n.create,
      ),
    );
  }
}
