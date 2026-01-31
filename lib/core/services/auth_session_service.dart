import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';
import '../../routes/route_name.dart';
import 'snackbar_service.dart';
import '../../features/auth/presentation/providers/auth_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Service to handle authentication session management
/// 
/// This service provides a way for interceptors (which don't have Riverpod access)
/// to trigger logout and redirect when token refresh fails.
class AuthSessionService {
  static AuthSessionService? _instance;
  static AuthSessionService get instance => _instance ??= AuthSessionService._();

  AuthSessionService._();

  /// Callback to trigger logout through Riverpod
  /// This will be set during app initialization where Riverpod is available
  void Function()? _onLogoutRequired;
  
  /// Set the logout callback
  /// This should be called during app initialization
  void setLogoutCallback(void Function() onLogoutRequired) {
    _onLogoutRequired = onLogoutRequired;
  }

  /// Handle session expiration - clears tokens and redirects to login
  /// This is called by AuthInterceptor when token refresh fails
  Future<void> handleSessionExpiration() async {
    try {
      // Trigger logout callback if available (this updates auth state via Riverpod)
      if (_onLogoutRequired != null) {
        _onLogoutRequired!();
      }

      // Wait a bit for logout to process
      await Future.delayed(const Duration(milliseconds: 100));

      // Navigate to login page using root navigator key
      final navigator = SnackbarService.rootNavigatorKey.currentState;
      if (navigator != null) {
        // Use GoRouter to navigate to login
        final context = navigator.context;
        if (context.mounted) {
          // Use post frame callback to ensure navigation happens after state updates
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              context.go(RouteName.login);
            }
          });
        }
      }

      // Show user notification
      final snackbar = SnackbarService();
      snackbar.showWarning('Your session has expired. Please log in again.');
    } catch (e) {
      // Log error but don't throw - this is a background operation
      print('Error handling session expiration: $e');
    }
  }
}

/// Initialize AuthSessionService with Riverpod providers
/// This should be called during app startup
/// Note: This function should be called from a context where WidgetRef is available
void initializeAuthSessionService(WidgetRef ref) {
  final authSessionService = AuthSessionService.instance;
  
  // Set logout callback that uses Riverpod
  authSessionService.setLogoutCallback(() {
    // Access auth notifier through Riverpod and trigger logout
    try {
      final authNotifier = ref.read(authProvider.notifier);
      authNotifier.logout();
    } catch (e) {
      // If Riverpod is not available, just redirect
      print('Error triggering logout: $e');
    }
  });
}

