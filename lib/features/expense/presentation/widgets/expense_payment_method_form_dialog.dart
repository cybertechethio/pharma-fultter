import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/dialogs/standard_form_dialog.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../core/enums/payment_method_type_enum.dart';
import '../../../../core/services/snackbar_service.dart' show snackbarServiceProvider;
import '../../../../shared/utils/url_utils.dart';
import '../../../../shared/components/common/full_screen_image_viewer.dart';
import '../../../../shared/components/common/local_file_image_preview.dart';
import '../../../../shared/components/common/image_picker_bottom_sheet.dart';
import '../../../bank/domain/entities/bank.dart';
import '../../../bank/presentation/providers/bank_notifier.dart';
import '../../domain/entities/expense_detail.dart';
import '../providers/expense_payment_methods_notifier.dart';
import '../providers/expense_loading_providers.dart';
import '../providers/expense_events.dart';

/// Expense-specific payment method form dialog.
/// Mirrors PaymentMethodFormDialog (transaction) - displays existing attachment URLs
/// and handles new file uploads, calling expense APIs instead.
class ExpensePaymentMethodFormDialog extends ConsumerStatefulWidget {
  final String expenseId;
  final String title;
  final String buttonText;
  final ExpensePaymentMethod? initial;

  const ExpensePaymentMethodFormDialog({
    super.key,
    required this.expenseId,
    required this.title,
    required this.buttonText,
    this.initial,
  });

  @override
  ConsumerState<ExpensePaymentMethodFormDialog> createState() =>
      _ExpensePaymentMethodFormDialogState();
}

class _ExpensePaymentMethodFormDialogState
    extends ConsumerState<ExpensePaymentMethodFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late PaymentMethodType _selectedMethod;
  late final TextEditingController _amountController;
  late final TextEditingController _referenceNumberController;
  int? _selectedBankId;
  String? _attachmentUrl; // URL from backend (when editing)
  String? _attachmentFilePath; // New file path (when user picks new file)

  @override
  void initState() {
    super.initState();
    if (widget.initial != null) {
      _selectedMethod =
          PaymentMethodTypeExtension.fromString(widget.initial!.method);
      _amountController =
          TextEditingController(text: widget.initial!.amount);
      _referenceNumberController = TextEditingController(
          text: widget.initial!.referenceNumber ?? '');
      _selectedBankId = widget.initial!.bankId;
      // Store URL from backend (for display), file path will be null until user picks new file
      final attachment = widget.initial!.attachment;
      if (attachment != null &&
          (attachment.startsWith('http://') ||
              attachment.startsWith('https://') ||
              attachment.startsWith('/'))) {
        _attachmentUrl = attachment;
        _attachmentFilePath = null;
      } else {
        // If it's a local file path
        _attachmentFilePath = attachment;
        _attachmentUrl = null;
      }
    } else {
      _selectedMethod = PaymentMethodType.cash;
      _amountController = TextEditingController();
      _referenceNumberController = TextEditingController();
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _referenceNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final creating = ref.watch(expensePaymentMethodUpdateLoadingProvider).contains('creating');
    final isEditing = widget.initial != null;
    final isUpdating =
        isEditing &&
            ref.watch(expensePaymentMethodUpdateLoadingProvider).contains(widget.initial!.id);
    final banksAsync = ref.watch(bankProvider);

    return StandardFormDialog(
      title: widget.title,
      buttonText: widget.buttonText,
      formKey: _formKey,
      isLoading: creating || isUpdating,
      loadingText: isEditing ? l10n.updating : l10n.creating,
      onSubmit: () async {
        if (!mounted) return;

        if (_selectedMethod == PaymentMethodType.bankTransfer &&
            _selectedBankId == null) {
          final snackbar = ref.read(snackbarServiceProvider);
          snackbar.showInfo(l10n.pleaseSelectBank);
          return;
        }

        final amount = double.tryParse(_amountController.text.trim());
        if (amount == null || amount <= 0) {
          final snackbar = ref.read(snackbarServiceProvider);
          snackbar.showInfo(l10n.pleaseEnterValidAmount);
          return;
        }

        final notifier = ref.read(expensePaymentMethodsProvider.notifier);

        if (isEditing) {
          await notifier.updatePaymentMethod(
            expenseId: widget.expenseId,
            paymentMethodId: widget.initial!.id,
            method: _selectedMethod.toApiString(),
            amount: amount.toString(),
            referenceNumber: _referenceNumberController.text.trim().isEmpty
                ? null
                : _referenceNumberController.text.trim(),
            bankId: _selectedBankId,
            attachment: _attachmentFilePath,
          );
        } else {
          await notifier.createPaymentMethod(
            expenseId: widget.expenseId,
            method: _selectedMethod.toApiString(),
            amount: amount.toString(),
            referenceNumber: _referenceNumberController.text.trim().isEmpty
                ? null
                : _referenceNumberController.text.trim(),
            bankId: _selectedBankId,
            attachment: _attachmentFilePath,
          );
        }
      },
      formFieldsBuilder: (context, l10n) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomDropdown<PaymentMethodType>(
            value: _selectedMethod,
            items: PaymentMethodType.values.map((method) {
              return DropdownItem<PaymentMethodType>(
                value: method,
                label: method.getDisplayLabel(),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedMethod = value;
                  if (!value.requiresBank()) {
                    _selectedBankId = null;
                  }
                });
              }
            },
            label: l10n.paymentMethod,
            hintText: l10n.selectPaymentMethod,
            required: true,
          ),
          const SizedBox(height: AppSizes.md),
          CustomTextField(
            controller: _amountController,
            labelText: l10n.expenseAmount,
            inputType: const TextInputType.numberWithOptions(decimal: true),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return l10n.amountRequired;
              }
              final amount = double.tryParse(value.trim());
              if (amount == null || amount <= 0) {
                return l10n.pleaseEnterValidAmount;
              }
              return null;
            },
          ),
          const SizedBox(height: AppSizes.md),
          CustomTextField(
            controller: _referenceNumberController,
            labelText: l10n.referenceNumber,
          ),
          if (_selectedMethod == PaymentMethodType.bankTransfer) ...[
            const SizedBox(height: AppSizes.md),
            _buildBankSelector(context, banksAsync),
          ],
          const SizedBox(height: AppSizes.md),
          _buildAttachmentPicker(),
        ],
      ),
      eventProvider: expenseUiEventsProvider,
      shouldCloseOnEvent: (event) => event is ExpensePaymentMethodUpdated,
      onEventHandled: () => ref.read(expenseUiEventsProvider.notifier).clear(),
    );
  }

  Widget _buildBankSelector(
      BuildContext context, AsyncValue<List<BankEntity>> banksAsync) {
    final l10n = AppLocalizations.of(context);
    return banksAsync.when(
      loading: () => const SizedBox(
        height: 48,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Container(
        height: 48,
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: BrandColors.error.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(AppSizes.radiusXs),
        ),
        child: Center(
          child: Text(
            l10n.failedToLoadBanks,
            style: context.body().copyWith(
                  color: BrandColors.error,
                ),
          ),
        ),
      ),
      data: (banks) {
        if (banks.isEmpty) {
          return Container(
            height: 48,
            padding: const EdgeInsets.all(AppSizes.md),
            decoration: BoxDecoration(
              color: BrandColors.error.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppSizes.radiusXs),
            ),
            child: Center(
              child: Text(
                l10n.noBanksAvailable,
                style: context.body().copyWith(
                      color: BrandColors.error,
                    ),
              ),
            ),
          );
        }
        return CustomDropdown<int>(
          value: _selectedBankId,
          items: banks.map((bank) {
            return DropdownItem<int>(value: bank.id, label: bank.name);
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() => _selectedBankId = value);
            }
          },
          label: l10n.selectBankRequired,
          hintText: l10n.selectBankPlaceholder,
          required: true,
        );
      },
    );
  }

  Widget _buildAttachmentPicker() {
    final l10n = AppLocalizations.of(context);
    final hasAttachment = _attachmentUrl != null || _attachmentFilePath != null;
    final isUrl = _attachmentUrl != null &&
        (_attachmentUrl!.startsWith('http://') ||
            _attachmentUrl!.startsWith('https://') ||
            _attachmentUrl!.startsWith('/'));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => _pickImage(context),
          borderRadius: BorderRadius.circular(AppSizes.radiusSm),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: hasAttachment
                  ? BrandColors.primaryContainer.withValues(alpha: 0.15)
                  : BrandColors.surfaceContainerHighest.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              border: Border.all(
                color: hasAttachment
                    ? BrandColors.primary.withValues(alpha: 0.3)
                    : BrandColors.outline.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSizes.sm),
                  decoration: BoxDecoration(
                    color: hasAttachment
                        ? BrandColors.primary.withValues(alpha: 0.1)
                        : BrandColors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  ),
                  child: Icon(
                    hasAttachment
                        ? Icons.check_circle_rounded
                        : Icons.add_photo_alternate_outlined,
                    color: hasAttachment
                        ? BrandColors.primary
                        : BrandColors.textMuted,
                    size: AppSizes.iconSize,
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hasAttachment ? l10n.receiptAttached : l10n.addReceipt,
                        style: context.body().copyWith(
                              color: hasAttachment
                                  ? BrandColors.textPrimary
                                  : BrandColors.textMuted,
                              fontWeight:
                                  hasAttachment ? FontWeight.w500 : FontWeight.normal,
                            ),
                      ),
                      if (!hasAttachment)
                        Text(
                          l10n.tapToUpload,
                          style: context.small().copyWith(
                                color: BrandColors.textMuted.withValues(alpha: 0.7),
                              ),
                        ),
                    ],
                  ),
                ),
                if (hasAttachment)
                  IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      size: 18,
                      color: BrandColors.textMuted,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    visualDensity: VisualDensity.compact,
                    onPressed: () => setState(() {
                      _attachmentUrl = null;
                      _attachmentFilePath = null;
                    }),
                    tooltip: l10n.remove,
                  )
                else
                  Icon(
                    Icons.chevron_right_rounded,
                    color: BrandColors.textMuted.withValues(alpha: 0.5),
                    size: AppSizes.iconSize,
                  ),
              ],
            ),
          ),
        ),
        if (hasAttachment) ...[
          const SizedBox(height: AppSizes.sm2),
          GestureDetector(
            onTap: () => _showPreview(context),
            child: Container(
              height: 72,
              width: 72,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                border: Border.all(
                  color: BrandColors.outline.withValues(alpha: 0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: BrandColors.shadow.withValues(alpha: 0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radiusXs2),
                child: isUrl
                    ? CachedNetworkImage(
                        imageUrl:
                            UrlUtils.getFullImageUrl(_attachmentUrl!) ??
                                _attachmentUrl!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          color: BrandColors.surfaceContainerHighest,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: AppSizes.loaderStrokeWidth,
                              valueColor: AlwaysStoppedAnimation<Color>(BrandColors.primary),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: BrandColors.error.withValues(alpha: 0.1),
                          child: Icon(
                            Icons.error_outline,
                            color: BrandColors.error,
                            size: AppSizes.iconSizeLg,
                          ),
                        ),
                      )
                    : Image.file(
                        File(_attachmentFilePath!),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _pickImage(BuildContext context) async {
    final source = await ImagePickerBottomSheet.show(context);
    if (source == null) return;

    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 1024,
      maxHeight: 1024,
    );

    if (image != null) {
      setState(() {
        _attachmentFilePath = image.path;
        _attachmentUrl = null;
      });
    }
  }

  void _showPreview(BuildContext context) {
    if (_attachmentUrl != null) {
      final imageUrl = UrlUtils.getFullImageUrl(_attachmentUrl!);
      if (imageUrl != null) {
        final l10n = AppLocalizations.of(context);
        FullScreenImageViewer.show(
          context: context,
          imageUrl: imageUrl,
          title: l10n.receipt,
        );
      }
    } else if (_attachmentFilePath != null) {
      final l10n = AppLocalizations.of(context);
      LocalFileImagePreview.show(
        context: context,
        filePath: _attachmentFilePath!,
        title: l10n.receipt,
      );
    }
  }
}
