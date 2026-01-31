import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app_exception.dart';

/// Comprehensive error handling system for the application
/// 
/// This class provides centralized error handling with:
/// - Local error logging and reporting
/// - User-friendly error messages
/// - Development vs production error handling
class AppErrorHandler {
  static final AppErrorHandler _instance = AppErrorHandler._internal();
  factory AppErrorHandler() => _instance;
  AppErrorHandler._internal();

  /// Initialize error handling
  Future<void> initialize() async {
    // Set up global error handlers
    FlutterError.onError = (FlutterErrorDetails details) {
      _handleFlutterError(details);
    };

    // Set up async error handler
    PlatformDispatcher.instance.onError = (error, stack) {
      _handleAsyncError(error, stack);
      return true;
    };

    if (kDebugMode) {
      developer.log('Error handling initialized');
    }
  }

  /// Handle Flutter framework errors
  void _handleFlutterError(FlutterErrorDetails details) {
    if (kDebugMode) {
      // In debug mode, print to console
      FlutterError.presentError(details);
    } else {
      // In release mode, report to crashlytics
      developer.log('Flutter fatal error: ${details.exception}', error: details.exception, stackTrace: details.stack);
    }

    // Track error in analytics
    _trackError('flutter_error', details.exception.toString());
  }

  /// Handle async errors
  void _handleAsyncError(Object error, StackTrace stack) {
    if (kDebugMode) {
      developer.log('Async Error: $error', stackTrace: stack);
    } else {
      developer.log('Async error: $error', error: error, stackTrace: stack);
    }

    _trackError('async_error', error.toString());
  }

  /// Handle zone errors
  void _handleZoneError(Object error, StackTrace stack) {
    if (kDebugMode) {
      developer.log('Zone Error: $error', stackTrace: stack);
    } else {
      developer.log('Zone error: $error', error: error, stackTrace: stack);
    }

    _trackError('zone_error', error.toString());
  }

  /// Handle application-specific errors
  void handleAppError(AppException error, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      developer.log('App Error: ${error.message}', 
          error: error, stackTrace: stackTrace);
    } else {
      developer.log('App error: $error', error: error, stackTrace: stackTrace);
    }

    _trackError('app_error', error.message, errorCode: error.code);
  }

  /// Handle network errors
  void handleNetworkError(dynamic error, {StackTrace? stackTrace}) {
    if (kDebugMode) {
      developer.log('Network Error: $error', stackTrace: stackTrace);
    } else {
      developer.log('App error: $error', error: error, stackTrace: stackTrace);
    }

    _trackError('network_error', error.toString());
  }

  /// Handle validation errors
  void handleValidationError(String message, {String? field}) {
    if (kDebugMode) {
      developer.log('Validation Error: $message');
    }

    _trackError('validation_error', message, customParameters: {
      'field': field ?? 'unknown',
    });
  }

  /// Track error in analytics
  Future<void> _trackError(
    String errorType,
    String errorMessage, {
    String? errorCode,
    Map<String, dynamic>? customParameters,
  }) async {
    try {
      final parameters = <String, dynamic>{
        'errorType': errorType,
        'errorMessage': errorMessage,
        if (errorCode != null) 'errorCode': errorCode,
        ...?customParameters,
      };

      if (kDebugMode) {
        developer.log('Error tracked: $errorType - $errorMessage');
      }
    } catch (e) {
      // Don't let analytics errors break the app
      if (kDebugMode) {
        developer.log('Analytics error: $e');
      }
    }
  }

  /// Get user-friendly error message
  String getUserFriendlyMessage(dynamic error) {
    if (error is AppException) {
      return error.userMessage;
    }

    if (error is NetworkException) {
      return 'Network connection error. Please check your internet connection.';
    }

    if (error is ValidationException) {
      return error.message;
    }

    if (kDebugMode) {
      return error.toString();
    }

    return 'An unexpected error occurred. Please try again.';
  }

  /// Show error dialog to user
  void showErrorDialog(BuildContext context, dynamic error) {
    final message = getUserFriendlyMessage(error);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Show error snackbar
  void showErrorSnackBar(BuildContext context, dynamic error) {
    final message = getUserFriendlyMessage(error);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        action: SnackBarAction(
          label: 'Dismiss',
          textColor: Theme.of(context).colorScheme.onError,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  /// Set user identifier for crashlytics
  Future<void> setUserId(String userId) async {
    if (kDebugMode) {
      developer.log('User identifier set: $userId');
    }
  }

  /// Set custom key-value pairs for crashlytics
  Future<void> setCustomKey(String key, dynamic value) async {
    if (kDebugMode) {
      developer.log('Custom key set: $key = $value');
    }
  }

  /// Log non-fatal error
  Future<void> logError(dynamic error, StackTrace? stackTrace) async {
    developer.log('Non-fatal error: $error', error: error, stackTrace: stackTrace);
  }

  /// Log fatal error
  Future<void> logFatalError(dynamic error, StackTrace? stackTrace) async {
    developer.log('Fatal error: $error', error: error, stackTrace: stackTrace);
  }
}
