import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_request_model.freezed.dart';
part 'company_request_model.g.dart';

@freezed
sealed class CompanyRequestModel with _$CompanyRequestModel {
  const factory CompanyRequestModel({
    String? name,
    String? phone1,
    String? phone2,
    String? logoUrl,
    String? tinNumber,
    String? tradeName,
    String? city,
    String? wereda,
    bool? autoPrint,
    DateTime? defaultStartDate,
    String? businessType,
  }) = _CompanyRequestModel;

  factory CompanyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyRequestModelFromJson(json);
}


