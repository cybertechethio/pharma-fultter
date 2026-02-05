import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/dashboard.dart';

abstract class DashboardRepository {
  Future<Either<Failure, Dashboard>> getDashboard({
    required DateTime startDate,
    required DateTime endDate,
  });
}

