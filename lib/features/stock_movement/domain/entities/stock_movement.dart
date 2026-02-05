import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/enums/stock_movement_type_enum.dart';
import '../../../../core/enums/stock_movement_status_enum.dart';
import 'stock_movement_item.dart';

part 'stock_movement.freezed.dart';

@freezed
sealed class StockMovement with _$StockMovement {
  const StockMovement._();

  const factory StockMovement({
    required int id,
    required int companyId,
    required int branchId,
    required int itemId,
    int? transactionId,
    required StockMovementType type,
    required String quantity,
    String? previousStock,
    String? newStock,
    int? sourceBranchId,
    int? destinationBranchId,
    int? transferId,
    int? reversesMovementId,
    String? notes,
    required StockMovementStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    int? createdBy,
    int? updatedBy,
    String? creatorName,
    String? updaterName,
    String? sourceBranchName,
    String? destinationBranchName,
    StockMovementItem? item,
  }) = _StockMovement;

  /// Calculate inbound quantity
  /// inbound = newStock - previousStock if positive, else 0
  double get inbound {
    final prev = double.tryParse(previousStock ?? '0') ?? 0.0;
    final current = double.tryParse(newStock ?? '0') ?? 0.0;
    final diff = current - prev;
    return diff > 0 ? diff : 0.0;
  }

  /// Calculate outbound quantity
  /// outbound = |newStock - previousStock| if negative, else 0
  double get outbound {
    final prev = double.tryParse(previousStock ?? '0') ?? 0.0;
    final current = double.tryParse(newStock ?? '0') ?? 0.0;
    final diff = current - prev;
    return diff < 0 ? diff.abs() : 0.0;
  }
}
