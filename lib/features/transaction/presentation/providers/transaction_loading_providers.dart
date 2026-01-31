import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transaction_loading_providers.g.dart';

@riverpod
class TransactionCreateLoading extends _$TransactionCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

@riverpod
class TransactionReverseLoading extends _$TransactionReverseLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

