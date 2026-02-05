// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/utils/json_type_converters.dart';

part 'transfer_item_model.freezed.dart';
part 'transfer_item_model.g.dart';

@freezed
sealed class TransferItemModel with _$TransferItemModel {
  const factory TransferItemModel({
    required int id,
    required String itemName,
    String? itemCode,
    @JsonKey(fromJson: JsonTypeConverters.doubleFromDynamic)
    required double quantity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TransferItemModel;

  factory TransferItemModel.fromJson(Map<String, dynamic> json) =>
      _$TransferItemModelFromJson(json);
}

