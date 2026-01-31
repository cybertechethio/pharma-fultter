import '../../domain/entities/auth_token.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/current_context.dart';
import '../../../setting/domain/entities/company.dart';
import '../../../branch/domain/entities/branch.dart';

abstract class AuthLocalDataSource {
  Future<void> saveTokens(AuthToken tokens);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> clearTokens();
  Future<User?> getUser();
  Future<void> saveUser(User user);
  Future<void> clearUser();
  Future<void> saveCurrentContext(CurrentContext currentContext);
  Future<CurrentContext?> getCurrentContext();
  Future<void> clearCurrentContext();
  Future<void> saveCompany(Company company);
  Future<Company?> getCompany();
  Future<void> clearCompany();
  Future<void> saveBranches(List<Branch> branches);
  Future<List<Branch>> getBranches();
  Future<void> clearBranches();
}
