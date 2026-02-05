// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerReportModel _$CustomerReportModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_CustomerReportModel', json, ($checkedConvert) {
      final val = _CustomerReportModel(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map(
                (e) =>
                    CustomerItemDataModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        summary: $checkedConvert(
          'summary',
          (v) => CustomerSummaryModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CustomerReportModelToJson(
  _CustomerReportModel instance,
) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'summary': instance.summary.toJson(),
};
