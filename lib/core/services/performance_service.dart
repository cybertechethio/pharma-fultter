import 'dart:async';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Performance monitoring service for the application
/// 
/// Provides:
/// - Custom trace monitoring
/// - Network request monitoring
/// - Screen performance tracking
/// - Memory usage monitoring
/// - App startup time tracking
class PerformanceService {
  static final PerformanceService _instance = PerformanceService._internal();
  factory PerformanceService() => _instance;
  PerformanceService._internal();

  final Map<String, Stopwatch> _activeTraces = {};
  final Map<String, Stopwatch> _activeHttpMetrics = {};

  /// Initialize performance monitoring
  Future<void> initialize() async {
    if (kDebugMode) {
      developer.log('Performance monitoring initialized');
    }
  }

  /// Start a custom trace
  Stopwatch startTrace(String traceName) {
    final stopwatch = Stopwatch()..start();
    _activeTraces[traceName] = stopwatch;
    
    if (kDebugMode) {
      developer.log('Started trace: $traceName');
    }
    
    return stopwatch;
  }

  /// Stop a custom trace
  Future<void> stopTrace(String traceName) async {
    final stopwatch = _activeTraces.remove(traceName);
    if (stopwatch != null) {
      stopwatch.stop();
      
      if (kDebugMode) {
        developer.log('Stopped trace: $traceName (Duration: ${stopwatch.elapsedMilliseconds}ms)');
      }
    }
  }

  /// Add metric to a trace (simplified - just logs in debug mode)
  void addTraceMetric(String traceName, String metricName, int value) {
    if (kDebugMode) {
      developer.log('Trace $traceName metric $metricName: $value');
    }
  }

  /// Add attribute to a trace (simplified - just logs in debug mode)
  void addTraceAttribute(String traceName, String attributeName, String value) {
    if (kDebugMode) {
      developer.log('Trace $traceName attribute $attributeName: $value');
    }
  }

  /// Start monitoring a network request
  Stopwatch startNetworkTrace(String url, String method) {
    final stopwatch = Stopwatch()..start();
    _activeHttpMetrics[url] = stopwatch;
    
    if (kDebugMode) {
      developer.log('Started network trace: $method $url');
    }
    
    return stopwatch;
  }

  /// Stop monitoring a network request
  Future<void> stopNetworkTrace(String url, {
    int? responseCode,
    int? requestPayloadSize,
    int? responsePayloadSize,
  }) async {
    final stopwatch = _activeHttpMetrics.remove(url);
    if (stopwatch != null) {
      stopwatch.stop();
      
      if (kDebugMode) {
        developer.log('Stopped network trace: $url (Status: $responseCode, Duration: ${stopwatch.elapsedMilliseconds}ms)');
      }
    }
  }

  /// Track screen performance
  Future<void> trackScreenPerformance(String screenName, Duration loadTime) async {
    final trace = startTrace('screen_$screenName');
    addTraceMetric('screen_$screenName', 'load_time_ms', loadTime.inMilliseconds);
    await stopTrace('screen_$screenName');
    
    if (kDebugMode) {
      developer.log('Screen performance: $screenName took ${loadTime.inMilliseconds}ms');
    }
  }

  /// Track app startup time
  Future<void> trackAppStartup(Duration startupTime) async {
    final trace = startTrace('app_startup');
    addTraceMetric('app_startup', 'startup_time_ms', startupTime.inMilliseconds);
    await stopTrace('app_startup');
    
    if (kDebugMode) {
      developer.log('App startup took ${startupTime.inMilliseconds}ms');
    }
  }

  /// Track user interaction performance
  Future<void> trackUserInteraction(String interactionName, Duration duration) async {
    final trace = startTrace('interaction_$interactionName');
    addTraceMetric('interaction_$interactionName', 'duration_ms', duration.inMilliseconds);
    await stopTrace('interaction_$interactionName');
    
    if (kDebugMode) {
      developer.log('User interaction: $interactionName took ${duration.inMilliseconds}ms');
    }
  }

  /// Track database operation performance
  Future<void> trackDatabaseOperation(String operation, Duration duration) async {
    final trace = startTrace('database_$operation');
    addTraceMetric('database_$operation', 'duration_ms', duration.inMilliseconds);
    await stopTrace('database_$operation');
    
    if (kDebugMode) {
      developer.log('Database operation: $operation took ${duration.inMilliseconds}ms');
    }
  }

  /// Track API call performance
  Future<void> trackApiCall(String endpoint, Duration duration, int statusCode) async {
    final trace = startTrace('api_$endpoint');
    addTraceMetric('api_$endpoint', 'duration_ms', duration.inMilliseconds);
    addTraceMetric('api_$endpoint', 'status_code', statusCode);
    await stopTrace('api_$endpoint');
    
    if (kDebugMode) {
      developer.log('API call: $endpoint took ${duration.inMilliseconds}ms (Status: $statusCode)');
    }
  }

  /// Track memory usage
  Future<void> trackMemoryUsage(int memoryUsageMB) async {
    if (kDebugMode) {
      developer.log('Memory usage: ${memoryUsageMB}MB');
    }
  }

  /// Track battery usage
  Future<void> trackBatteryUsage(int batteryLevel) async {
    if (kDebugMode) {
      developer.log('Battery level: $batteryLevel%');
    }
  }

  /// Track network connectivity
  Future<void> trackNetworkConnectivity(String connectionType, int speedMbps) async {
    if (kDebugMode) {
      developer.log('Network: $connectionType at ${speedMbps}Mbps');
    }
  }

  /// Track app crash
  Future<void> trackAppCrash(String error, String stackTrace) async {
    if (kDebugMode) {
      developer.log('App crash: $error');
      developer.log('Stack trace: $stackTrace');
    }
  }

  /// Track feature usage
  Future<void> trackFeatureUsage(String featureName, Map<String, dynamic>? parameters) async {
    if (kDebugMode) {
      developer.log('Feature usage: $featureName');
      if (parameters != null) {
        developer.log('Parameters: $parameters');
      }
    }
  }

  /// Track user engagement
  Future<void> trackUserEngagement(String action, Duration sessionDuration) async {
    if (kDebugMode) {
      developer.log('User engagement: $action (Session: ${sessionDuration.inSeconds}s)');
    }
  }

  /// Track app performance metrics
  Future<void> trackAppPerformance({
    required int memoryUsageMB,
    required int batteryLevel,
    required String networkType,
    required int networkSpeedMbps,
  }) async {
    if (kDebugMode) {
      developer.log('App performance: Memory: ${memoryUsageMB}MB, Battery: $batteryLevel%, Network: $networkType at ${networkSpeedMbps}Mbps');
    }
  }

  /// Get performance collection status (simplified)
  Future<bool> isPerformanceCollectionEnabled() async {
    return kDebugMode;
  }

  /// Set performance collection enabled (simplified)
  Future<void> setPerformanceCollectionEnabled(bool enabled) async {
    if (kDebugMode) {
      developer.log('Performance collection ${enabled ? 'enabled' : 'disabled'}');
    }
  }

  /// Clean up resources
  Future<void> dispose() async {
    // Stop all active traces
    for (final stopwatch in _activeTraces.values) {
      stopwatch.stop();
    }
    _activeTraces.clear();

    // Stop all active HTTP metrics
    for (final stopwatch in _activeHttpMetrics.values) {
      stopwatch.stop();
    }
    _activeHttpMetrics.clear();
  }
}

/// Performance monitoring mixin for widgets
mixin PerformanceMixin<T extends StatefulWidget> on State<T> {
  late final Stopwatch _stopwatch;
  String get screenName => widget.runtimeType.toString();

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch()..start();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      PerformanceService().trackScreenPerformance(
        screenName,
        _stopwatch.elapsed,
      );
    }
  }

  @override
  void dispose() {
    _stopwatch.stop();
    super.dispose();
  }
}

/// Performance monitoring extension for functions
extension PerformanceExtension<T> on Future<T> Function() {
  Future<T> withPerformanceTracking(String operationName) async {
    final stopwatch = Stopwatch()..start();
    try {
      final result = await this();
      stopwatch.stop();
      PerformanceService().trackUserInteraction(operationName, stopwatch.elapsed);
      return result;
    } catch (e) {
      stopwatch.stop();
      PerformanceService().trackUserInteraction('${operationName}_error', stopwatch.elapsed);
      rethrow;
    }
  }
}
