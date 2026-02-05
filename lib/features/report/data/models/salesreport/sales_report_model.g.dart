// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesReportModel _$SalesReportModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SalesReportModel', json, ($checkedConvert) {
      final val = _SalesReportModel(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map(
                (e) => SalesItemDataModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        summary: $checkedConvert(
          'summary',
          (v) => SalesSummaryModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SalesReportModelToJson(_SalesReportModel instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'summary': instance.summary.toJson(),
    };
