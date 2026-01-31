import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_loading_providers.g.dart';

@riverpod
class UserCreateLoading extends _$UserCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

@riverpod
class UserUpdateLoading extends _$UserUpdateLoading {
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
class UserDeleteLoading extends _$UserDeleteLoading {
  @override
  Set<int> build() => {};

  void start(int id) {
    state = {...state, id};
  }

  void stop(int id) {
    state = state.where((e) => e != id).toSet();
  }
}

