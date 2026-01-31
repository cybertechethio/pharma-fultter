// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CategoryUiEvents)
const categoryUiEventsProvider = CategoryUiEventsProvider._();

final class CategoryUiEventsProvider
    extends $NotifierProvider<CategoryUiEvents, CategoryUiEvent?> {
  const CategoryUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryUiEventsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryUiEventsHash();

  @$internal
  @override
  CategoryUiEvents create() => CategoryUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryUiEvent?>(value),
    );
  }
}

String _$categoryUiEventsHash() => r'fadb8ba12fdb70af7177281487f1aac8493c7afa';

abstract class _$CategoryUiEvents extends $Notifier<CategoryUiEvent?> {
  CategoryUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CategoryUiEvent?, CategoryUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CategoryUiEvent?, CategoryUiEvent?>,
              CategoryUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
