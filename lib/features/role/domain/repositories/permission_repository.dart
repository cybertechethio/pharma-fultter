import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/permission.dart';

abstract class PermissionRepository {
  /// Fetches all permissions grouped by dynamic categories
  /// Returns Map<categoryName, List<PermissionEntity>>
  Future<Either<Failure, Map<String, List<PermissionEntity>>>> getPermissions({
    int page = 1,
    int limit = 1000,
    String? search,
  });
}

