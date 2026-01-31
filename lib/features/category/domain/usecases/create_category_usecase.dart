import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/category.dart';
import '../repositories/category_repository.dart';

class CreateCategoryUseCase {
  final CategoryRepository _repository;

  CreateCategoryUseCase(this._repository);

  Future<Either<Failure, Category>> call({
    required String name,
    required String description,
  }) async {
    return await _repository.createCategory(
      name: name,
      description: description,
    );
  }
}

