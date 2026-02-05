import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../constants/api_endpoints.dart';
import '../../services/logging_service.dart';
import '../../services/auth_session_service.dart';
import '../../database/isar_database.dart';
import '../../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../../features/auth/data/datasources/auth_local_data_source_impl.dart';
import '../../../features/auth/domain/entities/auth_token.dart';

/// Authentication interceptor
/// 
/// This interceptor automatically adds authentication headers to requests
/// and handles token refresh when needed.
class AuthInterceptor extends Interceptor {
  AuthLocalDataSource? _authLocalDataSource;

  AuthInterceptor({AuthLocalDataSource? authLocalDataSource}) 
      : _authLocalDataSource = authLocalDataSource {
    if (_authLocalDataSource == null) {
      _initializeAuthLocalDataSource();
    }
  }

  /// Initialize AuthLocalDataSource
  void _initializeAuthLocalDataSource() async {
    try {
      final storage = const FlutterSecureStorage();
      final isar = await IsarDatabase.instance;
      _authLocalDataSource = AuthLocalDataSourceImpl(storage, isar);
    } catch (e) {
      LoggingService.error('Failed to initialize AuthLocalDataSource', e, StackTrace.current);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      // Skip authentication for auth endpoints
      if (_isAuthEndpoint(options.path)) {
        LoggingService.auth('Skipping authentication for auth endpoint: ${options.path}');
        handler.next(options);
        return;
      }

      // Wait for AuthLocalDataSource to be initialized if not ready
      if (_authLocalDataSource == null) {
        await Future.delayed(const Duration(milliseconds: 100));
        if (_authLocalDataSource == null) {
          LoggingService.auth('AuthLocalDataSource not initialized, skipping auth for: ${options.path}');
          handler.next(options);
          return;
        }
      }

      // Add authorization header if token exists
      final token = await _authLocalDataSource!.getAccessToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
        LoggingService.auth('Added authorization header to request: ${options.path}');
      } else {
        LoggingService.auth('No access token found for request: ${options.path}');
      }

      // Add current context headers
      try {
        final currentContext = await _authLocalDataSource!.getCurrentContext();
        if (currentContext != null) {
          options.headers['current_company_id'] = currentContext.currentCompanyId;
          options.headers['current_branch_id'] = currentContext.currentBranchId;
          LoggingService.auth('Added context headers to request: ${options.path}', {
            'current_company_id': currentContext.currentCompanyId,
            'current_branch_id': currentContext.currentBranchId,
          });
        } else {
          // Add null headers even if context is null
          options.headers['current_company_id'] = null;
          options.headers['current_branch_id'] = null;
          LoggingService.auth('Added null context headers to request: ${options.path}');
        }
      } catch (e) {
        // If context retrieval fails, still add null headers
        options.headers['current_company_id'] = null;
        options.headers['current_branch_id'] = null;
        LoggingService.error('Failed to get current context, adding null headers', e, StackTrace.current);
      }

      // Add other common headers
      options.headers['X-Requested-With'] = 'XMLHttpRequest';
      options.headers['X-App-Version'] = '1.0.0'; // You can get this from package_info_plus

      handler.next(options);
    } catch (e) {
      LoggingService.error('Auth interceptor error', e, StackTrace.current);
      handler.next(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      // Handle 401 Unauthorized errors
      if (err.response?.statusCode == 401) {
        // Skip token refresh for auth endpoints (login, register, etc.)
        // A 401 on these endpoints means invalid credentials, not expired token
        if (_isAuthEndpoint(err.requestOptions.path)) {
          LoggingService.auth('Received 401 on auth endpoint, skipping token refresh: ${err.requestOptions.path}');
          handler.next(err);
          return;
        }
        
        LoggingService.auth('Received 401 error, attempting token refresh');
        
        if (_authLocalDataSource == null) {
          LoggingService.auth('AuthLocalDataSource not available for token refresh');
          handler.next(err);
          return;
        }
        
        final refreshed = await _refreshToken();
        if (refreshed) {
          // Retry the original request with new token
          final token = await _authLocalDataSource!.getAccessToken();
          if (token != null) {
            err.requestOptions.headers['Authorization'] = 'Bearer $token';
            
            try {
              final response = await Dio().fetch(err.requestOptions);
              LoggingService.auth('Request retry successful after token refresh');
              handler.resolve(response);
              return;
            } catch (e) {
              LoggingService.error('Request retry failed after token refresh', e, StackTrace.current);
              // If retry fails, clear tokens and continue with error
              await _authLocalDataSource!.clearTokens();
              // Trigger logout and redirect to login
              await AuthSessionService.instance.handleSessionExpiration();
            }
          }
        } else {
          LoggingService.auth('Token refresh failed, clearing tokens');
          // Refresh failed, clear tokens
          await _authLocalDataSource!.clearTokens();
          // Trigger logout and redirect to login
          await AuthSessionService.instance.handleSessionExpiration();
        }
      }

      handler.next(err);
    } catch (e) {
      LoggingService.error('Auth interceptor error handling', e, StackTrace.current);
      handler.next(err);
    }
  }

  /// Check if the endpoint is an auth endpoint (should skip authentication)
  bool _isAuthEndpoint(String path) {
    final authEndpoints = [
      ApiEndpoints.login,
      ApiEndpoints.register,
      ApiEndpoints.registerUser,
      ApiEndpoints.forgotPassword,
      ApiEndpoints.resetPassword,
      ApiEndpoints.verifyAccount,
      ApiEndpoints.resendOtp,
      ApiEndpoints.validateOtp,
      ApiEndpoints.refreshToken,
    ];
    
    return authEndpoints.any((endpoint) => path.contains(endpoint));
  }

  /// Attempt to refresh the authentication token
  Future<bool> _refreshToken() async {
    try {
      if (_authLocalDataSource == null) {
        LoggingService.auth('AuthLocalDataSource not available for token refresh');
        return false;
      }
      
      final refreshToken = await _authLocalDataSource!.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        LoggingService.auth('No refresh token available for token refresh');
        return false;
      }

      LoggingService.auth('Attempting token refresh');
      
      final dio = Dio();
      final response = await dio.post(
        ApiEndpoints.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          final newToken = data['access_token'] as String?;
          final newRefreshToken = data['refresh_token'] as String?;
          
          if (newToken != null) {
            // Save the new tokens using AuthLocalDataSource
            await _authLocalDataSource!.saveTokens(
              AuthToken(
                accessToken: newToken,
                refreshToken: newRefreshToken ?? refreshToken,
              ),
            );
            LoggingService.auth('Token refresh successful');
            return true;
          }
        }
      }
    } catch (e) {
      LoggingService.error('Token refresh failed', e, StackTrace.current);
    }
    
    return false;
  }
}