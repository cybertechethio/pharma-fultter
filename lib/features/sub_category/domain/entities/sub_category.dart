import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_category.freezed.dart';

@freezed
sealed class SubCategory with _$SubCategory {
  const factory SubCategory({
    required String id,
    required int companyId,
    required int categoryId,
    required String name,
    required String description,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _SubCategory;
}

