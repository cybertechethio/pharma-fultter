import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_item_data.freezed.dart';

@freezed
sealed class AnnualItemData with _$AnnualItemData {
  const factory AnnualItemData({
    required double sales,
    required double cost,
    required double vat,
    required double grossProfit,
  }) = _AnnualItemData;
}

