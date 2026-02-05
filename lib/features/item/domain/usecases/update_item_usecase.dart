import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/item.dart';
import '../repositories/item_repository.dart';
import '../../data/models/item_request_model.dart';

class UpdateItemUseCase {
  final ItemRepository _repository;

  UpdateItemUseCase(this._repository);

  Future<Either<Failure, Item>> call({
    required int id,
    required ItemRequestModel request,
  }) async {
    // Validate request before proceeding
    final validationError = request.validate();
    if (validationError != null) {
      return Left(Failure.validationError(validationError));
    }

    return await _repository.updateItem(id: id, request: request);
  }
}

