// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';
import 'trans_item_batch_model.dart';

part 'trans_item_model.freezed.dart';
part 'trans_item_model.g.dart';

@freezed
sealed class TransItemModel with _$TransItemModel {
  const factory TransItemModel({
    required int id,
    required String itemName,
    required String itemCode,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double quantity,
    @Default([]) List<TransItemBatchModel> batches,
  }) = _TransItemModel;

  factory TransItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransItemModelFromJson(json);
}

