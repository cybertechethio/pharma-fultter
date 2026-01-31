import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/brand.dart';
import '../repositories/brand_repository.dart';

class DeleteBrandUseCase {
  final BrandRepository repository;

  DeleteBrandUseCase(this.repository);

  Future<Either<Failure, BrandEntity>> call({required String id}) async {
    return await repository.deleteBrand(id: id);
  }
}

