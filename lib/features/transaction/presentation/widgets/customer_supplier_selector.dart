import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../supplier_customer/presentation/providers/supplier_customer_notifier.dart';
import '../../../supplier_customer/domain/entities/supplier_customer.dart';
import '../../../../shared/components/forms/dropdown.dart';

class CustomerSupplierSelector extends ConsumerWidget {
  final SupplierCustomerType type;
  final int? selectedId;
  final ValueChanged<int?> onChanged;
  final String? errorText;

  const CustomerSupplierSelector({
    super.key,
    required this.type,
    required this.selectedId,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suppliersCustomersAsync = ref.watch(supplierCustomerProvider(type));

    return suppliersCustomersAsync.when(
      loading: () => const CircularProgressIndicator(),
      data: (items) {
        final dropdownItems = items
            .map((item) {
              final id = int.tryParse(item.id);
              if (id == null) return null;
              return DropdownItem<int>(
                value: id,
                label: '${item.name} (${item.phone})',
              );
            })
            .whereType<DropdownItem<int>>()
            .toList();

        // If no valid items after filtering, show empty state message
        if (dropdownItems.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    type == SupplierCustomerType.customer ? 'Customer' : 'Supplier',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    ' *',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'No ${type == SupplierCustomerType.customer ? 'customers' : 'suppliers'} available',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (errorText != null) ...[
                const SizedBox(height: 4),
                Text(
                  errorText!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ],
          );
        }

        return CustomDropdown<int>(
          value: selectedId,
          items: dropdownItems,
          onChanged: onChanged,
          label: type == SupplierCustomerType.customer ? 'Customer ' : 'Supplier ',
          hintText: type == SupplierCustomerType.customer
              ? 'Select a customer'
              : 'Select a supplier',
          required: true,
          errorText: errorText,
          searchable: true,
          searchHint: 'Search ${type == SupplierCustomerType.customer ? 'customers' : 'suppliers'}...',
        );
      },
      error: (error, stack) => Text('Error loading ${type == SupplierCustomerType.customer ? 'customers' : 'suppliers'}: $error'),
    );
  }
}

