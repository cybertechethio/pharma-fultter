// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
sealed class CompanyModel with _$CompanyModel {
  const factory CompanyModel({
    @JsonKey(fromJson: JsonTypeConverters.stringFromDynamic) required String id,
    required String name,
    String? phone1,
    String? phone2,
    String? logoUrl,
    String? tinNumber,
    String? tradeName,
    String? city,
    String? wereda,
    @Default(false) bool autoPrint,
    DateTime? defaultStartDate,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
}

