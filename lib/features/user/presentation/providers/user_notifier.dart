import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/user.dart';
import 'user_providers.dart';
import 'user_events.dart';
import 'user_loading_providers.dart';

part 'user_notifier.g.dart';

@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  Future<List<UserEntity>> build() async {
    return await _load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }

  Future<void> create({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
  }) async {
    final createLoading = ref.read(userCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createUserUseCaseProvider);
    final result = await useCase.call(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      isActive: isActive,
    );

    result.fold(
      (failure) {
        ref.read(userUiEventsProvider.notifier).emit(UserFailure(failure));
      },
      (created) {
        final current = state.value ?? const <UserEntity>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(userUiEventsProvider.notifier).emit(
          UserCreated(created, 'User created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateUser({
    required int id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    bool isActive = true,
  }) async {
    final updating = ref.read(userUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateUserUseCaseProvider);
    final result = await useCase.call(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      isActive: isActive,
    );

    result.fold(
      (failure) {
        ref.read(userUiEventsProvider.notifier).emit(UserFailure(failure));
        updating.stop(id);
      },
      (updated) {
        final list = List<UserEntity>.from(state.value ?? const <UserEntity>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) {
          list[idx] = updated;
        }
        state = AsyncValue.data(list);
        ref.read(userUiEventsProvider.notifier).emit(
          UserUpdated(list[idx], 'User updated successfully'),
        );
      },
    );

    updating.stop(id);
  }

  Future<void> delete({
    required int id,
  }) async {
    final deleting = ref.read(userDeleteLoadingProvider.notifier);
    deleting.start(id);

    final useCase = ref.read(deleteUserUseCaseProvider);
    final result = await useCase.call(id: id);

    result.fold(
      (failure) {
        ref.read(userUiEventsProvider.notifier).emit(UserFailure(failure));
      },
      (deletedEntity) {
        final list = List<UserEntity>.from(state.value ?? const <UserEntity>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);
        ref.read(userUiEventsProvider.notifier).emit(
          UserDeleted(id, 'User deleted successfully'),
        );
      },
    );

    deleting.stop(id);
  }

  Future<List<UserEntity>> _load() async {
    final useCase = ref.read(getUsersUseCaseProvider);
    final result = await useCase.call();
    return result.fold(
      (failure) {
        throw failure;
      },
      (items) => items,
    );
  }
}

