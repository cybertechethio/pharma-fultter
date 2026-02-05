import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/unit.dart';
import 'unit_providers.dart';
import 'unit_events.dart';
import 'unit_loading_providers.dart';

part 'unit_notifier.g.dart';

@Riverpod(keepAlive: true)
class UnitNotifier extends _$UnitNotifier {
  @override
  Future<List<UnitEntity>> build() async {
    return await _load();
  }

  // Search query state
  String? _currentSearch;

  Future<void> load() async {
    _currentSearch = null; // Reset search when manually loading
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }

  /// Search units
  Future<void> search(String query) async {
    _currentSearch = query.trim().isEmpty ? null : query.trim();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(search: _currentSearch));
  }

  Future<void> create({
    required String name,
    required String description,
  }) async {
    final createLoading = ref.read(unitCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createUnitUseCaseProvider);
    final result = await useCase.call(
      name: name,
      description: description,
    );

    result.fold(
      (failure) {
        ref.read(unitUiEventsProvider.notifier).emit(UnitFailure(failure));
      },
      (created) {
        final current = state.value ?? const <UnitEntity>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(unitUiEventsProvider.notifier).emit(
          UnitCreated(created, 'Unit created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateUnit({
    required String id,
    required String name,
    required String description,
  }) async {
    final updating = ref.read(unitUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateUnitUseCaseProvider);
    final result = await useCase.call(
      id: id,
      name: name,
      description: description,
    );

    result.fold(
      (failure) {
        ref.read(unitUiEventsProvider.notifier).emit(UnitFailure(failure));
      },
      (updated) {
        final list = List<UnitEntity>.from(state.value ?? const <UnitEntity>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);
        ref.read(unitUiEventsProvider.notifier).emit(
          UnitUpdated(updated, 'Unit updated successfully'),
        );
      },
    );

    updating.stop(id);
  }

  Future<void> delete({
    required String id,
  }) async {
    final deleting = ref.read(unitDeleteLoadingProvider.notifier);
    deleting.start(id);

    final useCase = ref.read(deleteUnitUseCaseProvider);
    final result = await useCase.call(id: id);

    result.fold(
      (failure) {
        ref.read(unitUiEventsProvider.notifier).emit(UnitFailure(failure));
      },
      (deletedEntity) {
        final list = List<UnitEntity>.from(state.value ?? const <UnitEntity>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);
        ref.read(unitUiEventsProvider.notifier).emit(
          UnitDeleted(id, 'Unit deleted successfully'),
        );
      },
    );

    deleting.stop(id);
  }

  Future<List<UnitEntity>> _load({String? search}) async {
    final useCase = ref.read(getUnitsUseCaseProvider);
    final result = await useCase.call(search: search);
    return result.fold(
      (failure) {
        throw failure;
      },
      (items) => items,
    );
  }
}

