import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/expense_detail.dart';
import 'expense_providers.dart';

part 'expense_detail_provider.g.dart';

@Riverpod(keepAlive: true)
Future<ExpenseDetail> expenseDetail(Ref ref, String expenseId) async {
  final useCase = ref.read(getExpenseByIdUseCaseProvider);
  final result = await useCase.call(id: expenseId);

  return result.fold(
    (failure) {
      // Emit error through state
      throw failure;
    },
    (detail) => detail,
  );
}
