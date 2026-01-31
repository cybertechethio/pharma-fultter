import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/transfer.dart';
import '../entities/transfer_data.dart';

abstract class TransferRepository {
  /// Get all transfers with pagination
  Future<Either<Failure, PaginatedResponse<Transfer>>> getTransfers({
    int page = 1,
    int limit = 25,
  });

  /// Get transfer detail by ID
  Future<Either<Failure, Transfer>> getTransferDetail(int id);

  /// Create a new transfer (always transfer_out)
  Future<Either<Failure, Transfer>> createTransfer({
    required TransferData data,
  });
}













