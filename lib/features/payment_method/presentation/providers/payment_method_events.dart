import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../transaction/domain/entities/payment_method.dart';
import '../../../../core/errors/failure.dart';

part 'payment_method_events.g.dart';

sealed class PaymentMethodUiEvent {}

class PaymentMethodCreated extends PaymentMethodUiEvent {
  final List<PaymentMethod> entities;
  final String message;
  PaymentMethodCreated(this.entities, this.message);
}

class PaymentMethodUpdated extends PaymentMethodUiEvent {
  final PaymentMethod entity;
  final String message;
  PaymentMethodUpdated(this.entity, this.message);
}

class PaymentMethodDeleted extends PaymentMethodUiEvent {
  final int id;
  final String message;
  PaymentMethodDeleted(this.id, this.message);
}

class PaymentMethodFailure extends PaymentMethodUiEvent {
  final Failure failure;
  PaymentMethodFailure(this.failure);
}

@Riverpod(keepAlive: true)
class PaymentMethodUiEvents extends _$PaymentMethodUiEvents {
  @override
  PaymentMethodUiEvent? build() {
    return null;
  }

  void emit(PaymentMethodUiEvent event) {
    state = event;
  }

  void clear() {
    state = null;
  }
}

