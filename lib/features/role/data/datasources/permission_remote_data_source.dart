import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/permission_model.dart';

abstract class PermissionRemoteDataSource {
  /// Fetches all permissions grouped by dynamic categories
  /// Returns Map<categoryName, List<PermissionModel>>
  Future<Either<Failure, Map<String, List<PermissionModel>>>> getPermissions({
    int page = 1,
    int limit = 1000,
    String? search,
  });
}

