import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/transaction_type_enum.dart';

part 'transaction.freezed.dart';

@freezed
sealed class Transaction with _$Transaction {
  const factory Transaction({
    required int id,
    required TransactionType transactionType,
    required String transactionNumber,
    required String status,
    required double subtotal,
    required double totalTax,
    required double totalAmount,
    String? notes,
    required DateTime createdAt,
    String? creatorName,
    String? supplierName,
    String? customerName,
  }) = _Transaction;
}

