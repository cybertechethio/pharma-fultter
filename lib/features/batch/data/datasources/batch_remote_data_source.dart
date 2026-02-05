import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/batch_consolidation_request_model.dart';
import '../models/batch_model.dart';
import '../models/batch_request_model.dart';
import '../models/batch_split_request_model.dart';
import '../models/batch_transfer_request_model.dart';

abstract class BatchRemoteDataSource {
  Future<Either<Failure, List<BatchModel>>> getBatchesByItemId(int itemId);

  Future<Either<Failure, PaginatedResponse<BatchModel>>> getBatches({
    int page = 1,
    int limit = 25,
    String? search,
  });

  Future<Either<Failure, BatchModel>> createBatch(BatchRequestModel request);

  Future<Either<Failure, BatchModel>> updateBatch(int id, BatchRequestModel request);

  Future<Either<Failure, void>> transfer(BatchTransferRequestModel request);

  Future<Either<Failure, void>> consolidation(
    BatchConsolidationRequestModel request,
  );

  Future<Either<Failure, void>> split(BatchSplitRequestModel request);
}

