import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unit_loading_providers.g.dart';

@riverpod
class UnitCreateLoading extends _$UnitCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

@riverpod
class UnitUpdateLoading extends _$UnitUpdateLoading {
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
class UnitDeleteLoading extends _$UnitDeleteLoading {
  @override
  Set<String> build() => {};

  void start(String id) {
    state = {...state, id};
  }

  void stop(String id) {
    state = state.where((e) => e != id).toSet();
  }
}

