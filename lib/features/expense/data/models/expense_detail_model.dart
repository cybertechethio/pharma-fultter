import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'expense_detail_model.freezed.dart';
part 'expense_detail_model.g.dart';

@freezed
sealed class ExpenseDetailModel with _$ExpenseDetailModel {
  const factory ExpenseDetailModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required DateTime expenseDate,
    required String name,
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String amount,
    String? notes,
    @JsonKey(defaultValue: <String>[]) required List<String> attachments,
    String? status,
    required DateTime createdAt,
    DateTime? updatedAt,
    @JsonKey(name: 'expensePayments', defaultValue: <ExpensePaymentModel>[])
    required List<ExpensePaymentModel> expensePayments,
  }) = _ExpenseDetailModel;

  factory ExpenseDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseDetailModelFromJson(json);
}

@freezed
sealed class ExpensePaymentModel with _$ExpensePaymentModel {
  const factory ExpensePaymentModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String expenseId,
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String amount,
    required DateTime createdAt,
    @JsonKey(name: 'paymentMethods', defaultValue: <ExpensePaymentMethodModel>[])
    required List<ExpensePaymentMethodModel> paymentMethods,
  }) = _ExpensePaymentModel;

  factory ExpensePaymentModel.fromJson(Map<String, dynamic> json) =>
      _$ExpensePaymentModelFromJson(json);
}

@freezed
sealed class ExpensePaymentMethodModel with _$ExpensePaymentMethodModel {
  const factory ExpensePaymentMethodModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required String method,
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String amount,
    String? referenceNumber,
      int? bankId,
    required DateTime createdAt,
    @JsonKey(name: 'banks', fromJson: JsonTypeConverters.bankNameFromDynamic) String? bankName,
    String? attachment,
  }) = _ExpensePaymentMethodModel;

  factory ExpensePaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$ExpensePaymentMethodModelFromJson(json);
}

