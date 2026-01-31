import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'batch_loading_providers.g.dart';

@riverpod
class BatchCreateLoading extends _$BatchCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

@riverpod
class BatchUpdateLoading extends _$BatchUpdateLoading {
  @override
  Set<int> build() => {};

  void start(int id) {
    state = {...state, id};
  }

  void stop(int id) {
    state = state.where((e) => e != id).toSet();
  }
}

