# Pagination Implementation Example - Category Feature

This document shows the complete implementation of pagination with infinite scroll for the Category feature. This pattern can be reused for all other features.

## 📋 Table of Contents

1. [Important: Pagination vs Non-Paginated Endpoints](#important-pagination-vs-non-paginated-endpoints)
2. [Step 1: Create PaginationModel](#step-1-create-paginationmodel)
3. [Step 2: Update ApiResponse](#step-2-update-apiresponse)
4. [Step 3: Create PaginatedResponse Wrapper](#step-3-create-paginatedresponse-wrapper)
5. [Step 4: Update Category API Service](#step-4-update-category-api-service)
6. [Step 5: Update Category Data Source](#step-5-update-category-data-source)
7. [Step 6: Update Category Repository](#step-6-update-category-repository)
8. [Step 7: Update Get Categories Use Case](#step-7-update-get-categories-use-case)
9. [Step 8: Update Category Notifier](#step-8-update-category-notifier)
10. [Step 9: Update Category List Screen](#step-9-update-category-list-screen)

---

## Important: Pagination vs Non-Paginated Endpoints

### ✅ Backward Compatibility

The implementation is designed to be **backward compatible**:

1. **`ApiResponse`** - Pagination is **optional** (`PaginationModel? pagination`)
   - If backend sends pagination → it's parsed
   - If backend doesn't send pagination → it's `null` (no error)

2. **Two Patterns Available**:
   - **Pattern A (Paginated)**: For features that NEED pagination (like Category)
     - Use `PaginatedResponse<T>` return type
     - Require pagination in data source
     - Implement infinite scroll in UI
   
   - **Pattern B (Non-Paginated)**: For features that DON'T need pagination
     - Keep using `List<T>` return type
     - Ignore pagination parameter in `.when()` (it will be null)
     - **Minor update needed**: Add 5th parameter to `.when()` callback

### ⚠️ Important: `.when()` Method Update

When we add `pagination` to `ApiResponse.success()`, Freezed automatically updates the `.when()` method signature. **All existing `.when()` calls need a small update**:

**Before** (4 parameters):
```dart
response.when(
  success: (success, message, data, meta) { ... },
  error: (success, error, meta) { ... },
)
```

**After** (5 parameters - pagination added):
```dart
response.when(
  success: (success, message, data, meta, pagination) { 
    // pagination will be null for non-paginated endpoints
    // Just ignore it if you don't need it
    ... 
  },
  error: (success, error, meta) { ... },
)
```

**For non-paginated features**: Just add the 5th parameter and ignore it:
```dart
success: (success, message, data, meta, pagination) {
  // pagination is null, we ignore it
  return Right(data);
}
```

### 📝 Which Features Need Pagination?

**Features that NEED pagination** (use Pattern A):
- ✅ Categories (large lists)
- ✅ Items (large lists)
- ✅ Transactions (large lists)
- ✅ Any `getAll` endpoint that returns many items

**Features that DON'T need pagination** (keep Pattern B):
- ✅ Models (usually small lists)
- ✅ Units (usually small lists)
- ✅ Brands (usually small lists)
- ✅ Permissions (small lists)
- ✅ Any endpoint that returns small, fixed-size lists

### 🔄 Migration Strategy

1. **Start with features that need pagination** (Category, Items, Transactions)
2. **Leave other features unchanged** - they'll continue working
3. **Gradually migrate** other features if they grow large

### ⚠️ Important Note

When implementing pagination for a feature:
- **Check backend documentation** - Does the endpoint return pagination?
- **If yes** → Use Pattern A (PaginatedResponse)
- **If no** → Keep Pattern B (List<T>)

The `ApiResponse` handles both cases automatically - no breaking changes!

---

## Step 1: Create PaginationModel

**File**: `lib/shared/models/pagination_model.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@freezed
class PaginationModel with _$PaginationModel {
  const factory PaginationModel({
    @JsonKey(name: 'currentPage') required int currentPage,
    @JsonKey(name: 'totalPages') required int totalPages,
    @JsonKey(name: 'totalItems') required int totalItems,
    @JsonKey(name: 'itemsPerPage') required int itemsPerPage,
    @JsonKey(name: 'hasNextPage') required bool hasNextPage,
    @JsonKey(name: 'hasPrevPage') required bool hasPrevPage,
    @JsonKey(name: 'nextPage') int? nextPage,
    @JsonKey(name: 'prevPage') int? prevPage,
  }) = _PaginationModel;

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}
```

**Run**: `dart run build_runner build --delete-conflicting-outputs`

---

## Step 2: Update ApiResponse

**File**: `lib/shared/models/api_response.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';

import 'meta_model.dart';
import 'error_model.dart';
import 'pagination_model.dart'; // Add this import

part 'api_response.freezed.dart';

@Freezed(genericArgumentFactories: true)
@freezed
sealed class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse.success({
    required bool success,
    required String message,
    required T data,
    required MetaModel metadata,
    PaginationModel? pagination, // Add optional pagination
  }) = SuccessResponse<T>;

  const factory ApiResponse.error({
    required bool success,
    required ErrorModel error,
    required MetaModel metadata,
  }) = ErrorResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    final success = json['success'] as bool;
    if (success) {
      return SuccessResponse<T>(
        success: success,
        message: json['message'] as String,
        data: fromJsonT(json['data']),
        metadata: MetaModel.fromJson(json['metadata'] as Map<String, dynamic>),
        // Parse pagination if present
        pagination: json['pagination'] != null
            ? PaginationModel.fromJson(json['pagination'] as Map<String, dynamic>)
            : null,
      );
    } else {
      return ErrorResponse<T>(
        success: success,
        error: ErrorModel.fromJson(json['error'] as Map<String, dynamic>),
        metadata: MetaModel.fromJson(json['metadata'] as Map<String, dynamic>),
      );
    }
  }
}
```

**Run**: `dart run build_runner build --delete-conflicting-outputs`

---

## Step 3: Create PaginatedResponse Wrapper

**File**: `lib/shared/models/paginated_response.dart`

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'pagination_model.dart';

part 'paginated_response.freezed.dart';

/// Wrapper for paginated API responses
/// Combines data list with pagination information
@freezed
class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    required List<T> data,
    required PaginationModel pagination,
  }) = _PaginatedResponse<T>;

  /// Check if there are more pages to load
  bool get hasMore => pagination.hasNextPage;

  /// Get the next page number
  int? get nextPage => pagination.nextPage;

  /// Get the current page
  int get currentPage => pagination.currentPage;

  /// Get total items count
  int get totalItems => pagination.totalItems;
}
```

**Run**: `dart run build_runner build --delete-conflicting-outputs`

---

## Step 4: Update Category API Service

**File**: `lib/features/category/data/datasources/category_api_service.dart`

```dart
import '../../../../core/network/api_service.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../models/category_model.dart';

class CategoryApiService {
  const CategoryApiService();

  factory CategoryApiService.create() {
    return const CategoryApiService();
  }

  // ... existing create, update, delete methods stay the same ...

  /// Get all categories with pagination
  /// 
  /// [page] - Page number (default: 1)
  /// [limit] - Items per page (default: 25)
  Future<ApiResponse<List<CategoryModel>>> getAll({
    int page = 1,
    int limit = 25,
  }) async {
    try {
      final response = await ApiService.get<Map<String, dynamic>>(
        ApiEndpoints.getCategories,
        queryParameters: {
          'page': page,
          'limit': limit,
        },
      );

      final apiResponse = ApiResponse<List<CategoryModel>>.fromJson(
        response.data!,
        (json) => (json as List)
            .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );

      return apiResponse;
    } catch (e) {
      LoggingService.error('Failed to get categories: $e');
      rethrow;
    }
  }

  // ... rest of the methods stay the same ...
}
```

---

## Step 5: Update Category Data Source

**File**: `lib/features/category/data/datasources/category_remote_data_source_impl.dart`

```dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/logging_service.dart';
import '../../../../shared/models/api_response.dart';
import '../../../../shared/models/paginated_response.dart'; // Add this
import '../models/category_model.dart';
import 'category_api_service.dart';
import 'category_remote_data_source.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final CategoryApiService _api;

  CategoryRemoteDataSourceImpl(this._api);

  @override
  Future<Either<Failure, PaginatedResponse<CategoryModel>>> getAll({
    int page = 1,
    int limit = 25,
  }) async {
    LoggingService.auth('Starting get categories process', {
      'page': page,
      'limit': limit,
    });
    try {
      final ApiResponse<List<CategoryModel>> response = await _api.getAll(
        page: page,
        limit: limit,
      );
      return response.when(
        success: (success, message, data, meta, pagination) {
          // For paginated endpoints, pagination should exist
          // But we handle gracefully if it doesn't (for backward compatibility)
          if (pagination == null) {
            LoggingService.warning('Get categories: pagination data missing - endpoint may not support pagination');
            // If pagination is missing, we can't use pagination features
            // This should only happen if backend doesn't send pagination
            // For category feature, we REQUIRE pagination, so return error
            return Left(Failure.unexpectedError('Pagination data is required for this endpoint'));
          }

          LoggingService.auth('Get categories successful', {
            'count': data.length,
            'currentPage': pagination.currentPage,
            'totalPages': pagination.totalPages,
            'hasNextPage': pagination.hasNextPage,
            'message': message,
          });

          return Right(PaginatedResponse(
            data: data,
            pagination: pagination,
          ));
        },
        error: (success, error, meta) {
          LoggingService.auth('Get categories failed - server error', {
            'error': error.message,
            'code': error.statusCode,
          });
          return Left(Failure.serverError(error.message));
        },
      );
    } on DioException catch (e) {
      final exception = NetworkExceptions.getDioException(e);
      return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
    } on TypeError catch (e) {
      LoggingService.error('Get categories data parsing error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Data parsing error: ${e.toString()}'));
    } on FormatException catch (e) {
      LoggingService.error('Get categories response format error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Invalid response format: ${e.toString()}'));
    } catch (e) {
      LoggingService.error('Get categories unexpected error', e, StackTrace.current);
      return Left(Failure.unexpectedError('Get categories failed: ${e.toString()}'));
    }
  }

  // ... rest of the methods (create, update, delete) stay the same ...
}
```

**Update Interface**: `lib/features/category/data/datasources/category_remote_data_source.dart`

```dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart'; // Add this
import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<Either<Failure, PaginatedResponse<CategoryModel>>> getAll({
    int page = 1,
    int limit = 25,
  });

  // ... rest stays the same ...
}
```

---

## Step 6: Update Category Repository

**File**: `lib/features/category/data/repositories/category_repository_impl.dart`

```dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart'; // Add this
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_remote_data_source.dart';
import '../mappers/category_mapper.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource _remoteDataSource;

  CategoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResponse<Category>>> getCategories({
    int page = 1,
    int limit = 25,
  }) async {
    final result = await _remoteDataSource.getAll(page: page, limit: limit);
    
    return result.fold(
      (failure) => Left(failure),
      (paginatedModels) {
        // Convert models to entities
        final entities = paginatedModels.data
            .map((model) => model.toDomain())
            .toList();

        // Return paginated response with entities
        return Right(PaginatedResponse(
          data: entities,
          pagination: paginatedModels.pagination,
        ));
      },
    );
  }

  // ... rest of the methods stay the same ...
}
```

**Update Interface**: `lib/features/category/domain/repositories/category_repository.dart`

```dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart'; // Add this
import '../entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, PaginatedResponse<Category>>> getCategories({
    int page = 1,
    int limit = 25,
  });

  // ... rest stays the same ...
}
```

---

## Step 7: Update Get Categories Use Case

**File**: `lib/features/category/domain/usecases/get_categories_usecase.dart`

```dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/models/paginated_response.dart'; // Add this
import '../entities/category.dart';
import '../repositories/category_repository.dart';

class GetCategoriesUseCase {
  final CategoryRepository _repository;

  GetCategoriesUseCase(this._repository);

  Future<Either<Failure, PaginatedResponse<Category>>> call({
    int page = 1,
    int limit = 25,
  }) async {
    return await _repository.getCategories(page: page, limit: limit);
  }
}
```

---

## Step 8: Update Category Notifier

**File**: `lib/features/category/presentation/providers/category_notifier.dart`

```dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/models/paginated_response.dart'; // Add this
import '../../domain/entities/category.dart';
import 'category_providers.dart';
import 'category_events.dart';
import 'category_loading_providers.dart';

part 'category_notifier.g.dart';

@riverpod
class CategoryNotifier extends _$CategoryNotifier {
  // State: List of all loaded categories (accumulated)
  @override
  Future<List<Category>> build() async {
    return await _loadInitial();
  }

  // Current pagination info
  PaginationModel? _currentPagination;
  bool _isLoadingMore = false;

  /// Load initial page (page 1)
  Future<List<Category>> _loadInitial() async {
    final useCase = ref.read(getCategoriesUseCaseProvider);
    final result = await useCase.call(page: 1, limit: 25);

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

  /// Load more: Load next page and append to current list
  Future<void> loadMore() async {
    // Don't load if already loading or no more pages
    if (_isLoadingMore || _currentPagination == null || !_currentPagination!.hasNextPage) {
      return;
    }

    _isLoadingMore = true;

    try {
      final nextPage = _currentPagination!.nextPage;
      if (nextPage == null) return;

      final useCase = ref.read(getCategoriesUseCaseProvider);
      final result = await useCase.call(page: nextPage, limit: 25);

      result.fold(
        (failure) {
          // Don't throw, just stop loading
          _isLoadingMore = false;
        },
        (paginatedResponse) {
          // Append new data to existing list
          final currentList = state.value ?? const <Category>[];
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

  // ... existing create, update, delete methods stay the same ...
  // But update them to work with the accumulated list

  Future<void> create({
    required String name,
    required String description,
  }) async {
    final createLoading = ref.read(categoryCreateLoadingProvider.notifier);
    createLoading.setLoading(true);

    final useCase = ref.read(createCategoryUseCaseProvider);
    final result = await useCase.call(
      name: name,
      description: description,
    );

    result.fold(
      (failure) {
        ref.read(categoryUiEventsProvider.notifier).emit(CategoryFailure(failure));
      },
      (created) {
        // Add to beginning of list (newest first)
        final current = state.value ?? const <Category>[];
        state = AsyncValue.data([created, ...current]);
        ref.read(categoryUiEventsProvider.notifier).emit(
          CategoryCreated(created, 'Category created successfully'),
        );
      },
    );

    createLoading.setLoading(false);
  }

  Future<void> updateCategory({
    required String id,
    required String name,
    required String description,
  }) async {
    final updating = ref.read(categoryUpdateLoadingProvider.notifier);
    updating.start(id);
    final useCase = ref.read(updateCategoryUseCaseProvider);
    final result = await useCase.call(
      id: id,
      name: name,
      description: description,
    );

    result.fold(
      (failure) {
        ref.read(categoryUiEventsProvider.notifier).emit(CategoryFailure(failure));
      },
      (updated) {
        // Update item in accumulated list
        final list = List<Category>.from(state.value ?? const <Category>[]);
        final idx = list.indexWhere((e) => e.id == id);
        if (idx != -1) list[idx] = updated;
        state = AsyncValue.data(list);
        ref.read(categoryUiEventsProvider.notifier).emit(
          CategoryUpdated(updated, 'Category updated successfully'),
        );
      },
    );

    updating.stop(id);
  }

  Future<void> delete({
    required String id,
  }) async {
    final deleting = ref.read(categoryDeleteLoadingProvider.notifier);
    deleting.start(id);

    final useCase = ref.read(deleteCategoryUseCaseProvider);
    final result = await useCase.call(id: id);

    result.fold(
      (failure) {
        ref.read(categoryUiEventsProvider.notifier).emit(CategoryFailure(failure));
      },
      (deletedEntity) {
        // Remove from accumulated list
        final list = List<Category>.from(state.value ?? const <Category>[]);
        list.removeWhere((e) => e.id == id);
        state = AsyncValue.data(list);
        ref.read(categoryUiEventsProvider.notifier).emit(
          CategoryDeleted(id, 'Category deleted successfully'),
        );
      },
    );

    deleting.stop(id);
  }
}
```

---

## Step 9: Update Category List Screen

**File**: `lib/features/category/presentation/screens/category_list_screen.dart`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/error_widget.dart' as app_err;
import '../../../../shared/components/common/empty_widget.dart';
import '../providers/category_notifier.dart';
import '../providers/category_events.dart';
import '../widgets/category_card.dart';
import '../widgets/category_form_dialog.dart';

class CategoryListScreen extends ConsumerStatefulWidget {
  const CategoryListScreen({super.key});

  @override
  ConsumerState<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends ConsumerState<CategoryListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Listen to scroll events for infinite scroll
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Detect when user scrolls near bottom, then load more
  void _onScroll() {
    if (_isBottom) {
      final notifier = ref.read(categoryProvider.notifier);
      if (notifier.canLoadMore) {
        notifier.loadMore();
      }
    }
  }

  /// Check if user has scrolled to bottom (with threshold)
  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    // Load more when 200px from bottom
    return currentScroll >= (maxScroll * 0.8);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    // Listen to UI events
    ref.listen<CategoryUiEvent?>(
      categoryUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        final snackbar = ref.read(snackbarServiceProvider);
        if (next is CategoryFailure) {
          snackbar.showError(next.failure);
        } else if (next is CategoryCreated) {
          snackbar.showSuccess(next.message);
        } else if (next is CategoryUpdated) {
          snackbar.showSuccess(next.message);
        } else if (next is CategoryDeleted) {
          snackbar.showSuccess(next.message);
        }
        ref.read(categoryUiEventsProvider.notifier).clear();
      },
    );

    final asyncList = ref.watch(categoryProvider);
    final notifier = ref.read(categoryProvider.notifier);
    final isLoadingMore = notifier.isLoadingMore;
    final canLoadMore = notifier.canLoadMore;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.categories)),
      body: asyncList.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.category_outlined,
                title: 'No categories',
                message: "You don't have any categories yet.",
              ),
            );
          }
          
          return RefreshIndicator(
            onRefresh: () => ref.read(categoryProvider.notifier).refresh(),
            child: ListView.builder(
              controller: _scrollController, // Add scroll controller
              padding: const EdgeInsets.all(16),
              itemCount: items.length + (canLoadMore ? 1 : 0), // +1 for loading indicator
              itemBuilder: (context, index) {
                // Show loading indicator at the end if loading more
                if (index == items.length) {
                  return const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: CategoryCard(item: items[index]),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              app_err.ErrorsWidget(
                failure: error is Failure ? error : Failure.unexpectedError(error.toString()),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(categoryProvider.notifier).refresh(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openCreateDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _openCreateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CategoryFormDialog(
        title: 'Create Category',
        buttonText: 'Create',
      ),
    );
  }
}
```

---

## 🎯 Key Features of This Implementation

### ✅ Infinite Scroll
- Automatically loads more data when user scrolls near bottom (80% threshold)
- Shows loading indicator at bottom while loading more
- Prevents duplicate requests

### ✅ Best Practices for Mobile
1. **Scroll Detection**: Uses `ScrollController` to detect scroll position
2. **Threshold Loading**: Loads when 80% scrolled (not at exact bottom) for smoother UX
3. **Loading States**: Shows loading indicator at bottom, not blocking entire screen
4. **Error Handling**: Errors don't break the infinite scroll
5. **Refresh Support**: Pull-to-refresh resets to page 1
6. **Accumulated Data**: New pages are appended, not replaced
7. **Optimistic Updates**: Create/Update/Delete work with accumulated list

### ✅ Reusability
- `PaginationModel` - Reusable across all features
- `PaginatedResponse<T>` - Generic wrapper for any entity type
- Pattern can be copied to any feature (items, transactions, etc.)

---

## 🚀 Next Steps

1. Run `dart run build_runner build --delete-conflicting-outputs` after creating/updating models
2. Test the implementation
3. Apply the same pattern to other features (items, transactions, etc.)

---

## 📝 Notes

- **Page Size**: Default is 25 items per page (configurable)
- **Initial Load**: Always loads page 1 first
- **State Management**: Uses accumulated list (all loaded pages combined)
- **Backward Compatibility**: Non-paginated endpoints still work (pagination is optional)

---

## 📚 Example: Non-Paginated Feature (For Comparison)

For features that **DON'T need pagination**, keep the existing pattern:

**File**: `lib/features/model/data/datasources/model_remote_data_source_impl.dart`

```dart
@override
Future<Either<Failure, List<ModelModel>>> getModels() async {
  LoggingService.auth('Starting get models process');
  try {
    final ApiResponse<List<ModelModel>> response = await _api.getAll();
    return response.when(
      success: (success, message, data, meta, pagination) {
        // pagination will be null for non-paginated endpoints
        // We just ignore it and return the data
        LoggingService.auth('Get models successful', {
          'count': data.length,
          'message': message,
        });
        return Right(data); // Return List<T>, not PaginatedResponse<T>
      },
      error: (success, error, meta) {
        LoggingService.auth('Get models failed - server error', {
          'error': error.message,
          'code': error.statusCode,
        });
        return Left(Failure.serverError(error.message));
      },
    );
  } on DioException catch (e) {
    final exception = NetworkExceptions.getDioException(e);
    return Left(Failure.networkError(NetworkExceptions.getErrorMessage(exception)));
  } catch (e) {
    LoggingService.error('Get models unexpected error', e, StackTrace.current);
    return Left(Failure.unexpectedError('Get models failed: ${e.toString()}'));
  }
}
```

**Key Differences**:
- ✅ Return type: `List<ModelModel>` (not `PaginatedResponse<ModelModel>`)
- ✅ Ignore `pagination` parameter (it's null anyway)
- ✅ No page/limit parameters needed
- ✅ No infinite scroll in UI
- ✅ Works exactly as before - no changes needed!

**The `ApiResponse.when()` callback now has 5 parameters**:
```dart
success: (success, message, data, meta, pagination) {
  // pagination is optional - null for non-paginated endpoints
  // Just ignore it if you don't need pagination
}
```

### 🔧 Migration Checklist for Non-Paginated Features

When updating `ApiResponse`, you'll need to update `.when()` calls in non-paginated features:

1. ✅ Add 5th parameter `pagination` to `success` callback
2. ✅ Ignore the parameter (it's null anyway)
3. ✅ No other changes needed - everything else stays the same

**Example Update**:
```dart
// OLD
success: (success, message, data, meta) {
  return Right(data);
}

// NEW (just add pagination parameter)
success: (success, message, data, meta, pagination) {
  // pagination is null, ignore it
  return Right(data);
}
```

This is a **minimal breaking change** - just add one parameter to existing callbacks. The functionality remains exactly the same!

