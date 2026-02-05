import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../widgets/expense_category_dropdown.dart'
    show ExpenseCategorySelectionDialog;
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

  // State variables
  String? _selectedCategoryId;
  late DateTime _selectedDate;
  final List<String> _attachmentFilePaths = [];

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with existing expense data
    _nameController = TextEditingController(text: widget.expense?.name ?? '');
    _amountController = TextEditingController(text: widget.expense?.amount ?? '');
    _notesController = TextEditingController(); // Notes field - will be empty for now since not stored

    // Initialize state with existing expense data
    _selectedCategoryId = null; // Category selection - will be empty for now since not stored
    _selectedDate = widget.expense?.expenseDate ?? DateTime.now();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
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

  void _previewImage(int index) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Stack(
          children: [
            Image.file(
              File(_attachmentFilePaths[index]),
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
      categoryId: _selectedCategoryId,
      expenseDate: _selectedDate,
      name: _nameController.text.trim(),
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Basic Information Section
              _buildSection(
                context,
                title: l10n.basicInformation,
                children: [
                  CustomTextField(
                    labelText: '${l10n.expenseName} *',
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
                    labelText: '${l10n.amount} *',
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
                  // Date Picker
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${l10n.expenseDate} *',
                        style: context.label(
                          color: BrandColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: AppSizes.sm),
                      InkWell(
                        onTap: _selectDate,
                        borderRadius: BorderRadius.circular(AppSizes.radius),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.lg),
                          decoration: BoxDecoration(
                            color: BrandColors.surface,
                            borderRadius: BorderRadius.circular(AppSizes.radius),
                            border: Border.all(
                              color: BrandColors.outline.withOpacity(0.5),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: BrandColors.textPrimary.withOpacity(0.6),
                              ),
                              const SizedBox(width: AppSizes.md),
                              Text(
                                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                style: context.body(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.xxl),

              // Category Section
              _buildSection(
                context,
                title: l10n.category,
                children: [
                  InkWell(
                    onTap: () async {
                      final selectedId = await showDialog<String>(
                        context: context,
                        builder: (context) => ExpenseCategorySelectionDialog(
                          selectedCategoryId: _selectedCategoryId,
                        ),
                      );
                      if (selectedId != null) {
                        setState(() {
                          _selectedCategoryId = selectedId;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.lg),
                      decoration: BoxDecoration(
                        color: BrandColors.surface,
                        borderRadius: BorderRadius.circular(AppSizes.radius),
                        border: Border.all(
                          color: BrandColors.outline.withOpacity(0.5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.category,
                            color: BrandColors.textPrimary.withOpacity(0.6),
                          ),
                          const SizedBox(width: AppSizes.md),
                          Expanded(
                            child: Text(
                              _selectedCategoryId != null
                                  ? l10n.categorySelected
                                  : l10n.selectCategory,
                              style: context.body(
                                color: _selectedCategoryId != null
                                    ? BrandColors.textPrimary
                                    : BrandColors.textPrimary.withOpacity(0.6),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: BrandColors.textPrimary.withOpacity(0.6),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.xxl),

              // Additional Information Section
              _buildSection(
                context,
                title: l10n.additionalInformation,
                children: [
                  TextFormField(
                    controller: _notesController,
                    decoration: InputDecoration(
                      labelText: l10n.notes,
                      prefixIcon: const Icon(Icons.notes),
                      filled: true,
                      fillColor: BrandColors.surfaceContainerHighest,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.xxl),

              // Attachments Section
              _buildSection(
                context,
                title: l10n.attachments,
                children: [
                  OutlinedButton.icon(
                    onPressed: _pickImages,
                    icon: const Icon(Icons.add_photo_alternate),
                    label: Text(l10n.addAttachments),
                  ),
                  if (_attachmentFilePaths.isNotEmpty) ...[
                    const SizedBox(height: AppSizes.lg),
                    Wrap(
                      spacing: AppSizes.sm,
                      runSpacing: AppSizes.sm,
                      children: List.generate(
                        _attachmentFilePaths.length,
                        (index) => Stack(
                          children: [
                            GestureDetector(
                              onTap: () => _previewImage(index),
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
                ],
              ),

              const SizedBox(height: AppSizes.xxl),

              // Update Button
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

  Widget _buildSection(BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.subtitle(color: BrandColors.primary, bold: true),
            ),
            const SizedBox(height: AppSizes.lg),
            ...children,
          ],
        ),
      ),
    );
  }
}
