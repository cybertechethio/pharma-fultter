// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_movements_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier for stock movements list with pagination support
/// Requires itemId to be passed as a family parameter

@ProviderFor(StockMovementsNotifier)
const stockMovementsProvider = StockMovementsNotifierFamily._();

/// Notifier for stock movements list with pagination support
/// Requires itemId to be passed as a family parameter
final class StockMovementsNotifierProvider
    extends
        $AsyncNotifierProvider<StockMovementsNotifier, List<StockMovement>> {
  /// Notifier for stock movements list with pagination support
  /// Requires itemId to be passed as a family parameter
  const StockMovementsNotifierProvider._({
    required StockMovementsNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'stockMovementsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$stockMovementsNotifierHash();

  @override
  String toString() {
    return r'stockMovementsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  StockMovementsNotifier create() => StockMovementsNotifier();

  @override
  bool operator ==(Object other) {
    return other is StockMovementsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$stockMovementsNotifierHash() =>
    r'27335a89dac3adf9af85591708e3f344a58c2427';

/// Notifier for stock movements list with pagination support
/// Requires itemId to be passed as a family parameter

final class StockMovementsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          StockMovementsNotifier,
          AsyncValue<List<StockMovement>>,
          List<StockMovement>,
          FutureOr<List<StockMovement>>,
          int
        > {
  const StockMovementsNotifierFamily._()
    : super(
        retry: null,
        name: r'stockMovementsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Notifier for stock movements list with pagination support
  /// Requires itemId to be passed as a family parameter

  StockMovementsNotifierProvider call(int itemId) =>
      StockMovementsNotifierProvider._(argument: itemId, from: this);

  @override
  String toString() => r'stockMovementsProvider';
}

/// Notifier for stock movements list with pagination support
/// Requires itemId to be passed as a family parameter

abstract class _$StockMovementsNotifier
    extends $AsyncNotifier<List<StockMovement>> {
  late final _$args = ref.$arg as int;
  int get itemId => _$args;

  FutureOr<List<StockMovement>> build(int itemId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<StockMovement>>, List<StockMovement>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<StockMovement>>, List<StockMovement>>,
              AsyncValue<List<StockMovement>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
