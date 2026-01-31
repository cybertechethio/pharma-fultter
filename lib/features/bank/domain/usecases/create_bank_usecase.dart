import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/bank.dart';
import '../repositories/bank_repository.dart';

class CreateBankUseCase {
  final BankRepository repository;

  CreateBankUseCase(this.repository);

  Future<Either<Failure, BankEntity>> call({
    required String name,
  }) async {
    // Validation: Name must not be empty
    if (name.trim().isEmpty) {
      return Left(Failure.validationError('Bank name is required'));
    }

    return await repository.createBank(
      name: name.trim(),
    );
  }
}

