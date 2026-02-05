// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SummaryModel _$SummaryModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_SummaryModel', json, ($checkedConvert) {
      final val = _SummaryModel(
        totalSales: $checkedConvert(
          'totalSales',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalSalesReturn: $checkedConvert(
          'totalSalesReturn',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalPurchase: $checkedConvert(
          'totalPurchase',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalPurchaseReturn: $checkedConvert(
          'totalPurchaseReturn',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        profit: $checkedConvert(
          'profit',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        invoiceDue: $checkedConvert(
          'invoiceDue',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        invoiceDuePercentageChange: $checkedConvert(
          'invoiceDuePercentageChange',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalExpenses: $checkedConvert(
          'totalExpenses',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalExpensesPercentageChange: $checkedConvert(
          'totalExpensesPercentageChange',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalPaymentReturns: $checkedConvert(
          'totalPaymentReturns',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
        totalPaymentReturnsPercentageChange: $checkedConvert(
          'totalPaymentReturnsPercentageChange',
          (v) => JsonTypeConverters.doubleFromDynamic(v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SummaryModelToJson(_SummaryModel instance) =>
    <String, dynamic>{
      'totalSales': instance.totalSales,
      'totalSalesReturn': instance.totalSalesReturn,
      'totalPurchase': instance.totalPurchase,
      'totalPurchaseReturn': instance.totalPurchaseReturn,
      'profit': instance.profit,
      'invoiceDue': instance.invoiceDue,
      'invoiceDuePercentageChange': instance.invoiceDuePercentageChange,
      'totalExpenses': instance.totalExpenses,
      'totalExpensesPercentageChange': instance.totalExpensesPercentageChange,
      'totalPaymentReturns': instance.totalPaymentReturns,
      'totalPaymentReturnsPercentageChange':
          instance.totalPaymentReturnsPercentageChange,
    };
