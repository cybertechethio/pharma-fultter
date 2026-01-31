import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bank_loading_providers.g.dart';

@riverpod
class BankCreateLoading extends _$BankCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

@riverpod
class BankUpdateLoading extends _$BankUpdateLoading {
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
class BankDeleteLoading extends _$BankDeleteLoading {
  @override
  Set<int> build() => {};

  void start(int id) {
    state = {...state, id};
  }

  void stop(int id) {
    state = state.where((e) => e != id).toSet();
  }
}

