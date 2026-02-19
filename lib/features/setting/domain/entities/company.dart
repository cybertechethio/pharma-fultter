import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';

/// Company entity
@freezed
sealed class Company with _$Company {
  const factory Company({
    required String id,
    required String name,
    String? phone1,
    String? phone2,
    String? logoUrl,
    String? tinNumber,
    String? tradeName,
    String? city,
    String? wereda,
    required bool autoPrint,
    DateTime? defaultStartDate,
    required DateTime createdAt,
     DateTime? updatedAt,
  }) = _Company;
}

