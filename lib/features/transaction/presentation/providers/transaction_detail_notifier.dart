import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/transaction_detail.dart';
import 'transaction_providers.dart';

part 'transaction_detail_notifier.g.dart';

@riverpod
Future<TransactionDetail> transactionDetail(Ref ref, int id) async {
  final useCase = ref.read(getTransactionDetailUseCaseProvider);
  final result = await useCase.call(id);

  return result.fold(
    (failure) {
      // Emit error through state
      throw failure;
    },
    (detail) => detail,
  );
}

