import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/bank.dart';
import '../repositories/bank_repository.dart';

class DeleteBankUseCase {
  final BankRepository repository;

  DeleteBankUseCase(this.repository);

  Future<Either<Failure, BankEntity>> call({required int id}) async {
    return await repository.deleteBank(id: id);
  }
}

