import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/item_model.dart';
import '../models/item_request_model.dart';

abstract class ItemRemoteDataSource {
  Future<Either<Failure, PaginatedResponse<ItemModel>>> getItems({
    int page = 1,
    int limit = 25,
    String? search,
    int? categoryId,
  });

  Future<Either<Failure, ItemModel>> createItem(ItemRequestModel request);

  Future<Either<Failure, ItemModel>> updateItem({
    required int id,
    required ItemRequestModel request,
  });

  Future<Either<Failure, ItemModel>> deleteItem({
    required int id,
  });
}

