// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annual_report_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnualReportDetailsModel _$AnnualReportDetailsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_AnnualReportDetailsModel', json, ($checkedConvert) {
  final val = _AnnualReportDetailsModel(
    startDate: $checkedConvert('startDate', (v) => DateTime.parse(v as String)),
    endDate: $checkedConvert('endDate', (v) => DateTime.parse(v as String)),
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>)
          .map((e) => AnnualItemDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    totals: $checkedConvert(
      'totals',
      (v) => AnnualTotalsModel.fromJson(v as Map<String, dynamic>),
    ),
    expenses: $checkedConvert(
      'expenses',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
    netProfit: $checkedConvert(
      'netProfit',
      (v) => JsonTypeConverters.doubleFromDynamic(v),
    ),
  );
  return val;
});

Map<String, dynamic> _$AnnualReportDetailsModelToJson(
  _AnnualReportDetailsModel instance,
) => <String, dynamic>{
  'startDate': instance.startDate.toIso8601String(),
  'endDate': instance.endDate.toIso8601String(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'totals': instance.totals.toJson(),
  'expenses': instance.expenses,
  'netProfit': instance.netProfit,
};
