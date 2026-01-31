import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'branch_loading_providers.g.dart';

@Riverpod(keepAlive: true)
class BranchCreateLoading extends _$BranchCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

@Riverpod(keepAlive: true)
class BranchUpdateLoading extends _$BranchUpdateLoading {
  @override
  Set<String> build() => {};

  void start(String id) {
    state = {...state, id};
  }

  void stop(String id) {
    state = state.where((e) => e != id).toSet();
  }
}

@Riverpod(keepAlive: true)
class BranchDeleteLoading extends _$BranchDeleteLoading {
  @override
  Set<String> build() => {};

  void start(String id) {
    state = {...state, id};
  }

  void stop(String id) {
    state = state.where((e) => e != id).toSet();
  }
}

