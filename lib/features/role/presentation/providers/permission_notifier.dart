import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/permission.dart';
import 'permission_providers.dart';

part 'permission_notifier.g.dart';

@riverpod
class PermissionNotifier extends _$PermissionNotifier {
  @override
  Future<Map<String, List<PermissionEntity>>> build() async {
    return await _load();
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }

  Future<Map<String, List<PermissionEntity>>> _load() async {
    final useCase = ref.read(getPermissionsUseCaseProvider);
    final result = await useCase.call();
    return result.fold(
      (failure) {
        throw failure;
      },
      (groupedPermissions) => groupedPermissions,
    );
  }
}


