import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/bank.dart';
import '../repositories/bank_repository.dart';

class UpdateBankUseCase {
  final BankRepository repository;

  UpdateBankUseCase(this.repository);

  Future<Either<Failure, BankEntity>> call({
    required int id,
    required String name,
  }) async {
    // Validation: Name must not be empty
    if (name.trim().isEmpty) {
      return Left(Failure.validationError('Bank name is required'));
    }

    return await repository.updateBank(
      id: id,
      name: name.trim(),
    );
  }
}

