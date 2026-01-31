import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/batch.dart';
import '../repositories/batch_repository.dart';

class GetBatchesUseCase {
  final BatchRepository repository;

  GetBatchesUseCase(this.repository);

  Future<Either<Failure, PaginatedResponse<BatchEntity>>> call({
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    return await repository.getBatches(page: page, limit: limit, search: search);
  }
}

