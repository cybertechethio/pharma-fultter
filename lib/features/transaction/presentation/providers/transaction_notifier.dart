import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../shared/models/pagination_model.dart';
import '../../domain/entities/transaction.dart';
import '../../data/models/create_trans_request.dart';
import 'transaction_providers.dart';
import 'transaction_events.dart';
import 'transaction_loading_providers.dart';

part 'transaction_notifier.g.dart';

@riverpod
class TransactionNotifier extends _$TransactionNotifier {
  // State: List of all loaded transactions (accumulated)
  @override
  FutureOr<List<Transaction>> build() async {
    return await _loadInitial();
  }

  // Current pagination info
  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;
  TransactionType? _selectedType;

  /// Load initial page (page 1)
  Future<List<Transaction>> _loadInitial() async {
    final useCase = ref.read(getTransactionsUseCaseProvider);
    final result = await useCase.call(
      page: 1,
      limit: 25,
      transactionType: _selectedType,
    );

    return result.fold(
      (failure) {
        throw failure;
      },
      (paginatedResponse) {
        _currentPagination = paginatedResponse.pagination;
        return paginatedResponse.data;
      },
    );
  }

  /// Refresh: Reload from page 1
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial());
  }

  /// Apply transaction type filter (matches pattern from report notifiers)
  Future<void> applyFilter(TransactionType? type) async {
    _selectedType = type;
    _currentPagination = null; // Reset pagination when filtering
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadInitial());
  }

  /// Load more: Load next page and append to current list
  Future<void> loadMore() async {
    // Don't load if already loading or no more pages
    if (_isLoadingMore || _currentPagination == null || !_currentPagination!.hasNextPage) {
      return;
    }

    _isLoadingMore = true;

    try {
      final nextPage = _currentPagination!.nextPage;
      if (nextPage == null) {
        _isLoadingMore = false;
        return;
      }

      final useCase = ref.read(getTransactionsUseCaseProvider);
      final result = await useCase.call(
        page: nextPage,
        limit: 25,
        transactionType: _selectedType,
      );

      result.fold(
        (failure) {
          // Don't throw, just stop loading
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          // Append new data to existing list
          final currentList = state.value ?? const <Transaction>[];
          final updatedList = [...currentList, ...paginatedResponse.data];
          
          _currentPagination = paginatedResponse.pagination;
          state = AsyncValue.data(updatedList);
          _isLoadingMore = false;
        },
      );
    } catch (e) {
      _isLoadingMore = false;
      // Error is handled by state
    }
  }

  /// Check if more data can be loaded
  bool get canLoadMore => 
      _currentPagination != null && 
      _currentPagination!.hasNextPage && 
      !_isLoadingMore;

  /// Check if currently loading more
  bool get isLoadingMore => _isLoadingMore;


  Future<void> createTransaction({
    required CreateTransRequest data,
    required List<String> receiptFilePaths,
    required Map<String, String> paymentAttachmentFilePaths,
  }) async {
    // Read providers before async operation to avoid disposed ref issues
    final createLoading = ref.read(transactionCreateLoadingProvider.notifier);
     // Start loading
     createLoading.setLoading(true);

    final useCase = ref.read(createTransactionUseCaseProvider);

    // Call use case
    final result = await useCase.call(
      data: data,
      receiptFilePaths: receiptFilePaths,
      paymentAttachmentFilePaths: paymentAttachmentFilePaths,
    );


    // Handle result
    result.fold(
      (failure) {
        // Emit failure event
        ref.read(transactionUiEventsProvider.notifier).emit(TransactionFailure(failure));
      },
      (created) {
        // Add to beginning of list (newest first)
        final current = state.value ?? const <Transaction>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(transactionUiEventsProvider.notifier).emit(TransactionCreated(created, 'Transaction created successfully'));
      },
    );

      createLoading.setLoading(false);
    
  }

  /// Reverse a transaction (sale or purchase)
  Future<void> reverseTransaction({
    required int reversesTransactionId,
    String? notes,
  }) async {
    // Read providers before async operation
    final reverseLoading = ref.read(transactionReverseLoadingProvider.notifier);
    
    // Start loading
    reverseLoading.setLoading(true);

    final useCase = ref.read(reverseTransactionUseCaseProvider);

    // Call use case
    final result = await useCase.call(
      reversesTransactionId: reversesTransactionId,
      notes: notes,
    );

    // Handle result
    result.fold(
      (failure) {
        // Emit failure event
        ref.read(transactionUiEventsProvider.notifier).emit(TransactionFailure(failure));
      },
      (reversedTransaction) {
        // Add reversed transaction to beginning of list (newest first)
        final current = state.value ?? const <Transaction>[];
        state = AsyncValue.data([reversedTransaction, ...current]);
        ref.read(transactionUiEventsProvider.notifier).emit(
          TransactionReversed(reversedTransaction, 'Transaction reversed successfully'),
        );
      },
    );

    reverseLoading.setLoading(false);
  }
}

