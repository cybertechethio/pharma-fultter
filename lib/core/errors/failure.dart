import 'package:freezed_annotation/freezed_annotation.dart';

import '../../shared/models/error_model.dart';


part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.serverError(String message) = ServerFailure;
  const factory Failure.networkError(String message) = NetworkFailure;
  const factory Failure.authError(ErrorModel error) = AuthFailure;
  const factory Failure.validationError(String message) = ValidationFailure;
  const factory Failure.unexpectedError(String message) = UnexpectedFailure;
  const factory Failure.storageError(String message) = StorageFailure;
}