import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/transfer_model.dart';
import '../models/transfer_response_model.dart';

abstract class TransferRemoteDataSource {
  /// Get all transfers with pagination
  Future<Either<Failure, List<TransferResponseModel>>> getTransfers({
    int page,
    int limit,
  });

  /// Get transfer detail by ID
  Future<Either<Failure, TransferResponseModel>> getTransferDetail(int id);

  /// Create a new transfer
  Future<Either<Failure, TransferResponseModel>> createTransfer({
    required TransferModel request,
  });
}













