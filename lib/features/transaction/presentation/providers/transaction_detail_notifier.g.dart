// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(transactionDetail)
const transactionDetailProvider = TransactionDetailFamily._();

final class TransactionDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<Transaction>,
          Transaction,
          FutureOr<Transaction>
        >
    with $FutureModifier<Transaction>, $FutureProvider<Transaction> {
  const TransactionDetailProvider._({
    required TransactionDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'transactionDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$transactionDetailHash();

  @override
  String toString() {
    return r'transactionDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Transaction> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Transaction> create(Ref ref) {
    final argument = this.argument as int;
    return transactionDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$transactionDetailHash() => r'4f2fd76b32784cb12c09eb9e81c3196986c442e8';

final class TransactionDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Transaction>, int> {
  const TransactionDetailFamily._()
    : super(
        retry: null,
        name: r'transactionDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TransactionDetailProvider call(int id) =>
      TransactionDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'transactionDetailProvider';
}
