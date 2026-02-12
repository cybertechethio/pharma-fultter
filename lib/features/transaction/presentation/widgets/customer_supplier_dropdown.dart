import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/enums/transaction_type_enum.dart';
import '../../../../shared/components/forms/dropdown.dart';
import '../../../supplier_customer/domain/entities/supplier_customer.dart';
import '../../../supplier_customer/presentation/providers/supplier_customer_notifier.dart';
import '../providers/form/transaction_form_notifier.dart';

class CustomerSupplierDropdown extends ConsumerWidget {
  const CustomerSupplierDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(transactionFormProvider);
    final transactionType = formState.request.transactionType;
    
    // Only show for sale, purchase, or imported (imported uses supplier like purchase)
    if (transactionType != TransactionType.sale &&
        transactionType != TransactionType.purchase &&
        transactionType != TransactionType.imported) {
      return const SizedBox.shrink();
    }

    final isSale = transactionType == TransactionType.sale;
    final type =
        isSale ? SupplierCustomerType.customer : SupplierCustomerType.supplier;
    
    final supplierCustomers = ref.watch(supplierCustomerProvider(type));
    final items = supplierCustomers.value ?? [];
    
    final selectedId =
        isSale ? formState.request.customerId : formState.request.supplierId;
    
    final formNotifier = ref.read(transactionFormProvider.notifier);

    return CustomDropdown<int?>(
      value: selectedId,
      items: items.map((sc) {
        return DropdownItem<int?>(
          value: int.parse(sc.id),
          label: sc.name,
        );
      }).toList(),
      onChanged: (value) {
        if (isSale) {
          formNotifier.setCustomer(value);
        } else {
          formNotifier.setSupplier(value);
        }
      },
      label: isSale ? 'Customer' : 'Supplier',
      hintText: isSale ? 'Select Customer' : 'Select Supplier',
      required: true,
    );
  }
}

