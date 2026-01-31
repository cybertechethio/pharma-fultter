import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/utils/formatters.dart';

part 'branch.freezed.dart';

@freezed
sealed class Branch with _$Branch {
  const factory Branch({
    required String id,
    required String name,
    required String companyId,
    required bool isActive,
    DateTime? createdAt,
    String? createdBy,
    String? updatedBy,
  }) = _Branch;
}

/// Extension methods for Branch
extension BranchX on Branch {
  /// Check if branch is active
  bool get isActiveBranch => isActive;
  
  /// Get formatted creation date
  String? get formattedCreatedAt {
    if (createdAt == null) return null;
    return Formatters.formatRelativeDate(createdAt!);
  }
}
