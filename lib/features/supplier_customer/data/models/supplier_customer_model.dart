// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'supplier_customer_model.freezed.dart';
part 'supplier_customer_model.g.dart';

@freezed
sealed class SupplierCustomerModel with _$SupplierCustomerModel {
  const factory SupplierCustomerModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required String name,
    required String phone,
    required String accountCode,
    @Default('N/A') String tinNumber,
    /// API returns uppercase strings: CUSTOMER | SUPPLIER
    required String type,
    @Default(true) bool isActive,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _SupplierCustomerModel;

  factory SupplierCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$SupplierCustomerModelFromJson(json);
}


