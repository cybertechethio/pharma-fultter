import 'package:flutter/material.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/text_styles.dart';
import '../../../core/errors/failure.dart';

/// Simple error widget component for displaying error states
class ErrorsWidget extends StatelessWidget {
  /// Failure object to extract message from
  final Failure failure;
  
  /// Callback when retry is pressed
  final VoidCallback? onRetry;

  const ErrorsWidget({
    super.key,
    required this.failure,
    this.onRetry,
  });

  /// Extracts the error message from the failure object
  String _getErrorMessage() {
    return failure.when(
      serverError: (msg) => msg,
      networkError: (msg) => msg,
      storageError: (msg) => msg,
      authError: (error) => error.message,
      validationError: (msg) => msg,
      unexpectedError: (msg) => msg,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _getErrorMessage(),
            style: context.body(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSizes.lg),
          if (onRetry != null)
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
        ],
      ),
    );
  }
}
