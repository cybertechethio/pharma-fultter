import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_remote_data_source.dart';
import '../mappers/category_mapper.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource _remote;

  CategoryRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, PaginatedResponse<Category>>> getCategories({
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
  Future<Either<Failure, Category>> createCategory({
    required String name,
    required String description,
  }) async {
    final response = await _remote.create(
      name: name,
      description: description,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Category>> updateCategory({
    required String id,
    required String name,
    required String description,
  }) async {
    final response = await _remote.update(
      id: id,
      name: name,
      description: description,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Category>> deleteCategory({
    required String id,
  }) async {
    final response = await _remote.delete(id: id);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

