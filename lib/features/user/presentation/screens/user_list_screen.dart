import 'package:cyber_pos/shared/components/forms/custom_button.dart';
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
import '../../../../routes/route_name.dart';
import '../../../../shared/components/common/fab_button.dart';
import '../providers/user_notifier.dart';
import '../providers/user_events.dart';
import '../widgets/user_card.dart';

class UserListScreen extends ConsumerStatefulWidget {
  const UserListScreen({super.key});

  @override
  ConsumerState<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends ConsumerState<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    // Listen to UI events for snackbars
    ref.listen<UserUiEvent?>(
      userUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is UserFailure) {
          snackbar.showError(next.failure);
        } else if (next is UserCreated) {
          snackbar.showSuccess(next.message);
        } else if (next is UserUpdated) {
          snackbar.showSuccess(next.message);
        } else if (next is UserDeleted) {
          snackbar.showSuccess(next.message);
        }
        ref.read(userUiEventsProvider.notifier).clear();
      },
    );

    final userState = ref.watch(userProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.users,
      ),
      body: userState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (users) {
          if (users.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.person_outline,
                title: l10n.noUsers,
                message: l10n.noUsersMessage,
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(userProvider.notifier).load(),
            color: BrandColors.primary,
            child: ListView.separated(
              padding: const EdgeInsets.all(AppSizes.lg),
              itemCount: users.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 1,
                color: BrandColors.divider,
              ),
              itemBuilder: (context, index) => UserCard(item: users[index]),
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              app_err.ErrorsWidget(
                failure: error is Failure
                    ? error
                    : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: l10n.retry,
                onPressed: () => ref.read(userProvider.notifier).load(),
              )
            ],
          ),
        ),
      ),
    
    floatingActionButton: CustomFloatingActionButton(
      onPressed: () => context.push('${RouteName.users}/create'),
    ),
  );
}
}

