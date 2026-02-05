// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profit_loss_report_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfitLossReportDetailsModel _$ProfitLossReportDetailsModelFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_ProfitLossReportDetailsModel', json, ($checkedConvert) {
  final val = _ProfitLossReportDetailsModel(
    date: $checkedConvert('date', (v) => DateTime.parse(v as String)),
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>)
          .map(
            (e) => ProfitLossItemDataModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
    totals: $checkedConvert(
      'totals',
      (v) => ProfitLossTotalsModel.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ProfitLossReportDetailsModelToJson(
  _ProfitLossReportDetailsModel instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'totals': instance.totals.toJson(),
};
