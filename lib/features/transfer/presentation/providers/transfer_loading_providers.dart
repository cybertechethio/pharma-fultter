import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transfer_loading_providers.g.dart';

@riverpod
class TransferCreateLoading extends _$TransferCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

@riverpod
class TransferStatusUpdateLoading extends _$TransferStatusUpdateLoading {
  @override
  Set<int> build() => {};

  void start(int id) {
    state = {...state, id};
  }

  void stop(int id) {
    state = state.where((e) => e != id).toSet();
  }
}

