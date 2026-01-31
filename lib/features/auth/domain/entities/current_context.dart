import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_context.freezed.dart';

@freezed
sealed class CurrentContext with _$CurrentContext {
  const factory CurrentContext({
    String? currentCompanyId,
    String? currentBranchId,
  }) = _CurrentContext;
}

/// Extension methods for CurrentContext
extension CurrentContextX on CurrentContext {
  /// Check if user has selected a company
  bool get hasCompany => currentCompanyId != null;
  
  /// Check if user has selected a branch
  bool get hasBranch => currentBranchId != null;
  
  /// Check if user has both company and branch selected
  bool get hasCompleteContext => hasCompany && hasBranch;
  
  /// Get display text for current context
  String get contextDisplayText {
    if (hasCompleteContext) {
      return 'Company & Branch Selected';
    } else if (hasCompany) {
      return 'Company Selected';
    } else if (hasBranch) {
      return 'Branch Selected';
    } else {
      return 'No Context Selected';
    }
  }
}
