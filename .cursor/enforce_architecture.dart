// Cursor AI Architecture Enforcement Script
// This file serves as a reference for strict Clean Architecture patterns

import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// MANDATORY: All repositories MUST return Either<Failure, Success>
abstract class EnforcedRepository {
  Future<Either<Failure, Success>> method();
}

// MANDATORY: All use cases MUST return Either<Failure, Success>
class EnforcedUseCase {
  Future<Either<Failure, Success>> execute() async {
    // Implementation MUST follow Either pattern
    return await repository.method();
  }
}

// MANDATORY: All API requests MUST use RequestWrapper
class EnforcedApiService {
  static Future<Response> post(String endpoint, {dynamic data}) async {
    // MANDATORY: Wrap all requests
    final wrappedData = RequestWrapper.wrap(data);
    return await dio.post(endpoint, data: wrappedData);
  }
}

// MANDATORY: All models MUST have conversion methods
@freezed
class EnforcedRequestModel with _$EnforcedRequestModel {
  const factory EnforcedRequestModel({
    required String field,
  }) = _EnforcedRequestModel;

  factory EnforcedRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EnforcedRequestModelFromJson(json);

  // MANDATORY: Convert to API format
  Map<String, dynamic> toApiJson() => toJson();
}

@freezed
class EnforcedResponseModel with _$EnforcedResponseModel {
  const factory EnforcedResponseModel({
    required String message,
  }) = _EnforcedResponseModel;

  factory EnforcedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EnforcedResponseModelFromJson(json);

  // MANDATORY: Convert to domain entity
  Entity toEntity() => Entity(message: message);
}

// MANDATORY: All UI components MUST use proper error handling
class EnforcedScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<EnforcedScreen> createState() => _EnforcedScreenState();
}

class _EnforcedScreenState extends ConsumerState<EnforcedScreen> {
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _handleAction() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final useCase = ref.read(useCaseProvider);
      final result = await useCase.execute();

      // MANDATORY: Use Either pattern
      result.fold(
        (failure) => setState(() => _errorMessage = failure.message),
        (success) => _handleSuccess(success),
      );
    } catch (e) {
      setState(() => _errorMessage = 'Unexpected error occurred');
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (_errorMessage != null)
            Text(_errorMessage!),
          ElevatedButton(
            onPressed: _isLoading ? null : _handleAction,
            child: _isLoading ? CircularProgressIndicator() : Text('Action'),
          ),
        ],
      ),
    );
  }
}

// MANDATORY: All failures MUST be properly typed
@freezed
sealed class Failure with _$Failure {
  const factory Failure.serverError(String message) = ServerError;
  const factory Failure.networkError(String message) = NetworkError;
  const factory Failure.validationError(String message) = ValidationError;
  const factory Failure.unexpectedError(String message) = UnexpectedError;
}

// MANDATORY: All success types MUST be properly defined
@freezed
class Success with _$Success {
  const factory Success({
    required String message,
    required Map<String, dynamic> data,
  }) = _Success;
}
