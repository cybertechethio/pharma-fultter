import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/brand.dart';
import 'brand_providers.dart';
import 'brand_events.dart';
import 'brand_loading_providers.dart';

part 'brand_notifier.g.dart';

@riverpod
class BrandNotifier extends _$BrandNotifier {
  @override
  Future<List<BrandEntity>> build() async {
    return await _load();
  }

  // Search query state
  String? _currentSearch;

  Future<void> load() async {
    _currentSearch = null; // Reset search when manually loading
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }

  /// Search brands
  Future<void> search(String query) async {
    _currentSearch = query.trim().isEmpty ? null : query.trim();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load(search: _currentSearch));
  }

  Future<void> create({
    required String name,
    required String description,
  }) async {
    final createLoading = ref.read(brandCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createBrandUseCaseProvider);
    final result = await useCase.call(
      name: name,
      description: description,
    );

    result.fold(
      (failure) {
        ref.read(brandUiEventsProvider.notifier).emit(BrandFailure(failure));
      },
      (created) {
        final current = state.value ?? const <BrandEntity>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(brandUiEventsProvider.notifier).emit(
          BrandCreated(created, 'Brand created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateBrand({
    required String id,
    required String name,
    required String description,
  }) async {
    final updating = ref.read(brandUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateBrandUseCaseProvider);
    final result = await useCase.call(
      id: id,
      name: name,
      description: description,
    );

    result.fold(
      (failure) {
        ref.read(brandUiEventsProvider.notifier).emit(BrandFailure(failure));
      },
      (updated) {
        final list = List<BrandEntity>.from(state.value ?? const <BrandEntity>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);
        ref.read(brandUiEventsProvider.notifier).emit(
          BrandUpdated(updated, 'Brand updated successfully'),
        );
      },
    );

    updating.stop(id);
  }

  Future<void> delete({
    required String id,
  }) async {
    final deleting = ref.read(brandDeleteLoadingProvider.notifier);
    deleting.start(id);

    final useCase = ref.read(deleteBrandUseCaseProvider);
    final result = await useCase.call(id: id);

    result.fold(
      (failure) {
        ref.read(brandUiEventsProvider.notifier).emit(BrandFailure(failure));
      },
      (deletedEntity) {
        final list = List<BrandEntity>.from(state.value ?? const <BrandEntity>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);
        ref.read(brandUiEventsProvider.notifier).emit(
          BrandDeleted(id, 'Brand deleted successfully'),
        );
      },
    );

    deleting.stop(id);
  }

  Future<List<BrandEntity>> _load({
    String? search,
  }) async {
    final useCase = ref.read(getBrandsUseCaseProvider);
    final result = await useCase.call(search: search);
    return result.fold(
      (failure) {
        throw failure;
      },
      (items) => items,
    );
  }
}

