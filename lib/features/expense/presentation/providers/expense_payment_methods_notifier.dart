import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'expense_providers.dart';
import 'expense_events.dart';
import 'expense_loading_providers.dart';

part 'expense_payment_methods_notifier.g.dart';

@Riverpod(keepAlive: true)
class ExpensePaymentMethodsNotifier extends _$ExpensePaymentMethodsNotifier {
  @override
  void build() {
    // No state needed for this notifier
  }

/// Create expense payment method
Future<void> createPaymentMethod({
  required String expenseId,
  required String method,
  required String amount,
  String? referenceNumber,
  int? bankId,
}) async {
  final createLoading = ref.read(expensePaymentMethodUpdateLoadingProvider.notifier);
  createLoading.start('creating'); // Use a temporary ID for loading state

  final useCase = ref.read(createExpensePaymentMethodUseCaseProvider);
  final result = await useCase.call(
    expenseId: expenseId,
    method: method,
    amount: amount,
    referenceNumber: referenceNumber,
    bankId: bankId,
  );

  result.fold(
    (failure) {
      ref.read(expenseUiEventsProvider.notifier).emit(ExpenseFailure(failure));
    },
    (_) {
      ref.read(expenseUiEventsProvider.notifier).emit(
        ExpensePaymentMethodUpdated('created', 'Payment method created successfully'),
      );
      // Event system will handle UI refresh, no need to invalidate here
    },
  );

  createLoading.stop('creating');
}

/// Update expense payment method
  Future<void> updatePaymentMethod({
    required String expenseId,
    required String paymentMethodId,
    String? method,
    String? amount,
    String? referenceNumber,
    int? bankId,
  }) async {
    final updating = ref.read(expensePaymentMethodUpdateLoadingProvider.notifier);
    updating.start(paymentMethodId);

    final useCase = ref.read(updateExpensePaymentMethodUseCaseProvider);
    final result = await useCase.call(
      expenseId: expenseId,
      paymentMethodId: paymentMethodId,
      method: method,
      amount: amount,
      referenceNumber: referenceNumber,
      bankId: bankId,
    );

    result.fold(
      (failure) {
        ref.read(expenseUiEventsProvider.notifier).emit(ExpenseFailure(failure));
      },
      (_) {
        ref.read(expenseUiEventsProvider.notifier).emit(
          ExpensePaymentMethodUpdated(paymentMethodId, 'Payment method updated successfully'),
        );
        // Event system will handle UI refresh, no need to invalidate here
      },
    );

    updating.stop(paymentMethodId);
  }

  /// Delete expense payment method
  Future<void> deletePaymentMethod({
    required String expenseId,
    required String paymentMethodId,
  }) async {
    final deleting = ref.read(expensePaymentMethodDeleteLoadingProvider.notifier);
    deleting.start(paymentMethodId);

    final useCase = ref.read(deleteExpensePaymentMethodUseCaseProvider);
    final result = await useCase.call(
      expenseId: expenseId,
      paymentMethodId: paymentMethodId,
    );

    result.fold(
      (failure) {
        ref.read(expenseUiEventsProvider.notifier).emit(ExpenseFailure(failure));
      },
      (deletedMethod) {
        ref.read(expenseUiEventsProvider.notifier).emit(
          ExpensePaymentMethodDeleted(paymentMethodId, 'Payment method deleted successfully'),
        );
        // Event system will handle UI refresh, no need to invalidate here
      },
    );

    deleting.stop(paymentMethodId);
  }
}
