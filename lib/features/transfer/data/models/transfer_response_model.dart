import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_response_model.freezed.dart';
part 'transfer_response_model.g.dart';

@freezed
sealed class TransferResponseModel with _$TransferResponseModel {
  const factory TransferResponseModel({
    required int id,
    int? companyId,
    required String transferType,
    required String transferNumber,
    int? sourceBranchId,
    int? destinationBranchId,
    int? relatedTransferId,
    required String status,
    String? notes,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
    String? sourceBranchName,
    String? destinationBranchName,
    TransferResponseModel? relatedTransfer,
  }) = _TransferResponseModel;

  factory TransferResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TransferResponseModelFromJson(json);
}













