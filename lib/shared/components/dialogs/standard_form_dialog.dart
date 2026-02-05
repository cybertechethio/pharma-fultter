import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/brand_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../forms/custom_button.dart';

/// Reusable standard form dialog component
/// Handles common dialog structure (header, content, actions)
/// Features provide their own form fields and submit logic
class StandardFormDialog extends ConsumerWidget {
  /// Dialog title
  final String title;
  
  /// Submit button text
  final String buttonText;
  
  /// Form key for validation
  final GlobalKey<FormState> formKey;
  
  /// Whether the form is in loading state
  final bool isLoading;
  
  /// Loading text to display on button (optional, defaults to buttonText)
  final String? loadingText;
  
  /// Submit handler - called when form is valid
  final Future<void> Function() onSubmit;
  
  /// Builder function that returns form fields
  /// Receives context and l10n for convenience
  final Widget Function(BuildContext context, AppLocalizations l10n) formFieldsBuilder;
  
  /// Optional event provider to listen to for auto-close
  /// When event is received, dialog will close automatically
  /// Pass the provider directly (e.g., expenseCategoryUiEventsProvider)
  final dynamic eventProvider;
  
  /// Optional function to check if event should trigger close
  /// If null, any non-null event will trigger close
  final bool Function(dynamic event)? shouldCloseOnEvent;
  
  /// Optional function to clear event after handling
  final void Function()? onEventHandled;

  const StandardFormDialog({
    super.key,
    required this.title,
    required this.buttonText,
    required this.formKey,
    required this.isLoading,
    this.loadingText,
    required this.onSubmit,
    required this.formFieldsBuilder,
    this.eventProvider,
    this.shouldCloseOnEvent,
    this.onEventHandled,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final effectiveLoadingText = loadingText ?? buttonText;

    // Listen to events for auto-close if eventProvider is provided
    if (eventProvider != null) {
      ref.listen<dynamic>(
        eventProvider as dynamic,
        (prev, next) {
          if (next == null) return;
          
          // Check if we should close on this event
          final shouldClose = shouldCloseOnEvent?.call(next) ?? true;
          if (!shouldClose) return;
          
          // Close dialog if mounted
          if (context.mounted) {
            context.pop();
          }
          
          // Clear event if handler provided
          onEventHandled?.call();
        },
      );
    }

    return Dialog(
      elevation: 0,
      backgroundColor: BrandColors.transparent,
      insetPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.lg,
        vertical: AppSizes.xl,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: BrandColors.background,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          boxShadow: [
            BoxShadow(
              color: BrandColors.shadow,
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.xl,
                AppSizes.xl,
                AppSizes.lg,
                AppSizes.lg,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: BrandColors.divider,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: BrandColors.textPrimary,
                          ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: Container(
                      padding: const EdgeInsets.all(AppSizes.xs),
                      decoration: BoxDecoration(
                        color: BrandColors.inputBackground,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.close_rounded,
                        color: BrandColors.textSecondary,
                        size: AppSizes.iconSize,
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    tooltip: l10n.cancel,
                  ),
                ],
              ),
            ),
            // Content Section
            Padding(
              padding: const EdgeInsets.all(AppSizes.xl),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      formFieldsBuilder(context, l10n),
                    ],
                  ),
                ),
              ),
            ),
            // Actions Section
            Container(
              padding: const EdgeInsets.fromLTRB(
                AppSizes.xl,
                AppSizes.lg,
                AppSizes.xl,
                AppSizes.xl,
              ),
              decoration: BoxDecoration(
                color: BrandColors.inputBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppSizes.radiusLg),
                  bottomRight: Radius.circular(AppSizes.radiusLg),
                ),
              ),
              child: CustomButton(
                text: buttonText,
                loadingText: effectiveLoadingText,
                isLoading: isLoading,
                onPressed: isLoading
                    ? null
                    : () async {
                        if (!formKey.currentState!.validate()) return;
                        await onSubmit();
                      },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

