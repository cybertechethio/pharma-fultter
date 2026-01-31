import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/transfer.dart';
import 'transfer_providers.dart';

part 'transfer_detail_notifier.g.dart';

@riverpod
Future<Transfer?> transferDetail(Ref ref, int transferId) async {
  final useCase = ref.watch(getTransferDetailUseCaseProvider);
  final result = await useCase.call(transferId);

  return result.fold(
    (failure) {
      throw failure;
    },
    (transfer) => transfer,
  );
}

