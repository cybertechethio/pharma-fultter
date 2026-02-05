import 'package:freezed_annotation/freezed_annotation.dart';

part 'profit_loss_item_data.freezed.dart';

@freezed
sealed class ProfitLossItemData with _$ProfitLossItemData {
  const factory ProfitLossItemData({
    required String itemType,
    required double sales,
    required double cost,
    required double vat,
    required double grossProfit,
  }) = _ProfitLossItemData;
}

