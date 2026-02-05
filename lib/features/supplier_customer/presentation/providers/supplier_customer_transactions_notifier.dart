import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../transaction/domain/entities/transaction.dart';
import 'supplier_customer_providers.dart';

part 'supplier_customer_transactions_notifier.g.dart';

@riverpod
Future<List<Transaction>> supplierCustomerTransactions(
  Ref ref,
  String supplierCustomerId,
) async {
  final useCase = ref.read(getSupplierCustomerTransactionsUseCaseProvider);
  final result = await useCase.call(supplierCustomerId: supplierCustomerId);
  return result.fold(
    (failure) => throw failure,
    (transactions) => transactions,
  );
}
