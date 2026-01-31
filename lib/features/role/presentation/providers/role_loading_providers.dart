import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'role_loading_providers.g.dart';

@riverpod
class RoleCreateLoading extends _$RoleCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

@riverpod
class RoleUpdateLoading extends _$RoleUpdateLoading {
  @override
  Set<int> build() => {};

  void start(int id) {
    state = {...state, id};
  }

  void stop(int id) {
    state = state.where((e) => e != id).toSet();
  }
}

@riverpod
class RoleDeleteLoading extends _$RoleDeleteLoading {
  @override
  Set<int> build() => {};

  void start(int id) {
    state = {...state, id};
  }

  void stop(int id) {
    state = state.where((e) => e != id).toSet();
  }
}


