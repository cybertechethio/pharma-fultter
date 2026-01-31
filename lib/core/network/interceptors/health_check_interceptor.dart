import 'package:dio/dio.dart';
import '../api_service.dart';
import '../../constants/api_endpoints.dart';
import '../../services/logging_service.dart';

class HealthCheckInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!options.path.contains('/health')) {
      try {
        await ApiService.get(ApiEndpoints.health);
        LoggingService.info('Health check============================================= OK'); // Green color
      } catch (e) {
        LoggingService.error('Health check============================================: FAILED'); // Red color
      }
    }
    handler.next(options);
  }
}
