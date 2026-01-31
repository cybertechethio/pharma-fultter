import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@freezed
sealed class PaginationModel with _$PaginationModel {
  const factory PaginationModel({
    required int currentPage,
    required int totalPages,
    required int totalItems,
    required int itemsPerPage,
    required bool hasNextPage,
    required bool hasPrevPage,
    int? nextPage,
    int? prevPage,
  }) = _PaginationModel;

  /// Creates an empty pagination model with default values
  factory PaginationModel.empty() => const PaginationModel(
        currentPage: 1,
        totalPages: 1,
        totalItems: 0,
        itemsPerPage: 25,
        hasNextPage: false,
        hasPrevPage: false,
      );

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}

