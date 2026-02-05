import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../data/models/batch_consolidation_request_model.dart';
import '../../data/models/batch_split_request_model.dart';
import '../../data/models/batch_transfer_request_model.dart';
import '../entities/batch.dart';
import '../entities/batch_input.dart';

abstract class BatchRepository {
  Future<Either<Failure, List<BatchEntity>>> getBatchesByItemId(int itemId);

  Future<Either<Failure, PaginatedResponse<BatchEntity>>> getBatches({
    int page = 1,
    int limit = 25,
    String? search,
  });

  Future<Either<Failure, BatchEntity>> createBatch(BatchInput input);

  Future<Either<Failure, BatchEntity>> updateBatch(int id, BatchInput input);

  Future<Either<Failure, void>> transfer(BatchTransferRequestModel request);

  Future<Either<Failure, void>> consolidation(
    BatchConsolidationRequestModel request,
  );

  Future<Either<Failure, void>> split(BatchSplitRequestModel request);
}

