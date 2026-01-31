import '../../../branch/domain/entities/branch.dart';
import '../../../setting/domain/entities/company.dart';
import '../../domain/entities/auth_token.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/current_context.dart';
import '../models/generic_response_model.dart';
import 'user_mapper.dart';
import '../../../setting/data/mappers/company_mapper.dart';
import '../../../branch/data/mappers/branch_mapper.dart';

extension GenericResponseModelMapper on GenericResponseModel {
  ({
    User user,
    AuthToken tokens,
    CurrentContext currentContext,
    Company? currentCompany,
    Branch? currentBranch,
  }) toDomain() => (
    user: user.toDomain(),
    tokens: AuthToken(
      accessToken: accessToken,
      refreshToken: refreshToken,
    ),
    currentContext: CurrentContext(
      currentCompanyId: currentCompanyId,
      currentBranchId: currentBranchId,
    ),
    currentCompany: currentCompany?.toDomain(),
    currentBranch: currentBranch?.toDomain(),
  );
}
