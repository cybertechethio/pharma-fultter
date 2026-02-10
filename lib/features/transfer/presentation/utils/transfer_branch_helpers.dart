import '../../../../core/enums/transfer_status_enum.dart';
import '../../domain/entities/transfer.dart';

/// True when transfer is pending and current user's branch is the destination branch (acceptor).
bool canAcceptOrReject(Transfer transfer, String? currentBranchId) {
  if (currentBranchId == null || transfer.destinationBranchId == null) return false;
  final status = TransferStatusExtension.fromString(transfer.status);
  if (status != TransferStatus.pending) return false;
  final currentId = int.tryParse(currentBranchId);
  return currentId != null && transfer.destinationBranchId == currentId;
}

/// True when current user's branch is the transfer's source branch (sending side).
bool isCurrentBranchSource(Transfer transfer, String? currentBranchId) {
  if (currentBranchId == null || transfer.sourceBranchId == null) return false;
  final currentId = int.tryParse(currentBranchId);
  return currentId != null && transfer.sourceBranchId == currentId;
}
