import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/category.dart';
import 'category_notifier.dart';

part 'category_filter_provider.g.dart';

/// Filter provider for category dropdowns
/// 
/// This provider always returns a [List<Category>] (never AsyncValue).
/// On error or while loading, it returns an empty list.
/// This makes it perfect for dropdowns that should display either
/// a list of categories or be empty, without showing loading/error states.
/// 
/// Usage:
/// ```dart
/// final categories = ref.watch(categoryFilterProvider);
/// // categories is always List<Category> (empty if loading/error)
/// ```
@riverpod
List<Category> categoryFilter(Ref ref) {
  final categoriesAsync = ref.watch(categoryProvider);
  
  return categoriesAsync.when(
    data: (categories) => categories,
    loading: () => const <Category>[],
    error: (_, __) => const <Category>[],
  );
}

