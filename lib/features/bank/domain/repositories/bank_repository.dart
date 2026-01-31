import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/bank.dart';

abstract class BankRepository {
  Future<Either<Failure, List<BankEntity>>> getBanks({
    String? search,
  });
  Future<Either<Failure, BankEntity>> createBank({
    required String name,
  });
  Future<Either<Failure, BankEntity>> updateBank({
    required int id,
    required String name,
  });
  Future<Either<Failure, BankEntity>> deleteBank({required int id});
}

