import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../domain/entities/item.dart';
import '../../domain/entities/item_with_batches.dart';
import '../../domain/repositories/item_repository.dart';
import '../datasources/item_remote_data_source.dart';
import '../mappers/item_mapper.dart';
import '../mappers/item_with_batches_mapper.dart';
import '../models/item_request_model.dart';

class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDataSource _remoteDataSource;

  ItemRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResponse<Item>>> getItems({
    int page = 1,
    int limit = 25,
    String? search,
    int? categoryId,
  }) async {
    final result = await _remoteDataSource.getItems(
      page: page,
      limit: limit,
      search: search,
      categoryId: categoryId,
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
  Future<Either<Failure, PaginatedResponse<ItemWithBatches>>>
      getItemsIncludeBatches({
    int page = 1,
    int limit = 1000,
    String? search,
    int? categoryId,
  }) async {
    final result = await _remoteDataSource.getItemsIncludeBatches(
      page: page,
      limit: limit,
      search: search,
      categoryId: categoryId,
    );
    return result.fold(
      (failure) => Left(failure),
      (paginatedModels) {
        final entities = paginatedModels.data
            .map((model) => model.toDomain())
            .toList();
        return Right(PaginatedResponse(
          data: entities,
          pagination: paginatedModels.pagination,
        ));
      },
    );
  }

  @override
  Future<Either<Failure, Item>> createItem(ItemRequestModel request) async {
    final response = await _remoteDataSource.createItem(request);

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Item>> updateItem({
    required int id,
    required ItemRequestModel request,
  }) async {
    final response = await _remoteDataSource.updateItem(
      id: id,
      request: request,
    );

    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }

  @override
  Future<Either<Failure, Item>> deleteItem({
    required int id,
  }) async {
    final response = await _remoteDataSource.deleteItem(id: id);
    return response.fold(
      (failure) => Left(failure),
      (model) => Right(model.toDomain()),
    );
  }
}

