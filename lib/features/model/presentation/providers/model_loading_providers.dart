import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'model_loading_providers.g.dart';

@riverpod
class ModelCreateLoading extends _$ModelCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

@riverpod
class ModelUpdateLoading extends _$ModelUpdateLoading {
  @override
  Set<String> build() => {};

  void start(String id) {
    state = {...state, id};
  }

  void stop(String id) {
    state = state.where((e) => e != id).toSet();
  }
}

@riverpod
class ModelDeleteLoading extends _$ModelDeleteLoading {
  @override
  Set<String> build() => {};

  void start(String id) {
    state = {...state, id};
  }

  void stop(String id) {
    state = state.where((e) => e != id).toSet();
  }
}

