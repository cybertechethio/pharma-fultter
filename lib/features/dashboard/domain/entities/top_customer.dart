import 'package:freezed_annotation/freezed_annotation.dart';

part 'top_customer.freezed.dart';

@freezed
sealed class TopCustomer with _$TopCustomer {
  const factory TopCustomer({
    required int id,
    required String name,
    String? imageUrl,
    String? location,
    required int orders,
    required double total,
  }) = _TopCustomer;
}

