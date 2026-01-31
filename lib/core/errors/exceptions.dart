import 'dart:io';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
sealed class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;
  const factory NetworkExceptions.unauthorizedRequest(String message) =
      UnauthorizedRequest;
  const factory NetworkExceptions.badRequest(String message) = BadRequest;
  const factory NetworkExceptions.notFound(String message) = NotFound;
  const factory NetworkExceptions.methodNotAllowed(String message) =
      MethodNotAllowed;
  const factory NetworkExceptions.requestTimeout(String message) =
      RequestTimeout;
  const factory NetworkExceptions.sendTimeout(String message) = SendTimeout;
  const factory NetworkExceptions.conflict(String message) = Conflict;
  const factory NetworkExceptions.internalServerError(String message) =
      InternalServerError;
  const factory NetworkExceptions.notImplemented(String message) =
      NotImplemented;
  const factory NetworkExceptions.serviceUnavailable(String message) =
      ServiceUnavailable;
  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;
  const factory NetworkExceptions.formatException() = FormatException;
  const factory NetworkExceptions.unableToProcess() = UnableToProcess;
  const factory NetworkExceptions.defaultError(String message) = DefaultError;
  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions getDioException(dynamic error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioException) {
          String getErrorMessage(Map<String, dynamic>? data) {
            if (data != null && data['error'] is Map<String, dynamic>) {
              final err = data['error'] as Map<String, dynamic>;
              final msg = err['message'];
              return (msg is String && msg.isNotEmpty) ? msg : 'Unknown error';
            }
            return 'Unknown error';
          }

          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkExceptions.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkExceptions.requestTimeout(
                'Connection timeout',
              );
              break;
            case DioExceptionType.unknown:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout(
                'Receive timeout',
              );
              break;
            case DioExceptionType.badResponse:
              final data = error.response?.data as Map<String, dynamic>?;
              switch (error.response?.statusCode) {
                case 400:
                  networkExceptions = NetworkExceptions.badRequest(
                    getErrorMessage(data),
                  );
                  break;
                case 401:
                  networkExceptions = NetworkExceptions.unauthorizedRequest(
                    getErrorMessage(data),
                  );
                  break;
                case 403:
                  networkExceptions = NetworkExceptions.unauthorizedRequest(
                    getErrorMessage(data),
                    
                  );
                  break;
                case 404:
                  networkExceptions = NetworkExceptions.notFound(
                    getErrorMessage(data),
                  );
                  break;
                case 409:
                  networkExceptions = NetworkExceptions.conflict(
                    getErrorMessage(data),
                  );
                  break;
                case 408:
                  networkExceptions = NetworkExceptions.requestTimeout(
                    getErrorMessage(data),
                  );
                  break;
                case 500:
                  networkExceptions = NetworkExceptions.internalServerError(
                    getErrorMessage(data),
                  );
                  break;
                case 503:
                  networkExceptions = NetworkExceptions.serviceUnavailable(
                    getErrorMessage(data),
                  );
                  break;
                default:
                  networkExceptions = NetworkExceptions.defaultError(
                    'Received invalid status code: ${error.response?.statusCode}',
                  );
              }
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkExceptions.sendTimeout(
                'Send timeout',
              );
              break;
            case DioExceptionType.badCertificate:
              networkExceptions = const NetworkExceptions.unauthorizedRequest(
                'Invalid certificate',
              );
              break;
            case DioExceptionType.connectionError:
              networkExceptions =
                  const NetworkExceptions.noInternetConnection();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException {
        return const NetworkExceptions.formatException();
      } catch (_) {
        return const NetworkExceptions.unexpectedError();
      }
    } else {
      return const NetworkExceptions.unexpectedError();
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    return networkExceptions.when(
      requestCancelled: () => 'Request was cancelled',
      unauthorizedRequest: (message) => message,
      badRequest: (message) => message,
      notFound: (message) => message,
      methodNotAllowed: (message) => message,
      requestTimeout: (message) => message,
      sendTimeout: (message) => message,
      conflict: (message) => message,
      internalServerError: (message) => message,
      notImplemented: (message) => 'Not implemented',
      serviceUnavailable: (message) => message,
      noInternetConnection: () => 'No internet connection',
      formatException: () => 'Unexpected error occurred',
      unableToProcess: () => 'Unable to process the data',
      defaultError: (message) => message,
      unexpectedError: () => 'Unexpected error occurred',
    );
  }
}