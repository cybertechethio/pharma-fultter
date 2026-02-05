import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'stock_loading_providers.g.dart';

@riverpod
class StockUpdateLoading extends _$StockUpdateLoading {
  @override
  Set<int> build() => {};

  void start(int id) {
    state = {...state, id};
  }

  void stop(int id) {
    state = state.where((e) => e != id).toSet();
  }

  bool isLoading(int id) => state.contains(id);
}

