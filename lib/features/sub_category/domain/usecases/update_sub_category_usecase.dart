import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/sub_category.dart';
import '../repositories/sub_category_repository.dart';

class UpdateSubCategoryUseCase {
  final SubCategoryRepository _repository;

  UpdateSubCategoryUseCase(this._repository);

  Future<Either<Failure, SubCategory>> call({
    required String id,
    required String name,
    required int categoryId,
    required String description,
  }) async {
    return await _repository.updateSubCategory(
      id: id,
      name: name,
      categoryId: categoryId,
      description: description,
    );
  }
}

