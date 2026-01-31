// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(transferDetail)
const transferDetailProvider = TransferDetailFamily._();

final class TransferDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<Transfer?>,
          Transfer?,
          FutureOr<Transfer?>
        >
    with $FutureModifier<Transfer?>, $FutureProvider<Transfer?> {
  const TransferDetailProvider._({
    required TransferDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'transferDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$transferDetailHash();

  @override
  String toString() {
    return r'transferDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Transfer?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Transfer?> create(Ref ref) {
    final argument = this.argument as int;
    return transferDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TransferDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transferDetailHash() => r'3899b18dd4be6bd235afafe98e77be2ca715c64d';

final class TransferDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Transfer?>, int> {
  const TransferDetailFamily._()
    : super(
        retry: null,
        name: r'transferDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TransferDetailProvider call(int transferId) =>
      TransferDetailProvider._(argument: transferId, from: this);

  @override
  String toString() => r'transferDetailProvider';
}
