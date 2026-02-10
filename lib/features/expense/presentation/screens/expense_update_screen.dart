import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/components/forms/date_picker_field.dart';
import '../../../../shared/utils/url_utils.dart';
import '../../domain/entities/expense.dart';
import '../providers/expense_notifier.dart';
import '../providers/expense_events.dart';
import '../providers/expense_loading_providers.dart';

class ExpenseUpdateScreen extends ConsumerStatefulWidget {
  final Expense? expense;

  const ExpenseUpdateScreen({super.key, this.expense});

  @override
  ConsumerState<ExpenseUpdateScreen> createState() => _ExpenseUpdateScreenState();
}

class _ExpenseUpdateScreenState extends ConsumerState<ExpenseUpdateScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  late final TextEditingController _nameController;
  late final TextEditingController _amountController;
  late final TextEditingController _notesController;
  late final TextEditingController _expenseDateController;

  // State variables
  late DateTime _selectedDate;
  final List<String> _attachmentFilePaths = [];
  late List<String> _existingAttachments;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing expense data
    _nameController = TextEditingController(text: widget.expense?.name ?? '');
    _amountController = TextEditingController(text: widget.expense?.amount ?? '');
    _notesController = TextEditingController(); // Notes field - will be empty for now since not stored
    _expenseDateController = TextEditingController();

    // Initialize state with existing expense data
    _selectedDate = widget.expense?.expenseDate ?? DateTime.now();
    _existingAttachments = List.from(widget.expense?.attachments ?? []);
    _expenseDateController.text = '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}';
    _expenseDateController.addListener(_syncExpenseDate);
  }

  @override
  void dispose() {
    _expenseDateController.removeListener(_syncExpenseDate);
    _expenseDateController.dispose();
    _nameController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _syncExpenseDate() {
    final t = _expenseDateController.text.trim();
    if (t.isEmpty) {
      setState(() => _selectedDate = DateTime.now());
      return;
    }
    final d = DateTime.tryParse(t);
    if (d != null) {
      setState(() => _selectedDate = d);
    }
  }


  Future<void> _pickImages() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 85,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (images.isNotEmpty) {
        setState(() {
          _attachmentFilePaths.addAll(images.map((img) => img.path));
        });
      }
    } catch (e) {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.errorPickingImages(e.toString()))),
        );
      }
    }
  }

  void _removeImage(int index) {
    setState(() {
      _attachmentFilePaths.removeAt(index);
    });
  }

  void _removeExistingAttachment(int index) {
    setState(() {
      _existingAttachments.removeAt(index);
    });
  }

  void _showImagePreview(String imagePath) {
    // Check if it's a URL or file path
    if (imagePath.startsWith('http')) {
      // It's a URL - show network image
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.contain,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(BrandColors.primary),
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: Icon(
                    Icons.broken_image,
                    color: BrandColors.textSecondary,
                    size: 64,
                  ),
                ),
              ),
              Positioned(
                top: AppSizes.sm,
                right: AppSizes.sm,
                child: IconButton(
                  icon: Icon(Icons.close, color: BrandColors.textLight),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      // It's a file path - show file image
      showDialog(
        context: context,
        builder: (context) => Dialog(
          child: Stack(
            children: [
              Image.file(
                File(imagePath),
                fit: BoxFit.contain,
              ),
              Positioned(
                top: AppSizes.sm,
                right: AppSizes.sm,
                child: IconButton(
                  icon: Icon(Icons.close, color: BrandColors.textLight),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final l10n = AppLocalizations.of(context);

    if (widget.expense == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.expenseDataNotFound)),
        );
      return;
    }

    final amount = double.tryParse(_amountController.text.trim());
    if (amount == null || amount <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.pleaseEnterValidAmount)),
        );
      return;
    }

    await ref.read(expenseProvider.notifier).updateExpense(
      id: widget.expense!.id,
      expenseDate: _selectedDate,
      name: _nameController.text.trim(),
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      attachmentUrls: _existingAttachments.isEmpty ? null : _existingAttachments,
      attachmentFilePaths: _attachmentFilePaths.isEmpty ? null : _attachmentFilePaths,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final updating = ref.watch(expenseUpdateLoadingProvider).contains(widget.expense?.id ?? '');

    // Listen to events
    ref.listen<ExpenseUiEvent?>(
      expenseUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        if (next is ExpenseUpdated) {
          if (mounted) {
            context.pop();
          }
        }
        ref.read(expenseUiEventsProvider.notifier).clear();
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.editExpense,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    labelText: l10n.expenseName,
                    controller: _nameController,
                    prefixIcon: Icons.description_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return l10n.expenseNameRequired;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: AppSizes.lg),
                  CustomTextField(
                    labelText: l10n.expenseAmount,
                    controller: _amountController,
                    prefixIcon: Icons.attach_money,
                    inputType: TextInputType.number,
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
                  const SizedBox(height: AppSizes.lg),
                  DatePickerField(
                    labelText: l10n.expenseDate,
                    controller: _expenseDateController,
                    prefixIcon: Icons.calendar_today_outlined,
                    firstDate: DateTime(2020),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? l10n.fieldRequired : null,
                  ),
                  const SizedBox(height: AppSizes.lg),
                  CustomTextField(
                    labelText: l10n.notes,
                    controller: _notesController,
                    prefixIcon: Icons.notes_outlined,
                    maxLines: 3,
                    subtle: true,
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.xxl),

              // Attachments Section (title + add button on same row)
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.attachments,
                            style: context.subtitle(bold: true),
                          ),
                          TextButton.icon(
                            onPressed: _pickImages,
                            icon: Icon(Icons.add, size: AppSizes.md2),
                            label: Text(l10n.add),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.md,
                                vertical: AppSizes.xs,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (_existingAttachments.isNotEmpty || _attachmentFilePaths.isNotEmpty) ...[
                        const SizedBox(height: AppSizes.lg),
                        SizedBox(
                          height: 100,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                // Existing attachments (URLs)
                                ...List.generate(
                                  _existingAttachments.length,
                                  (index) => Container(
                                    margin: EdgeInsets.only(
                                      right: (index < _existingAttachments.length - 1) ||
                                             _attachmentFilePaths.isNotEmpty
                                          ? AppSizes.sm
                                          : 0,
                                    ),
                                    child: Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            final imageUrl = UrlUtils.getFullImageUrl(_existingAttachments[index]);
                                            if (imageUrl != null) {
                                              _showImagePreview(imageUrl);
                                            }
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                                              border: Border.all(color: BrandColors.outline),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                                              child: Builder(
                                                builder: (context) {
                                                  final imageUrl = UrlUtils.getFullImageUrl(_existingAttachments[index]);
                                                  if (imageUrl == null) {
                                                    return Container(
                                                      color: BrandColors.surfaceContainerHighest,
                                                      child: Icon(
                                                        Icons.broken_image,
                                                        color: BrandColors.textSecondary,
                                                        size: AppSizes.iconSize,
                                                      ),
                                                    );
                                                  }

                                                  return CachedNetworkImage(
                                                    imageUrl: imageUrl,
                                                    fit: BoxFit.cover,
                                                    width: 100,
                                                    height: 100,
                                                    placeholder: (context, url) => Container(
                                                      color: BrandColors.surfaceContainerHighest,
                                                      child: Center(
                                                        child: CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                          valueColor: AlwaysStoppedAnimation<Color>(BrandColors.primary),
                                                        ),
                                                      ),
                                                    ),
                                                    errorWidget: (context, url, error) => Container(
                                                      color: BrandColors.surfaceContainerHighest,
                                                      child: Icon(
                                                        Icons.broken_image,
                                                        color: BrandColors.textSecondary,
                                                        size: AppSizes.iconSize,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: AppSizes.xs,
                                          right: AppSizes.xs,
                                          child: CircleAvatar(
                                            radius: AppSizes.md,
                                            backgroundColor: BrandColors.error,
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              iconSize: AppSizes.lg,
                                              icon: Icon(Icons.close, color: BrandColors.textLight),
                                              onPressed: () => _removeExistingAttachment(index),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // New file attachments
                                ...List.generate(
                                  _attachmentFilePaths.length,
                                  (index) => Container(
                                    margin: EdgeInsets.only(
                                      right: index < _attachmentFilePaths.length - 1 ? AppSizes.sm : 0,
                                    ),
                                    child: Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () => _showImagePreview(_attachmentFilePaths[index]),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                                              border: Border.all(color: BrandColors.outline),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                                              child: Image.file(
                                                File(_attachmentFilePaths[index]),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: AppSizes.xs,
                                          right: AppSizes.xs,
                                          child: CircleAvatar(
                                            radius: AppSizes.md,
                                            backgroundColor: BrandColors.error,
                                            child: IconButton(
                                              padding: EdgeInsets.zero,
                                              iconSize: AppSizes.lg,
                                              icon: Icon(Icons.close, color: BrandColors.textLight),
                                              onPressed: () => _removeImage(index),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppSizes.xxl),

              // Submit Button
              CustomButton(
                text: l10n.editExpense,
                onPressed: updating ? null : _handleSubmit,
                isLoading: updating,
              ),

              const SizedBox(height: AppSizes.lg),
            ],
          ),
        ),
      ),
    );
  }

}
