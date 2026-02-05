import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/model.dart';
import 'model_providers.dart';
import 'model_events.dart';
import 'model_loading_providers.dart';

part 'model_notifier.g.dart';

@Riverpod(keepAlive: true)
class ModelNotifier extends _$ModelNotifier {
  @override
  Future<List<ModelEntity>> build() async {
    // Use AsyncValue.guard to catch errors and convert them properly
    // Then manually set state to error to prevent Riverpod's automatic retry
    final result = await AsyncValue.guard(() => _load());
    
    if (result.hasError) {
      // Manually set state to error to prevent Riverpod from retrying
      // This is the proper way to handle errors in AsyncNotifier.build()
      state = result;
      // Re-throw to satisfy the return type, but state is already set
      throw result.error!;
    }
    
    // Set state to data and return
    state = result;
    return result.value!;
  }

  Future<void> load() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _load());
  }

  Future<void> create({
    required String name,
    required String description,
  }) async {
    final createLoading = ref.read(modelCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createModelUseCaseProvider);
    final result = await useCase.call(
      name: name,
      description: description,
    );

    result.fold(
      (failure) {
        ref.read(modelUiEventsProvider.notifier).emit(ModelFailure(failure));
      },
      (created) {
        final current = state.value ?? const <ModelEntity>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(modelUiEventsProvider.notifier).emit(
          ModelCreated(created, 'Model created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateModel({
    required String id,
    required String name,
    required String description,
  }) async {
    final updating = ref.read(modelUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateModelUseCaseProvider);
    final result = await useCase.call(
      id: id,
      name: name,
      description: description,
    );

    result.fold(
      (failure) {
        ref.read(modelUiEventsProvider.notifier).emit(ModelFailure(failure));
      },
      (updated) {
        final list = List<ModelEntity>.from(state.value ?? const <ModelEntity>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);
        ref.read(modelUiEventsProvider.notifier).emit(
          ModelUpdated(updated, 'Model updated successfully'),
        );
      },
    );

    updating.stop(id);
  }

  Future<void> delete({
    required String id,
  }) async {
    final deleting = ref.read(modelDeleteLoadingProvider.notifier);
    deleting.start(id);

    final useCase = ref.read(deleteModelUseCaseProvider);
    final result = await useCase.call(id: id);

    result.fold(
      (failure) {
        ref.read(modelUiEventsProvider.notifier).emit(ModelFailure(failure));
      },
      (deletedEntity) {
        final list = List<ModelEntity>.from(state.value ?? const <ModelEntity>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);
        ref.read(modelUiEventsProvider.notifier).emit(
          ModelDeleted(id, 'Model deleted successfully'),
        );
      },
    );

    deleting.stop(id);
  }

  Future<List<ModelEntity>> _load() async {
    final useCase = ref.read(getModelsUseCaseProvider);
    final result = await useCase.call();
    return result.fold(
      (failure) {
        throw failure;
      },
      (items) => items,
    );
  }
}

