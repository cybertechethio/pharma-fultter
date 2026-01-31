import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/stock.dart';

abstract class StockRepository {
  Future<Either<Failure, PaginatedResponse<Stock>>> getStocks({
    int page = 1,
    int limit = 25,
    String? search,
  });
}

