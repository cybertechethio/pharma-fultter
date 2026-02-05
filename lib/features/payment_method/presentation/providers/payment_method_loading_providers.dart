import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_method_loading_providers.g.dart';

@Riverpod(keepAlive: true)
class PaymentMethodCreateLoading extends _$PaymentMethodCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) {
    state = value;
  }
}

@Riverpod(keepAlive: true)
class PaymentMethodUpdateLoading extends _$PaymentMethodUpdateLoading {
  @override
  Set<int> build() => {};

  void start(int id) {
    state = {...state, id};
  }

  void stop(int id) {
    state = state.where((e) => e != id).toSet();
  }
}

@Riverpod(keepAlive: true)
class PaymentMethodDeleteLoading extends _$PaymentMethodDeleteLoading {
  @override
  Set<int> build() => {};

  void start(int id) {
    state = {...state, id};
  }

  void stop(int id) {
    state = state.where((e) => e != id).toSet();
  }
}

