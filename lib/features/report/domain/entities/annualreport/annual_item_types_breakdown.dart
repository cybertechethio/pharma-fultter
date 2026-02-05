import 'package:freezed_annotation/freezed_annotation.dart';
import 'annual_item_type_data.dart';

part 'annual_item_types_breakdown.freezed.dart';

@freezed
sealed class AnnualItemTypesBreakdown with _$AnnualItemTypesBreakdown {
  const factory AnnualItemTypesBreakdown({
    required AnnualItemTypeData direct,
    required AnnualItemTypeData processed,
  }) = _AnnualItemTypesBreakdown;
}

