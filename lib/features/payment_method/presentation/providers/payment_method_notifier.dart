import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/payment_method_request.dart';
import 'payment_method_providers.dart';
import 'payment_method_events.dart';
import 'payment_method_loading_providers.dart';

part 'payment_method_notifier.g.dart';

/// Notifier for managing payment methods for a specific payment
/// Note: Payment methods are scoped to a paymentId
@riverpod
class PaymentMethodNotifier extends _$PaymentMethodNotifier {
  @override
  Future<void> build() async {
    // Note: API doesn't provide GET endpoint for payment methods
    // They are typically loaded as part of payment/transaction detail
    // This notifier is for managing (create/update/delete) payment methods only
  }

  Future<void> create({
    required int paymentId,
    required PaymentMethodRequest request,
    String? attachmentFilePath,
  }) async {
    // Store references before async gap
    final createLoading = ref.read(paymentMethodCreateLoadingProvider.notifier);
    final eventsNotifier = ref.read(paymentMethodUiEventsProvider.notifier);
    final useCase = ref.read(createPaymentMethodUseCaseProvider);
    
    createLoading.setLoading(true);

    final result = await useCase.call(
      paymentId: paymentId,
      request: request,
      attachmentFilePath: attachmentFilePath,
    );


    result.fold(
      (failure) {
        eventsNotifier.emit(PaymentMethodFailure(failure));
      },
      (created) {
        eventsNotifier.emit(
          PaymentMethodCreated(created, 'Payment method created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updatePaymentMethod({
    required int paymentId,
    required int methodId,
    required PaymentMethodRequest request,
    String? attachmentFilePath,
  }) async {
    // Store references before async gap
    final updating = ref.read(paymentMethodUpdateLoadingProvider.notifier);
    final eventsNotifier = ref.read(paymentMethodUiEventsProvider.notifier);
    final useCase = ref.read(updatePaymentMethodUseCaseProvider);
    
    updating.start(methodId);

    final result = await useCase.call(
      paymentId: paymentId,
      methodId: methodId,
      request: request,
      attachmentFilePath: attachmentFilePath,
    );

    

    result.fold(
      (failure) {
        eventsNotifier.emit(PaymentMethodFailure(failure));
      },
      (updated) {
        eventsNotifier.emit(
          PaymentMethodUpdated(updated, 'Payment method updated successfully'),
        );
      },
    );

    updating.stop(methodId);
  }

  Future<void> delete({
    required int paymentId,
    required int methodId,
  }) async {
    // Store references before async gap
    final deleting = ref.read(paymentMethodDeleteLoadingProvider.notifier);
    final eventsNotifier = ref.read(paymentMethodUiEventsProvider.notifier);
    final useCase = ref.read(deletePaymentMethodUseCaseProvider);
    
    deleting.start(methodId);

    final result = await useCase.call(
      paymentId: paymentId,
      methodId: methodId,
    );

  

    result.fold(
      (failure) {
        eventsNotifier.emit(PaymentMethodFailure(failure));
      },
      (_) {
        eventsNotifier.emit(
          PaymentMethodDeleted(methodId, 'Payment method deleted successfully'),
        );
      },
    );

    deleting.stop(methodId);
  }
}

