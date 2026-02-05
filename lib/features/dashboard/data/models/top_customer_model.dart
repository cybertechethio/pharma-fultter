// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'top_customer_model.freezed.dart';
part 'top_customer_model.g.dart';

@freezed
sealed class TopCustomerModel with _$TopCustomerModel {
  const factory TopCustomerModel({
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int id,
    required String name,
    String? imageUrl,
    String? location,
    @JsonKey(fromJson: JsonTypeConverters.intFromDynamic)
    required int orders,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double total,
  }) = _TopCustomerModel;

  factory TopCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$TopCustomerModelFromJson(json);
}

