// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubCategoryNotifier)
const subCategoryProvider = SubCategoryNotifierFamily._();

final class SubCategoryNotifierProvider
    extends $AsyncNotifierProvider<SubCategoryNotifier, List<SubCategory>> {
  const SubCategoryNotifierProvider._({
    required SubCategoryNotifierFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'subCategoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$subCategoryNotifierHash();

  @override
  String toString() {
    return r'subCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SubCategoryNotifier create() => SubCategoryNotifier();

  @override
  bool operator ==(Object other) {
    return other is SubCategoryNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$subCategoryNotifierHash() =>
    r'1345032dae3641863d52f95ded67b7888c3a7816';

final class SubCategoryNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          SubCategoryNotifier,
          AsyncValue<List<SubCategory>>,
          List<SubCategory>,
          FutureOr<List<SubCategory>>,
          String?
        > {
  const SubCategoryNotifierFamily._()
    : super(
        retry: null,
        name: r'subCategoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SubCategoryNotifierProvider call(String? categoryId) =>
      SubCategoryNotifierProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'subCategoryProvider';
}

abstract class _$SubCategoryNotifier extends $AsyncNotifier<List<SubCategory>> {
  late final _$args = ref.$arg as String?;
  String? get categoryId => _$args;

  FutureOr<List<SubCategory>> build(String? categoryId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<SubCategory>>, List<SubCategory>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<SubCategory>>, List<SubCategory>>,
              AsyncValue<List<SubCategory>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
