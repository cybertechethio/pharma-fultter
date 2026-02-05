import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import 'trans_item.dart';
import 'payment.dart';

part 'transaction.freezed.dart';

@freezed
sealed class Transaction with _$Transaction {
  const factory Transaction({
    required int id,
    required TransactionType transactionType,
    required String transactionNumber,
    required String status,
    int? supplierId,
    int? customerId,
    String? supplierName,
    String? customerName,
    required double subtotal,
    required double totalTax,
    required double totalAmount,
    String? notes,
    @Default([]) List<String> attachments,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? createdBy,
    int? updatedBy,
    String? creatorName,
    String? updatorName,
    @Default([]) List<TransItem> items,
    Payment? payment,
  }) = _Transaction;
}

