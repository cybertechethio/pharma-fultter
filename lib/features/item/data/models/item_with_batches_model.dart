// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'item_batch_summary_model.dart';

part 'item_with_batches_model.freezed.dart';
part 'item_with_batches_model.g.dart';

@freezed
sealed class ItemWithBatchesModel with _$ItemWithBatchesModel {
  const factory ItemWithBatchesModel({
    required int id,
    required String name,
    String? code,
    @Default([]) List<ItemBatchSummaryModel> batches,
  }) = _ItemWithBatchesModel;

  factory ItemWithBatchesModel.fromJson(Map<String, dynamic> json) =>
      _$ItemWithBatchesModelFromJson(json);
}
