import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_loading_providers.g.dart';

@riverpod
class ExpenseCreateLoading extends _$ExpenseCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) => state = value;
}

@riverpod
class ExpenseUpdateLoading extends _$ExpenseUpdateLoading {
  @override
  Set<String> build() => <String>{};

  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
}

@riverpod
class ExpenseDeleteLoading extends _$ExpenseDeleteLoading {
  @override
  Set<String> build() => <String>{};

  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
}

@riverpod
class ExpensePaymentMethodUpdateLoading extends _$ExpensePaymentMethodUpdateLoading {
  @override
  Set<String> build() => <String>{};

  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
}

@riverpod
class ExpensePaymentMethodDeleteLoading extends _$ExpensePaymentMethodDeleteLoading {
  @override
  Set<String> build() => <String>{};

  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
}
