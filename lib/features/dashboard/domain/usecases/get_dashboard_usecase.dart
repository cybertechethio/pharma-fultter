import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/dashboard.dart';
import '../repositories/dashboard_repository.dart';

class GetDashboardUseCase {
  final DashboardRepository repository;

  GetDashboardUseCase(this.repository);

  Future<Either<Failure, Dashboard>> call({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    return await repository.getDashboard(
      startDate: startDate,
      endDate: endDate,
    );
  }
}

