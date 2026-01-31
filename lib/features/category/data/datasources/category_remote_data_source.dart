import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<Either<Failure, PaginatedResponse<CategoryModel>>> getAll({
    int page = 1,
    int limit = 25,
    String? search,
  });

  Future<Either<Failure, CategoryModel>> create({
    required String name,
    required String description,
  });

  Future<Either<Failure, CategoryModel>> update({
    required String id,
    required String name,
    required String description,
  });

  Future<Either<Failure, CategoryModel>> delete({
    required String id,
  });
}

