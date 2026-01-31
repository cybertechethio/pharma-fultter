import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_loading_providers.g.dart';

@riverpod
class ItemCreateLoading extends _$ItemCreateLoading {
  @override
  bool build() => false;
  void setLoading(bool value) => state = value;
}

@riverpod
class ItemUpdateLoading extends _$ItemUpdateLoading {
  @override
  Set<String> build() => <String>{};
  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
  bool isLoading(String id) => state.contains(id);
}

@riverpod
class ItemDeleteLoading extends _$ItemDeleteLoading {
  @override
  Set<String> build() => <String>{};
  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
  bool isLoading(String id) => state.contains(id);
}

