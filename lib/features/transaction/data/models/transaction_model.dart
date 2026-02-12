// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';
import 'trans_item_model.dart';
import 'payment_model.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
sealed class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required int id,
    required String transactionType,
    required String transactionNumber,
    required String status,
    int? supplierId,
    int? customerId,
    String? supplierName,
    String? customerName,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double subtotal,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalTax,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double totalAmount,
    String? notes,
    @Default([]) List<String> attachments,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? createdBy,
    int? updatedBy,
    String? creatorName,
    String? updatorName,
    @Default([]) List<TransItemModel> items,
    PaymentModel? payment,
    PaymentModel? refund,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

