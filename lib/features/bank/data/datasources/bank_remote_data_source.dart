import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/bank_model.dart';

abstract class BankRemoteDataSource {
  Future<Either<Failure, List<BankModel>>> getBanks({
    String? search,
  });
  Future<Either<Failure, BankModel>> createBank({
    required String name,
  });
  Future<Either<Failure, BankModel>> updateBank({
    required int id,
    required String name,
  });
  Future<Either<Failure, BankModel>> deleteBank({required int id});
}

