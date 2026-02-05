import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/transfer.dart';
import 'transfer_providers.dart';

part 'transfer_detail_notifier.g.dart';

@riverpod
Future<Transfer> transferDetail(Ref ref, int id) async {
  final useCase = ref.read(getTransferDetailUseCaseProvider);
  final result = await useCase.call(id);

  return result.fold(
    (failure) {
      // Emit error through state
      throw failure;
    },
    (detail) => detail,
  );
}

