import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart';
import '../models/expense_model.dart';
import '../models/expense_detail_model.dart';

abstract class ExpenseRemoteDataSource {
  Future<Either<Failure, ExpenseModel>> create({
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentFilePaths,
    required List<Map<String, dynamic>> paymentMethods,
  });

  Future<Either<Failure, PaginatedResponse<ExpenseModel>>> getAll({
    int page = 1,
    int limit = 25,
    DateTime? fromDate,
    DateTime? toDate,
    String? search,
    int? branchId,
  });

  Future<Either<Failure, ExpenseDetailModel>> getById({
    required String id,
  });

  Future<Either<Failure, ExpenseModel>> update({
    required String id,
    required DateTime expenseDate,
    required String name,
    required String? notes,
    required List<String>? attachmentUrls,
    required List<String>? attachmentFilePaths,
  });

  Future<Either<Failure, ExpenseModel>> delete({
    required String id,
  });

  Future<Either<Failure, Unit>> createPaymentMethod({
    required String expenseId,
    required String method,
    required String amount,
    String? referenceNumber,
    int? bankId,
    String? attachment,
  });

  Future<Either<Failure, Unit>> updatePaymentMethod({
    required String expenseId,
    required String paymentMethodId,
    String? method,
    String? amount,
    String? referenceNumber,
    int? bankId,
    String? attachment,
  });

  Future<Either<Failure, Unit>> deletePaymentMethod({
    required String expenseId,
    required String paymentMethodId,
  });
}
