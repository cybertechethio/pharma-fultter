import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/stock_model.dart';

abstract class StockRemoteDataSource {
  Future<Either<Failure, PaginatedResponse<StockModel>>> getStocks({
    int page = 1,
    int limit = 25,
    String? search,
  });
}

