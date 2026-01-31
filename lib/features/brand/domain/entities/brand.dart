import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand.freezed.dart';

@freezed
sealed class BrandEntity with _$BrandEntity {
  const factory BrandEntity({
    required String id,
    required int companyId,
    required String name,
    required String description,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _BrandEntity;
}

