import 'package:freezed_annotation/freezed_annotation.dart';
import 'pagination_model.dart';

part 'paginated_response.freezed.dart';

/// Wrapper for paginated API responses
/// Combines data list with pagination information
@freezed
sealed class PaginatedResponse<T> with _$PaginatedResponse<T> {
  const factory PaginatedResponse({
    required List<T> data,
    required PaginationModel pagination,
  }) = _PaginatedResponse<T>;
}

