import 'package:intl/intl.dart';

/// Utility class for formatting various data types for display
class Formatters {
  Formatters._();

  /// Format DateTime as "MMM dd, yyyy • hh:mm a"
  /// Example: "Nov 22, 2025 • 08:15 AM"
  static String formatDateTime(DateTime dateTime) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    final timeFormat = DateFormat('hh:mm a');
    return '${dateFormat.format(dateTime)} • ${timeFormat.format(dateTime)}';
  }

  /// Format DateTime as relative time with time
  /// Example: "3 days ago • 08:10 AM", "5 min ago", "just now"
  static String formatRelativeTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    final timeFormat = DateFormat('hh:mm a');
    final timeStr = timeFormat.format(dateTime);

    if (difference.inDays > 0) {
      final days = difference.inDays;
      return '$days ${days == 1 ? 'day' : 'days'} ago • $timeStr';
    } else if (difference.inHours > 0) {
      final hours = difference.inHours;
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago • $timeStr';
    } else if (difference.inMinutes > 0) {
      final minutes = difference.inMinutes;
      return '$minutes ${minutes == 1 ? 'min' : 'mins'} ago • $timeStr';
    } else {
      return 'just now • $timeStr';
    }
  }

  /// Format amount as currency with Birr
  /// Example: "250.00 Birr"
  static String formatAmount(double amount) {
    return '${amount.toStringAsFixed(2)} Birr';
  }

  /// Format amount as currency (alias for formatAmount)
  /// Example: "250.00 Birr"
  static String formatCurrency(double amount) {
    final format = NumberFormat.currency(symbol: '', decimalDigits: 2);
    return '${format.format(amount)} Birr';
  }

  /// Format quantity with appropriate precision
  /// Example: "10", "10.5", "10.25"
  static String formatQuantity(double quantity) {
    if (quantity == quantity.roundToDouble()) {
      return quantity.toInt().toString();
    }
    return quantity.toStringAsFixed(2).replaceAll(RegExp(r'\.?0+$'), '');
  }

  /// Format DateTime as relative time (without time component)
  /// Example: "3 days ago", "5 hours ago", "2 minutes ago", "Just now"
  static String formatRelativeDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }
}

