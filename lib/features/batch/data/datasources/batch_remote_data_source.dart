import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/batch_model.dart';

abstract class BatchRemoteDataSource {
  Future<Either<Failure, PaginatedResponse<BatchModel>>> getBatches({
    int page = 1,
    int limit = 25,
    String? search,
  });
  
  Future<Either<Failure, BatchModel>> createBatch({
    required int itemId,
    required String batchName,
  });
  
  Future<Either<Failure, BatchModel>> updateBatch({
    required int id,
    required String batchName,
  });
}

