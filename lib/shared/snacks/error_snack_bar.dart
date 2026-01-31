import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../../core/errors/failure.dart';
import '../../app/theme/app_sizes.dart';

class ErrorSnackBar {
  static void show(
    BuildContext context, {
    required Failure failure,
    Duration duration = const Duration(seconds: 4),
  }) {
    String message = 'An error occurred';
    String? code;

    failure.when(
      serverError: (msg) => message = msg,
      networkError: (msg) => message = msg,
      storageError: (msg) => message = msg,
      authError: (msg) {
        message = msg.message;
        code = msg.statusCode;
      },
      validationError: (msg) => message = msg,
      unexpectedError: (msg) => message = msg,
    );

    final colorScheme = Theme.of(context).colorScheme;
    Flushbar(
      message: message,
      title: code != null ? 'Error: $code' : null,
      duration: duration,
      backgroundColor: colorScheme.error,
      margin: const EdgeInsets.all(AppSizes.sm),
      borderRadius: BorderRadius.circular(AppSizes.radius),
      icon: Icon(Icons.error_outline, color: colorScheme.onError),
      flushbarPosition: FlushbarPosition.TOP,
      animationDuration: const Duration(milliseconds: 300),
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
    ).show(context);
  }
}
