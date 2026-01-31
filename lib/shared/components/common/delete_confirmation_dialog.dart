import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cyber_pos/l10n/app_localizations.dart';

/// Reusable delete confirmation dialog that returns a boolean result
/// 
/// Features:
/// - Consistent theming with project design
/// - Localized text support
/// - Returns true if user confirms deletion, false if cancelled
/// - Customizable title and message
/// - Material Design 3 styling
class DeleteConfirmationDialog extends StatelessWidget {
  /// Title of the dialog
  final String title;
  
  /// Message to display in the dialog
  final String message;
  
  /// Text for the confirm button
  final String confirmText;
  
  /// Text for the cancel button
  final String cancelText;
  
  /// Whether to show destructive styling (red confirm button)
  final bool isDestructive;
  
  /// Custom icon for the dialog
  final IconData? icon;

  const DeleteConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmText = 'Delete',
    this.cancelText = 'Cancel',
    this.isDestructive = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return AlertDialog(
      icon: Icon(
        icon ?? (isDestructive ? Icons.warning_amber_rounded : Icons.help_outline),
        color: isDestructive ? colorScheme.error : colorScheme.primary,
      ),
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => context.pop(false),
          child: Text(cancelText),
        ),
        FilledButton(
          onPressed: () => context.pop(true),
          style: isDestructive 
            ? FilledButton.styleFrom(
                backgroundColor: colorScheme.error,
                foregroundColor: colorScheme.onError,
              )
            : null,
          child: Text(confirmText),
        ),
      ],
    );
  }
}

/// Static helper class for showing delete confirmation dialogs
class DeleteConfirmationHelper {
  /// Show a delete confirmation dialog and return the result
  /// 
  /// Returns:
  /// - `true` if user confirms deletion
  /// - `false` if user cancels or dismisses dialog
  static Future<bool> showDeleteConfirmation({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'Delete',
    String cancelText = 'Cancel',
    bool isDestructive = true,
    IconData? icon,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) => DeleteConfirmationDialog(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        isDestructive: isDestructive,
        icon: icon,
      ),
    );
    
    return result ?? false;
  }

  /// Show a delete confirmation dialog with localized text
  static Future<bool> showLocalizedDeleteConfirmation({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    bool isDestructive = true,
    IconData? icon,
  }) async {
    final l10n = AppLocalizations.of(context);
    
    return showDeleteConfirmation(
      context: context,
      title: title,
      message: message,
      confirmText: confirmText ?? l10n.delete,
      cancelText: cancelText ?? l10n.cancel,
      isDestructive: isDestructive,
      icon: icon,
    );
  }

  /// Show a delete confirmation dialog for a specific item
  static Future<bool> showItemDeleteConfirmation({
    required BuildContext context,
    required String itemName,
    String? itemType,
    String? confirmText,
    String? cancelText,
    bool isDestructive = true,
    IconData? icon,
  }) async {
    final l10n = AppLocalizations.of(context);
    final type = itemType ?? 'item';
    
    return showDeleteConfirmation(
      context: context,
      title: 'Delete ${type.capitalize()}',
      message: 'Are you sure you want to delete "$itemName"? This action cannot be undone.',
      confirmText: confirmText ?? l10n.delete,
      cancelText: cancelText ?? l10n.cancel,
      isDestructive: isDestructive,
      icon: icon,
    );
  }
}

/// Extension to capitalize strings
extension StringCapitalization on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
