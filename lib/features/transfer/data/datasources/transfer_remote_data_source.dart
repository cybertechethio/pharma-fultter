import 'package:dartz/dartz.dart';
import '../../../../core/enums/transfer_status_enum.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/create_transfer_request.dart';
import '../models/transfer_model.dart';

abstract class TransferRemoteDataSource {
  Future<Either<Failure, PaginatedResponse<TransferModel>>> getTransfers({
    int page = 1,
    int limit = 25,
  });
  
  Future<Either<Failure, TransferModel>> getTransferDetail(int id);
  
  Future<Either<Failure, TransferModel>> createTransfer({
    required CreateTransferRequest request,
  });
  
  Future<Either<Failure, TransferModel>> updateStatus({
    required int id,
    required TransferStatus status,
  });
}

