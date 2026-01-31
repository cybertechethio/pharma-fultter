import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../l10n/app_localizations.dart';
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking images: $e')),
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
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
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

    if (widget.expense == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Expense data not found')),
      );
      return;
    }

    final amount = double.tryParse(_amountController.text.trim());
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Basic Information Section
              _buildSection(
                context,
                title: 'Basic Information',
                children: [
                  CustomTextField(
                    labelText: 'Expense Name *',
                    controller: _nameController,
                    prefixIcon: Icons.description_outlined,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Expense name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    labelText: 'Amount *',
                    controller: _amountController,
                    prefixIcon: Icons.attach_money,
                    inputType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Amount is required';
                      }
                      final amount = double.tryParse(value.trim());
                      if (amount == null || amount <= 0) {
                        return 'Please enter a valid amount';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // Date Picker
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expense Date *',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: _selectDate,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Category Section
              _buildSection(
                context,
                title: 'Category',
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
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.category,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              _selectedCategoryId != null
                                  ? 'Category selected' // In real app, show category name
                                  : 'Select category (optional)',
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: _selectedCategoryId != null
                                    ? Theme.of(context).colorScheme.onSurface
                                    : Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Additional Information Section
              _buildSection(
                context,
                title: 'Additional Information',
                children: [
                  TextFormField(
                    controller: _notesController,
                    decoration: InputDecoration(
                      labelText: 'Notes',
                      prefixIcon: const Icon(Icons.notes),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Attachments Section
              _buildSection(
                context,
                title: 'Attachments',
                children: [
                  OutlinedButton.icon(
                    onPressed: _pickImages,
                    icon: const Icon(Icons.add_photo_alternate),
                    label: const Text('Add Attachments'),
                  ),
                  if (_attachmentFilePaths.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
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
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Theme.of(context).colorScheme.outline),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(_attachmentFilePaths[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Theme.of(context).colorScheme.error,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  iconSize: 16,
                                  icon: const Icon(Icons.close, color: Colors.white),
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

              const SizedBox(height: 32),

              // Update Button
              CustomButton(
                text: l10n.editExpense,
                onPressed: updating ? null : _handleSubmit,
                isLoading: updating,
              ),

              const SizedBox(height: 16),
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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}
