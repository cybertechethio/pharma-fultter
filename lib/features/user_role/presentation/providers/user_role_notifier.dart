import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user_role.dart';
import '../../domain/repositories/user_role_repository.dart';
import 'user_role_providers.dart';
import 'user_role_events.dart';

part 'user_role_notifier.g.dart';

@riverpod
class UserRoleNotifier extends _$UserRoleNotifier {
  late final int _userId;

  @override
  Future<List<UserBranchRoleAssignment>> build(int userId) async {
    _userId = userId;
    return await _load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }

  Future<void> assignRoles({
    required List<BranchRoleAssignmentRequest> assignments,
  }) async {
    final useCase = ref.read(assignUserRolesUseCaseProvider);
    final result = await useCase.call(
      userId: _userId,
      assignments: assignments,
    );

    result.fold(
      (failure) {
        ref.read(userRoleUiEventsProvider.notifier).emit(UserRoleFailure(failure));
      },
      (updatedAssignments) {
        state = AsyncValue.data(updatedAssignments);
        ref.read(userRoleUiEventsProvider.notifier).emit(
          UserRolesAssigned('Role assignments updated successfully'),
        );
      },
    );
  }

  Future<List<UserBranchRoleAssignment>> _load() async {
    final useCase = ref.read(getUserRoleAssignmentsUseCaseProvider);
    final result = await useCase.call(userId: _userId);
    return result.fold(
      (failure) {
        throw failure;
      },
      (items) => items,
    );
  }
}

