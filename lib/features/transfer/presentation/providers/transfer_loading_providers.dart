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













