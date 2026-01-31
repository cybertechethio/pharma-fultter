import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/supplier_customer.dart';
import 'supplier_customer_providers.dart';
import 'supplier_customer_events.dart';
import 'supplier_customer_loading_providers.dart';

part 'supplier_customer_notifier.g.dart';

@riverpod
class SupplierCustomerNotifier extends _$SupplierCustomerNotifier {
  @override
  Future<List<SupplierCustomer>> build(SupplierCustomerType type) async {
    return await _load(type);
  }

  // Search query state
  String? _currentSearch;

  Future<void> load(SupplierCustomerType type) async {
    _currentSearch = null; // Reset search when manually loading
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(type));
  }

  /// Search supplier/customers
  Future<void> search(SupplierCustomerType type, String query) async {
    _currentSearch = query.trim().isEmpty ? null : query.trim();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(type, search: _currentSearch));
  }

  Future<void> create({
    required SupplierCustomerType type,
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
  }) async {
    final createLoading = ref.read(supplierCustomerCreateLoadingProvider(type).notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createSupplierCustomerUseCaseProvider);
    final result = await useCase.call(
      name: name,
      phone: phone,
      accountCode: accountCode,
      tinNumber: tinNumber,
      type: type,
    );

    result.fold(
      (failure) {
        ref.read(supplierCustomerUiEventsProvider(type).notifier)
          .emit(SupplierCustomerFailure(failure));
      },
      (created) {
        final current = state.value ?? const <SupplierCustomer>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(supplierCustomerUiEventsProvider(type).notifier).emit(
          SupplierCustomerCreated(created, _successMsg(type, 'created')),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateSupplierCustomer({
    required SupplierCustomerType type,
    required String id,
    required String name,
    required String phone,
    required String accountCode,
    required String tinNumber,
    required SupplierCustomerType newType,
  }) async {
    final updating = ref.read(supplierCustomerUpdateLoadingProvider(type).notifier);
    updating.start(id);
    final useCase = ref.read(updateSupplierCustomerUseCaseProvider);
    final result = await useCase.call(
      id: id,
      name: name,
      phone: phone,
      accountCode: accountCode,
      tinNumber: tinNumber,
      type: newType,
    );

    result.fold(
      (failure) {
        ref.read(supplierCustomerUiEventsProvider(type).notifier)
          .emit(SupplierCustomerFailure(failure));
      },
      (updated) {
        final list = List<SupplierCustomer>.from(state.value ?? const <SupplierCustomer>[]);
        if (type != updated.type) {
          list.removeWhere((e) => e.id == id);
        } else {
          final idx = list.indexWhere((e) => e.id == id);
          if (idx != -1) list[idx] = updated;
        }
        state = AsyncValue.data(list);
        ref.read(supplierCustomerUiEventsProvider(type).notifier).emit(
          SupplierCustomerUpdated(updated, _successMsg(updated.type, 'updated')),
        );
      },
    );

    updating.stop(id);
  }

  Future<void> delete({
    required SupplierCustomerType type,
    required String id,
  }) async {
    final deleting = ref.read(supplierCustomerDeleteLoadingProvider(type).notifier);
    deleting.start(id);

    //add delay for testing
    await Future.delayed(const Duration(seconds: 12));

    final useCase = ref.read(deleteSupplierCustomerUseCaseProvider);
    final result = await useCase.call(id: id);

    result.fold(
      (failure) {
        ref.read(supplierCustomerUiEventsProvider(type).notifier)
          .emit(SupplierCustomerFailure(failure));
      },
      (deletedEntity) {
        final list = List<SupplierCustomer>.from(state.value ?? const <SupplierCustomer>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);
        ref.read(supplierCustomerUiEventsProvider(type).notifier).emit(
          SupplierCustomerDeleted(id, _successMsg(type, 'deleted')),
        );
      },
    );

    deleting.stop(id);
  }

  Future<List<SupplierCustomer>> _load(
    SupplierCustomerType type, {
    String? search,
  }) async {
    final useCase = ref.read(getSupplierCustomersUseCaseProvider);
    final result = await useCase.call(search: search, type: type);
    return result.fold(
      (failure) {
        throw failure;
      },
      (items) => items,
    );
  }

  String _successMsg(SupplierCustomerType type, String verb) {
    final who = type == SupplierCustomerType.customer ? 'Customer' : 'Supplier';
    return '$who $verb successfully';
  }
}


