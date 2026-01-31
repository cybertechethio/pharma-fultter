// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_events.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubCategoryUiEvents)
const subCategoryUiEventsProvider = SubCategoryUiEventsProvider._();

final class SubCategoryUiEventsProvider
    extends $NotifierProvider<SubCategoryUiEvents, SubCategoryUiEvent?> {
  const SubCategoryUiEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'subCategoryUiEventsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$subCategoryUiEventsHash();

  @$internal
  @override
  SubCategoryUiEvents create() => SubCategoryUiEvents();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubCategoryUiEvent? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubCategoryUiEvent?>(value),
    );
  }
}

String _$subCategoryUiEventsHash() =>
    r'2b031bef78f7ae7cbe0ce801066fdafca49f3f14';

abstract class _$SubCategoryUiEvents extends $Notifier<SubCategoryUiEvent?> {
  SubCategoryUiEvent? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SubCategoryUiEvent?, SubCategoryUiEvent?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SubCategoryUiEvent?, SubCategoryUiEvent?>,
              SubCategoryUiEvent?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
