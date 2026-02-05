import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/batch.dart';
import '../../domain/entities/batch_input.dart';
import 'batch_providers.dart';
import 'batch_events.dart';
import 'batch_loading_providers.dart';

part 'batch_notifier.g.dart';

@riverpod
class BatchNotifier extends _$BatchNotifier {
  @override
  Future<List<BatchEntity>> build(int itemId) async {
    final useCase = ref.read(getBatchesByItemUseCaseProvider);
    final result = await useCase.call(itemId);

    return result.fold(
      (failure) => throw failure,
      (list) => list,
    );
  }

  Future<void> create(BatchInput input) async {
    final createLoading = ref.read(batchCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createBatchUseCaseProvider);
    final result = await useCase.call(input);

    result.fold(
      (failure) {
        ref.read(batchUiEventsProvider.notifier).emit(BatchFailure(failure));
      },
      (created) {
        if (input.itemId != null && created.itemId == itemId) {
          final current = state.value ?? const <BatchEntity>[];
          state = AsyncValue.data([created, ...current]);
        }
        ref.read(batchUiEventsProvider.notifier).emit(
          BatchCreated(created, 'Batch created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateBatch(int id, BatchInput input) async {
    final updating = ref.read(batchUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateBatchUseCaseProvider);
    final result = await useCase.call(id, input);

    result.fold(
      (failure) {
        ref.read(batchUiEventsProvider.notifier).emit(BatchFailure(failure));
      },
      (updated) {
        final list = List<BatchEntity>.from(state.value ?? const <BatchEntity>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);
        ref.read(batchUiEventsProvider.notifier).emit(
          BatchUpdated(updated, 'Batch updated successfully'),
        );
      },
    );

    updating.stop(id);
  }
}
