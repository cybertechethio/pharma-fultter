import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../entities/stock.dart';
import '../repositories/stock_repository.dart';

class GetStocksUseCase {
  final StockRepository repository;

  GetStocksUseCase(this.repository);

  Future<Either<Failure, PaginatedResponse<Stock>>> call({
    int page = 1,
    int limit = 25,
    String? search,
  }) async {
    return await repository.getStocks(page: page, limit: limit, search: search);
  }
}

