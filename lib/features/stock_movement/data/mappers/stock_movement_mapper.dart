import '../../domain/entities/stock_movement.dart';
import '../../domain/entities/stock_movement_item.dart';
import '../models/stock_movement_model.dart';
import '../models/stock_movement_item_model.dart';

/// Extension for mapping StockMovementItemModel to StockMovementItem entity
extension StockMovementItemModelMapper on StockMovementItemModel {
  StockMovementItem toDomain() {
    return StockMovementItem(
      id: id,
      name: name,
      code: code,
    );
  }
}

/// Extension for mapping StockMovementModel to StockMovement entity
extension StockMovementModelMapper on StockMovementModel {
  StockMovement toDomain() {
    return StockMovement(
      id: id,
      companyId: companyId,
      branchId: branchId,
      itemId: itemId,
      transactionId: transactionId,
      type: type,
      quantity: quantity,
      previousStock: previousStock,
      newStock: newStock,
      sourceBranchId: sourceBranchId,
      destinationBranchId: destinationBranchId,
      transferId: transferId,
      reversesMovementId: reversesMovementId,
      notes: notes,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      updatedBy: updatedBy,
      creatorName: creatorName,
      updaterName: updaterName,
      sourceBranchName: sourceBranchName,
      destinationBranchName: destinationBranchName,
      item: item?.toDomain(),
    );
  }
}
