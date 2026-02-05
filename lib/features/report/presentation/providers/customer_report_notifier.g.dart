// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_report_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CustomerReportNotifier)
const customerReportProvider = CustomerReportNotifierProvider._();

final class CustomerReportNotifierProvider
    extends
        $AsyncNotifierProvider<CustomerReportNotifier, List<CustomerItemData>> {
  const CustomerReportNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customerReportProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customerReportNotifierHash();

  @$internal
  @override
  CustomerReportNotifier create() => CustomerReportNotifier();
}

String _$customerReportNotifierHash() =>
    r'e170d16a54f7cd5cb7e8c10b03bdb1595c4bc6ee';

abstract class _$CustomerReportNotifier
    extends $AsyncNotifier<List<CustomerItemData>> {
  FutureOr<List<CustomerItemData>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<CustomerItemData>>, List<CustomerItemData>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<CustomerItemData>>,
                List<CustomerItemData>
              >,
              AsyncValue<List<CustomerItemData>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
