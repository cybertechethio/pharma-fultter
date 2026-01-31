import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_loading_providers.g.dart';

@Riverpod(keepAlive: true)
class CategoryCreateLoading extends _$CategoryCreateLoading {
  @override
  bool build() => false;
  void setLoading(bool value) => state = value;
}

@Riverpod(keepAlive: true)
class CategoryUpdateLoading extends _$CategoryUpdateLoading {
  @override
  Set<String> build() => <String>{};
  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
  bool isLoading(String id) => state.contains(id);
}

@Riverpod(keepAlive: true)
class CategoryDeleteLoading extends _$CategoryDeleteLoading {
  @override
  Set<String> build() => <String>{};
  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
  bool isLoading(String id) => state.contains(id);
}

