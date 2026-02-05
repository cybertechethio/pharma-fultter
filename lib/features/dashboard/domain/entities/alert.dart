import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert.freezed.dart';

@freezed
sealed class Alert with _$Alert {
  const factory Alert({
    required int id,
    required String name,
    required int stock,
    int? threshold,
  }) = _Alert;
}

