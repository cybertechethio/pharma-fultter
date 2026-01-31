import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank.freezed.dart';

@freezed
sealed class BankEntity with _$BankEntity {
  const factory BankEntity({
    required int id,
    required int companyId,
    required String name,
    required DateTime createdAt,
    DateTime? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) = _BankEntity;
}

