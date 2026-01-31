import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../domain/entities/sub_category.dart';
import '../../domain/repositories/sub_category_repository.dart';
import '../datasources/sub_category_remote_data_source.dart';
import '../mappers/sub_category_mapper.dart';

class SubCategoryRepositoryImpl implements SubCategoryRepository {
  final SubCategoryRemoteDataSource _remote;

  SubCategoryRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, PaginatedResponse<SubCategory>>> getSubCategories({
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    final result = await _remote.getAll(page: page, limit: limit, search: search);
    
    return result.fold(
      (failure) => Left(failure),
      (paginatedModels) {
        // Convert models to entities
        final entities = paginatedModels.data
            .map((model) => model.toDomain())
            .toList();

        // Return paginated response with entities
        return Right(PaginatedResponse(
          data: entities,
          pagination: paginatedModels.pagination,
        ));
      },
    );
  }

  @override
  Future<Either<Failure, PaginatedResponse<SubCategory>>> getSubCategoriesByCategory({
    required String categoryId,
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    final result = await _remote.getByCategory(
      categoryId: categoryId,
      page: page,
      limit: limit,
      search: search,
    );
    
    return result.fold(
      (failure) => Left(failure),
      (paginatedModels) {
        // Convert models to entities
        final entities = paginatedModels.data
            .map((model) => model.toDomain())
            .toList();

        // Return paginated response with entities
        return Right(PaginatedResponse(
          data: entities,
          pagination: paginatedModels.pagination,
        ));
      },
    );
  }

  @override
  Future<Either<Failure, SubCategory>> createSubCategory({
    required String name,
    required int categoryId,
    required String description,
  }) async {
    final response = await _remote.create(
      name: name,
      categoryId: categoryId,
      description: description,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, SubCategory>> updateSubCategory({
    required String id,
    required String name,
    required int categoryId,
    required String description,
  }) async {
    final response = await _remote.update(
      id: id,
      name: name,
      categoryId: categoryId,
      description: description,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, SubCategory>> deleteSubCategory({
    required String id,
  }) async {
    final response = await _remote.delete(id: id);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

