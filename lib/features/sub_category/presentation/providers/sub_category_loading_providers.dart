import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sub_category_loading_providers.g.dart';

@riverpod
class SubCategoryCreateLoading extends _$SubCategoryCreateLoading {
  @override
  bool build() => false;
  void setLoading(bool value) => state = value;
}

@riverpod
class SubCategoryUpdateLoading extends _$SubCategoryUpdateLoading {
  @override
  Set<String> build() => <String>{};
  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
  bool isLoading(String id) => state.contains(id);
}

@riverpod
class SubCategoryDeleteLoading extends _$SubCategoryDeleteLoading {
  @override
  Set<String> build() => <String>{};
  void start(String id) => state = {...state, id};
  void stop(String id) => state = state.where((e) => e != id).toSet();
  bool isLoading(String id) => state.contains(id);
}

