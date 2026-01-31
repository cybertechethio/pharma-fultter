import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/brand.dart';
import '../repositories/brand_repository.dart';

class GetBrandsUseCase {
  final BrandRepository repository;

  GetBrandsUseCase(this.repository);

  Future<Either<Failure, List<BrandEntity>>> call({
    String? search,
  }) async {
    return await repository.getBrands(search: search);
  }
}

