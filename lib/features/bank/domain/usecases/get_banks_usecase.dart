import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/bank.dart';
import '../repositories/bank_repository.dart';

class GetBanksUseCase {
  final BankRepository repository;

  GetBanksUseCase(this.repository);

  Future<Either<Failure, List<BankEntity>>> call({
    String? search,
  }) async {
    return await repository.getBanks(search: search);
  }
}

