// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import 'transaction_item_model.dart';
import 'transaction_payment_model.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
sealed class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    @JsonKey(toJson: _transactionTypeToJson)
    required TransactionType transactionType,
    int? supplierId,
    int? customerId,
    int? branchId,
    String? notes,
    required List<TransactionItemModel> items,
    List<TransactionPaymentModel>? paymentMethods,
    List<String>? attachments, // URLs to uploaded attachment files
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

String _transactionTypeToJson(TransactionType type) => type.toApiString();

