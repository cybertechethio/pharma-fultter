import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/sub_category.dart';
import '../repositories/sub_category_repository.dart';

class DeleteSubCategoryUseCase {
  final SubCategoryRepository _repository;

  DeleteSubCategoryUseCase(this._repository);

  Future<Either<Failure, SubCategory>> call({
    required String id,
  }) async {
    return await _repository.deleteSubCategory(id: id);
  }
}

