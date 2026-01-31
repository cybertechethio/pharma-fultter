// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(categoryFilter)
const categoryFilterProvider = CategoryFilterProvider._();

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

final class CategoryFilterProvider
    extends $FunctionalProvider<List<Category>, List<Category>, List<Category>>
    with $Provider<List<Category>> {
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
  const CategoryFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryFilterHash();

  @$internal
  @override
  $ProviderElement<List<Category>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Category> create(Ref ref) {
    return categoryFilter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Category> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Category>>(value),
    );
  }
}

String _$categoryFilterHash() => r'd8c4bfa7402db364a010deacf0f842537d870856';
