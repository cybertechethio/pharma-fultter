// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesSummaryModel _$SalesSummaryModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SalesSummaryModel', json, ($checkedConvert) {
      final val = _SalesSummaryModel(
        totalSales: $checkedConvert(
          'totalSales',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalQuantity: $checkedConvert(
          'totalQuantity',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
        totalTax: $checkedConvert(
          'totalTax',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalDiscount: $checkedConvert(
          'totalDiscount',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        transactionCount: $checkedConvert(
          'transactionCount',
          (v) => JsonTypeConverters.intFromDynamic(v),
        ),
        averageTransactionValue: $checkedConvert(
          'averageTransactionValue',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalAmount: $checkedConvert(
          'totalAmount',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalPaid: $checkedConvert(
          'totalPaid',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalUnpaid: $checkedConvert(
          'totalUnpaid',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        overdue: $checkedConvert(
          'overdue',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SalesSummaryModelToJson(_SalesSummaryModel instance) =>
    <String, dynamic>{
      'totalSales': instance.totalSales,
      'totalQuantity': instance.totalQuantity,
      'totalTax': instance.totalTax,
      'totalDiscount': instance.totalDiscount,
      'transactionCount': instance.transactionCount,
      'averageTransactionValue': instance.averageTransactionValue,
      'totalAmount': instance.totalAmount,
      'totalPaid': instance.totalPaid,
      'totalUnpaid': instance.totalUnpaid,
      'overdue': instance.overdue,
    };
