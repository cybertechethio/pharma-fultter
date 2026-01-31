import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/batch.dart';

abstract class BatchRepository {
  Future<Either<Failure, PaginatedResponse<BatchEntity>>> getBatches({
    int page = 1,
    int limit = 25,
    String? search,
  });
  
  Future<Either<Failure, BatchEntity>> createBatch({
    required int itemId,
    required String batchName,
  });
  
  Future<Either<Failure, BatchEntity>> updateBatch({
    required int id,
    required String batchName,
  });
}

