import '../../domain/entities/current_context.dart';
import '../models/current_context_model.dart';

extension CurrentContextModelMapper on CurrentContextModel {
  CurrentContext toDomain() => CurrentContext(
    currentCompanyId: currentCompanyId,
    currentBranchId: currentBranchId,
  );
}

extension CurrentContextMapper on CurrentContext {
  CurrentContextModel toModel() => CurrentContextModel(
    currentCompanyId: currentCompanyId,
    currentBranchId: currentBranchId,
  );
}
