import '../../app/config/env_config.dart';

/// URL utility functions for handling image URLs and other URL operations
class UrlUtils {
  UrlUtils._();

  /// Convert a relative or absolute image URL to a full URL
  /// 
  /// If the URL is already absolute (starts with http:// or https://), returns it as is.
  /// If the URL is relative (starts with /), prepends the base URL.
  /// If the URL is null or empty, returns null.
  /// 
  /// Handles two cases:
  /// 1. If image URL starts with /api, uses the full base URL (with /api)
  /// 2. If image URL starts with / (but not /api), uses base URL without /api
  static String? getFullImageUrl(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return null;
    }

    // If already a full URL, return as is
    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      return imageUrl;
    }

    // If relative URL (starts with /), prepend base URL
    String baseUrl = EnvConfig.baseUrl;
    
    // If image URL already includes /api, use the full base URL (which should already have /api)
    // Otherwise, remove /api from base URL for images served from root
    if (imageUrl.startsWith('/api/')) {
      // Image URL already has /api prefix, use base URL as-is (base URL should end with /api)
      // No modification needed
    } else if (baseUrl.endsWith('/api')) {
      // Image is served from root (no /api in path), remove /api from base URL
      baseUrl = baseUrl.substring(0, baseUrl.length - 4);
    }
    
    // Ensure base URL doesn't end with / and image URL starts with /
    if (!baseUrl.endsWith('/') && !imageUrl.startsWith('/')) {
      return '$baseUrl/$imageUrl';
    } else if (baseUrl.endsWith('/') && imageUrl.startsWith('/')) {
      return '$baseUrl${imageUrl.substring(1)}';
    }
    
    return '$baseUrl$imageUrl';
  }

  /// Add cache busting parameter to URL to force refresh
  static String? addCacheBuster(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return null;
    }

    final uri = Uri.tryParse(imageUrl);
    if (uri == null) {
      return imageUrl;
    }

    // Add timestamp as cache buster
    final cacheBuster = DateTime.now().millisecondsSinceEpoch;
    return uri.replace(queryParameters: {
      ...uri.queryParameters,
      't': cacheBuster.toString(),
    }).toString();
  }

  /// Get full image URL with cache busting
  static String? getFullImageUrlWithCacheBuster(String? imageUrl) {
    final fullUrl = getFullImageUrl(imageUrl);
    return addCacheBuster(fullUrl);
  }
}