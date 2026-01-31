import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/sub_category_model.dart';

abstract class SubCategoryRemoteDataSource {
  Future<Either<Failure, PaginatedResponse<SubCategoryModel>>> getAll({
    int page = 1,
    int limit = 25,
    String? search,
  });

  Future<Either<Failure, PaginatedResponse<SubCategoryModel>>> getByCategory({
    required String categoryId,
    int page = 1,
    int limit = 25,
    String? search,
  });

  Future<Either<Failure, SubCategoryModel>> create({
    required String name,
    required int categoryId,
    required String description,
  });

  Future<Either<Failure, SubCategoryModel>> update({
    required String id,
    required String name,
    required int categoryId,
    required String description,
  });

  Future<Either<Failure, SubCategoryModel>> delete({
    required String id,
  });
}

