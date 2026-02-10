import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_detail.freezed.dart';

@freezed
sealed class ExpenseDetail with _$ExpenseDetail {
  const factory ExpenseDetail({
    required String id,
    required DateTime expenseDate,
    required String name,
    required String amount,
    String? notes,
    required List<String> attachments,
     String? status,
    required DateTime createdAt,
    DateTime? updatedAt,
    required List<ExpensePayment> expensePayments,
  }) = _ExpenseDetail;
}

@freezed
sealed class ExpensePayment with _$ExpensePayment {
  const factory ExpensePayment({
    required String id,
    required String expenseId,
    required String amount,
    required DateTime createdAt,
    required List<ExpensePaymentMethod> paymentMethods,
  }) = _ExpensePayment;
}

@freezed
sealed class ExpensePaymentMethod with _$ExpensePaymentMethod {
  const factory ExpensePaymentMethod({
    required String id,
    required String method,
    required String amount,
    int? bankId,
    String? referenceNumber,
    required DateTime createdAt,
    String? bankName,
    String? attachment,
  }) = _ExpensePaymentMethod;
}

