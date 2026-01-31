import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

/// Dialog for entering reversal note when reversing a transaction
/// 
/// Returns the note string if user confirms, or null if cancelled
class TransactionReversalDialog extends StatefulWidget {
  /// The transaction number being reversed
  final String transactionNumber;
  
  /// The type of transaction being reversed (e.g., 'Purchase', 'Sale')
  final String transactionType;

  const TransactionReversalDialog({
    super.key,
    required this.transactionNumber,
    required this.transactionType,
  });

  @override
  State<TransactionReversalDialog> createState() => _TransactionReversalDialogState();
}

class _TransactionReversalDialogState extends State<TransactionReversalDialog> {
  final _noteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AlertDialog(
      icon: Icon(
        Icons.undo_rounded,
        color: colorScheme.error,
        size: 32,
      ),
      title: Text(l10n.reverseTransaction),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Transaction info
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.transactionNumber,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.transactionType,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Warning message
            Text(
              l10n.reverseTransactionMessage,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            // Note input
            TextField(
              controller: _noteController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: l10n.reversalNote,
                hintText: l10n.reversalNoteHint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(null),
          child: Text(l10n.cancel),
        ),
        FilledButton.icon(
          onPressed: () {
            // Return the note (can be empty)
            Navigator.of(context).pop(_noteController.text.trim());
          },
          style: FilledButton.styleFrom(
            backgroundColor: colorScheme.error,
            foregroundColor: colorScheme.onError,
          ),
          icon: const Icon(Icons.undo_rounded, size: 18),
          label: Text(l10n.reverse),
        ),
      ],
    );
  }
}

/// Helper class for showing the transaction reversal dialog
class TransactionReversalHelper {
  /// Show the reversal dialog and return the note if user confirms
  /// 
  /// Returns:
  /// - The note string (can be empty) if user confirms
  /// - `null` if user cancels or dismisses dialog
  static Future<String?> showReversalDialog({
    required BuildContext context,
    required String transactionNumber,
    required String transactionType,
  }) async {
    return showDialog<String?>(
      context: context,
      barrierDismissible: true,
      builder: (context) => TransactionReversalDialog(
        transactionNumber: transactionNumber,
        transactionType: transactionType,
      ),
    );
  }
}

