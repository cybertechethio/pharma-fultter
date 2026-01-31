import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit.freezed.dart';

@freezed
sealed class UnitEntity with _$UnitEntity {
  const factory UnitEntity({
    required String id,
    required int companyId,
    required String name,
    required String description,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _UnitEntity;
}

