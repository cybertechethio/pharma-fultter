import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/transfer.dart';
import '../repositories/transfer_repository.dart';

class GetTransfersUseCase {
  final TransferRepository repository;

  GetTransfersUseCase(this.repository);

  Future<Either<Failure, PaginatedResponse<Transfer>>> call({
    int page = 1,
    int limit = 25,
  }) async {
    return await repository.getTransfers(page: page, limit: limit);
  }
}

