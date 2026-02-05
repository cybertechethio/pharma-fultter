import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/dashboard_model.dart';

abstract class DashboardRemoteDataSource {
  Future<Either<Failure, DashboardModel>> getDashboard({
    required DateTime startDate,
    required DateTime endDate,
  });
}

