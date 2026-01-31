import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/bank.dart';
import 'bank_providers.dart';
import 'bank_events.dart';
import 'bank_loading_providers.dart';

part 'bank_notifier.g.dart';

@riverpod
class BankNotifier extends _$BankNotifier {
  @override
  Future<List<BankEntity>> build() async {
    return await _load();
  }

  // Search query state
  String? _currentSearch;

  Future<void> load() async {
    _currentSearch = null; // Reset search when manually loading
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }

  /// Search banks
  Future<void> search(String query) async {
    _currentSearch = query.trim().isEmpty ? null : query.trim();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(search: _currentSearch));
  }

  Future<void> create({
    required String name,
  }) async {
    final createLoading = ref.read(bankCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createBankUseCaseProvider);
    final result = await useCase.call(
      name: name,
    );

    result.fold(
      (failure) {
        ref.read(bankUiEventsProvider.notifier).emit(BankFailure(failure));
      },
      (created) {
        final current = state.value ?? const <BankEntity>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(bankUiEventsProvider.notifier).emit(
          BankCreated(created, 'Bank created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateBank({
    required int id,
    required String name,
  }) async {
    final updating = ref.read(bankUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateBankUseCaseProvider);
    final result = await useCase.call(
      id: id,
      name: name,
    );

    result.fold(
      (failure) {
        ref.read(bankUiEventsProvider.notifier).emit(BankFailure(failure));
      },
      (updated) {
        final list = List<BankEntity>.from(state.value ?? const <BankEntity>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);
        ref.read(bankUiEventsProvider.notifier).emit(
          BankUpdated(updated, 'Bank updated successfully'),
        );
      },
    );

    updating.stop(id);
  }

  Future<void> delete({
    required int id,
  }) async {
    final deleting = ref.read(bankDeleteLoadingProvider.notifier);
    deleting.start(id);

    final useCase = ref.read(deleteBankUseCaseProvider);
    final result = await useCase.call(id: id);

    result.fold(
      (failure) {
        ref.read(bankUiEventsProvider.notifier).emit(BankFailure(failure));
      },
      (deletedEntity) {
        final list = List<BankEntity>.from(state.value ?? const <BankEntity>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);
        ref.read(bankUiEventsProvider.notifier).emit(
          BankDeleted(id, 'Bank deleted successfully'),
        );
      },
    );

    deleting.stop(id);
  }

  Future<List<BankEntity>> _load({
    String? search,
  }) async {
    final useCase = ref.read(getBanksUseCaseProvider);
    final result = await useCase.call(search: search);
    return result.fold(
      (failure) {
        throw failure;
      },
      (items) => items,
    );
  }
}

