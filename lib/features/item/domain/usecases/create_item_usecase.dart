import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/item.dart';
import '../repositories/item_repository.dart';
import '../../data/models/item_request_model.dart';

class CreateItemUseCase {
  final ItemRepository _repository;

  CreateItemUseCase(this._repository);

  Future<Either<Failure, Item>> call(ItemRequestModel request) async {
    // Validate request before proceeding
    final validationError = request.validate();
    if (validationError != null) {
      return Left(Failure.validationError(validationError));
    }

    return await _repository.createItem(request);
  }
}

