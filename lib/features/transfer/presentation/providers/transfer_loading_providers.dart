import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/enums/transfer_status_enum.dart';

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
  Map<int, TransferStatus> build() => {};

  void start(int id, TransferStatus status) {
    state = Map<int, TransferStatus>.from(state)..[id] = status;
  }

  void stop(int id) {
    state = Map.from(state)..remove(id);
  }
}

