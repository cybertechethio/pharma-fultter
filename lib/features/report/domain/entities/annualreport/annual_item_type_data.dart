import 'package:freezed_annotation/freezed_annotation.dart';

part 'annual_item_type_data.freezed.dart';

@freezed
sealed class AnnualItemTypeData with _$AnnualItemTypeData {
  const factory AnnualItemTypeData({
    required double sales,
    required double cost,
    required double grossProfit,
  }) = _AnnualItemTypeData;
}

