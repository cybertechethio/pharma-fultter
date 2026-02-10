import 'package:dartz/dartz.dart';
import '../../../../core/enums/transfer_status_enum.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../../data/models/create_transfer_request.dart';
import '../entities/transfer.dart';

abstract class TransferRepository {
  Future<Either<Failure, PaginatedResponse<Transfer>>> getTransfers({
    int page = 1,
    int limit = 25,
  });
  
  Future<Either<Failure, Transfer>> getTransferDetail(int id);
  
  Future<Either<Failure, Transfer>> createTransfer({
    required CreateTransferRequest data,
  });
  
  Future<Either<Failure, Transfer>> updateStatus({
    required int id,
    required TransferStatus status,
  });
}

