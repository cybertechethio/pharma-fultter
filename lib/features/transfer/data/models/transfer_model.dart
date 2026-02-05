// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'transfer_item_model.dart';

part 'transfer_model.freezed.dart';
part 'transfer_model.g.dart';

@freezed
sealed class TransferModel with _$TransferModel {
  const factory TransferModel({
    required int id,
    required int companyId,
    required String transferType,
    required String transferNumber,
    required String status,
    int? sourceBranchId,
    String? sourceBranch,
    int? destinationBranchId,
    String? destinationBranch,
    int? relatedTransferId,
    int? transferId,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? createdBy,
    int? updatedBy,
    String? creatorName,
    String? updatorName,
    @Default([]) List<TransferItemModel> transferItems,
  }) = _TransferModel;

  factory TransferModel.fromJson(Map<String, dynamic> json) =>
      _$TransferModelFromJson(json);
}

