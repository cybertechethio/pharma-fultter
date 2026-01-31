// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';
import '../../../../core/enums/transaction_type_enum.dart';

part 'transaction_response_model.freezed.dart';
part 'transaction_response_model.g.dart';

@freezed
sealed class TransactionResponseModel with _$TransactionResponseModel {
  const factory TransactionResponseModel({
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
  }) = _TransactionResponseModel;

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseModelFromJson(json);
}

TransactionType _transactionTypeFromJson(dynamic value) {
  if (value is String) {
    return TransactionTypeExtension.fromString(value);
  }
  throw ArgumentError(
    'Expected String for transaction_type, got ${value.runtimeType}. Value: $value',
  );
}

