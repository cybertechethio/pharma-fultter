import 'package:cyber_pos/features/auth/domain/entities/current_context.dart';
import '../schemas/current_context_schema.dart';

extension CurrentContextSchemaMapper on CurrentContextSchema {
  CurrentContext toDomain() => CurrentContext(
    currentCompanyId: currentCompanyId,
    currentBranchId: currentBranchId,
  );
}

extension CurrentContextToSchemaMapper on CurrentContext {
  CurrentContextSchema toSchema() => CurrentContextSchema()
    ..currentCompanyId = currentCompanyId
    ..currentBranchId = currentBranchId
    ..singleton = 1;
}

