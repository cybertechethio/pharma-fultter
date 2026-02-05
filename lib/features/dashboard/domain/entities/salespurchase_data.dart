import 'package:freezed_annotation/freezed_annotation.dart';

part 'salespurchase_data.freezed.dart';

@freezed
sealed class SalesPurchaseData with _$SalesPurchaseData {
  const factory SalesPurchaseData({
    required DateTime date,
    required double sales,
    required double purchase,
  }) = _SalesPurchaseData;
}

