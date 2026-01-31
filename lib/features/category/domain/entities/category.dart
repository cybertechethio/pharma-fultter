import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@freezed
sealed class Category with _$Category {
  const factory Category({
    required String id,
    required int companyId,
    required String name,
    required String description,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _Category;
}

