import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'brand_loading_providers.g.dart';

@riverpod
class BrandCreateLoading extends _$BrandCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

@riverpod
class BrandUpdateLoading extends _$BrandUpdateLoading {
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
class BrandDeleteLoading extends _$BrandDeleteLoading {
  @override
  Set<String> build() => {};

  void start(String id) {
    state = {...state, id};
  }

  void stop(String id) {
    state = state.where((e) => e != id).toSet();
  }
}

