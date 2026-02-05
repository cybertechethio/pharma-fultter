import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/batch_consolidation_request_model.dart';
import '../../data/models/batch_split_request_model.dart';
import '../../data/models/batch_transfer_request_model.dart';
import 'batch_events.dart';
import 'batch_loading_providers.dart';
import 'batch_providers.dart';

part 'batch_operation_notifier.g.dart';

/// Operation type keys for loading state.
const String kBatchOpTransfer = 'transfer';
const String kBatchOpConsolidation = 'consolidation';
const String kBatchOpSplit = 'split';

@riverpod
class BatchOperationNotifier extends _$BatchOperationNotifier {
  @override
  void build() {}

  Future<void> transfer(BatchTransferRequestModel request) async {
    final loading = ref.read(batchOperationLoadingProvider.notifier);
    final eventsNotifier = ref.read(batchUiEventsProvider.notifier);
    final useCase = ref.read(transferBatchUseCaseProvider);

    loading.start(kBatchOpTransfer);
    final result = await useCase.call(request);

    result.fold(
      (failure) {
        eventsNotifier.emit(BatchOperationFailure(failure));
      },
      (_) {
        eventsNotifier.emit(
          BatchOperationSuccess('Batch transfer completed successfully'),
        );
      },
    );

    loading.stop(kBatchOpTransfer);
  }

  Future<void> consolidate(BatchConsolidationRequestModel request) async {
    final loading = ref.read(batchOperationLoadingProvider.notifier);
    final eventsNotifier = ref.read(batchUiEventsProvider.notifier);
    final useCase = ref.read(consolidateBatchUseCaseProvider);

    loading.start(kBatchOpConsolidation);
    final result = await useCase.call(request);

    result.fold(
      (failure) {
        eventsNotifier.emit(BatchOperationFailure(failure));
      },
      (_) {
        eventsNotifier.emit(
          BatchOperationSuccess('Batch consolidation completed successfully'),
        );
      },
    );

    loading.stop(kBatchOpConsolidation);
  }

  Future<void> split(BatchSplitRequestModel request) async {
    final loading = ref.read(batchOperationLoadingProvider.notifier);
    final eventsNotifier = ref.read(batchUiEventsProvider.notifier);
    final useCase = ref.read(splitBatchUseCaseProvider);

    loading.start(kBatchOpSplit);
    final result = await useCase.call(request);

    result.fold(
      (failure) {
        eventsNotifier.emit(BatchOperationFailure(failure));
      },
      (_) {
        eventsNotifier.emit(
          BatchOperationSuccess('Batch split completed successfully'),
        );
      },
    );

    loading.stop(kBatchOpSplit);
  }
}
