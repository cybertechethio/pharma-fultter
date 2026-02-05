// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseReportModel _$PurchaseReportModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PurchaseReportModel', json, ($checkedConvert) {
      final val = _PurchaseReportModel(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map(
                (e) =>
                    PurchaseItemDataModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        summary: $checkedConvert(
          'summary',
          (v) => PurchaseSummaryModel.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PurchaseReportModelToJson(
  _PurchaseReportModel instance,
) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'summary': instance.summary.toJson(),
};
