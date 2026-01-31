// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../core/utils/json_type_converters.dart';
import 'payment_detail_model.dart';
import 'transaction_item_detail_model.dart';

part 'transaction_detail_response_model.freezed.dart';
part 'transaction_detail_response_model.g.dart';

@freezed
sealed class TransactionDetailResponseModel with _$TransactionDetailResponseModel {
  const factory TransactionDetailResponseModel({
    // All fields from TransactionResponseModel
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic) required int id,
    @JsonKey(fromJson: _transactionTypeFromJson)
    required TransactionType transactionType,
    required String transactionNumber,
    required String status,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double subtotal,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalTax,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalAmount,
    String? notes,
    @JsonKey(fromJson: JsonTypeConverters.dateTimeFromDynamic)
    required DateTime createdAt,
    String? creatorName,
    String? supplierName,
    String? customerName,
    // Additional detail fields
    required List<String> attachments,
    PaymentDetailModel? payment,
    required List<TransactionItemDetailModel> transactionItems,
  }) = _TransactionDetailResponseModel;

  factory TransactionDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailResponseModelFromJson(json);
}

TransactionType _transactionTypeFromJson(dynamic value) {
  if (value is String) {
    return TransactionTypeExtension.fromString(value);
  }
  throw ArgumentError(
    'Expected String for transaction_type, got ${value.runtimeType}. Value: $value',
  );
}

