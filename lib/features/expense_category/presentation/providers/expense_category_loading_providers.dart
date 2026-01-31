import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_category_loading_providers.g.dart';

@Riverpod(keepAlive: true)
class ExpenseCategoryCreateLoading extends _$ExpenseCategoryCreateLoading {
  @override
  bool build() => false;

  void setLoading(bool value) => state = value;
}

@Riverpod(keepAlive: true)
class ExpenseCategoryUpdateLoading extends _$ExpenseCategoryUpdateLoading {
  @override
  Set<String> build() => <String>{};

  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
}

@Riverpod(keepAlive: true)
class ExpenseCategoryDeleteLoading extends _$ExpenseCategoryDeleteLoading {
  @override
  Set<String> build() => <String>{};

  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
}
