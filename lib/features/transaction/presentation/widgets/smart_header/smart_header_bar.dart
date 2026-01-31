import 'package:flutter/material.dart';
import '../../../../../core/enums/transaction_type_enum.dart';
import '../../../../../core/enums/payment_method_type_enum.dart';
import '../../../domain/entities/transaction_payment.dart';
import 'header_icon_button.dart';

/// Smart header bar with 4 simple icon buttons
/// Type | Party | Payment | Items
class SmartHeaderBar extends StatelessWidget {
  final TransactionType? selectedType;
  final int? selectedCustomerId;
  final int? selectedSupplierId;
  final String? customerName;
  final String? supplierName;
  final List<TransactionPayment> payments;
  final int itemCount;
  final VoidCallback onTypeTap;
  final VoidCallback onPartyTap;
  final VoidCallback onPaymentTap;
  final VoidCallback onItemsTap;

  const SmartHeaderBar({
    super.key,
    this.selectedType,
    this.selectedCustomerId,
    this.selectedSupplierId,
    this.customerName,
    this.supplierName,
    required this.payments,
    required this.itemCount,
    required this.onTypeTap,
    required this.onPartyTap,
    required this.onPaymentTap,
    required this.onItemsTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Determine visibility based on transaction type
    final showParty = selectedType?.requiresCustomerOrSupplier() ?? true;
    final showPayment = selectedType?.requiresPaymentMethods() ?? true;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: colorScheme.outlineVariant.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Type Button
          HeaderIconButton(
            icon: _getTypeIcon(selectedType),
            iconColor: selectedType?.getColor(),
            defaultLabel: 'Type',
            selectedLabel: selectedType?.getDisplayLabel(),
            onTap: onTypeTap,
          ),

          // Party Button (conditional)
          if (showParty)
            HeaderIconButton(
              icon: _getPartyIcon(),
              iconColor: _hasPartySelected() 
                  ? colorScheme.secondary 
                  : null,
              defaultLabel: _getPartyDefaultLabel(),
              selectedLabel: _getPartyLabel(),
              onTap: onPartyTap,
            ),

          // Payment Button (conditional)
          if (showPayment)
            HeaderIconButton(
              icon: _getPaymentIcon(),
              iconColor: _getTotalPaid() > 0 
                  ? colorScheme.primary 
                  : null,
              defaultLabel: 'Payment',
              selectedLabel: _getPaymentLabel(),
              onTap: onPaymentTap,
            ),

          // Items Button
          HeaderItemButton(
            itemCount: itemCount,
            onTap: onItemsTap,
          ),
        ],
      ),
    );
  }

  IconData _getTypeIcon(TransactionType? type) {
    if (type == null) return Icons.receipt_long_outlined;
    switch (type) {
      case TransactionType.sale:
        return Icons.point_of_sale_rounded;
      case TransactionType.purchase:
        return Icons.shopping_cart_rounded;
      case TransactionType.adjustment:
        return Icons.tune_rounded;
      case TransactionType.purchaseReverse:
      case TransactionType.saleReverse:
        return Icons.undo_rounded;
    }
  }

  IconData _getPartyIcon() {
    if (selectedType == TransactionType.purchase) {
      return Icons.local_shipping_rounded;
    }
    return Icons.person_rounded;
  }

  String _getPartyDefaultLabel() {
    if (selectedType == TransactionType.purchase) {
      return 'Supplier';
    }
    return 'Customer';
  }

  String? _getPartyLabel() {
    if (selectedType == TransactionType.purchase) {
      return supplierName;
    }
    return customerName;
  }

  bool _hasPartySelected() {
    if (selectedType == TransactionType.purchase) {
      return selectedSupplierId != null;
    }
    return selectedCustomerId != null;
  }

  IconData _getPaymentIcon() {
    if (payments.isEmpty) return Icons.payment_rounded;
    if (payments.length == 1) {
      return _getPaymentMethodIcon(payments.first.method);
    }
    return Icons.payments_rounded;
  }

  IconData _getPaymentMethodIcon(PaymentMethodType method) {
    switch (method) {
      case PaymentMethodType.cash:
        return Icons.payments_rounded;
      case PaymentMethodType.telebirr:
        return Icons.phone_android_rounded;
      case PaymentMethodType.mPesa:
        return Icons.phone_android_rounded;
      case PaymentMethodType.bankTransfer:
        return Icons.account_balance_rounded;
      case PaymentMethodType.check:
        return Icons.description_rounded;
      case PaymentMethodType.other:
        return Icons.more_horiz_rounded;
    }
  }

  double _getTotalPaid() {
    return payments.fold(0.0, (sum, p) => sum + p.amount);
  }

  String? _getPaymentLabel() {
    // Show total paid amount from payment screen
    final totalPaid = _getTotalPaid();
    if (totalPaid <= 0) return null;
    return _formatAmount(totalPaid);
  }

  String _formatAmount(double amount) {
    if (amount >= 1000000) {
      // Millions: 1.2M
      return '${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      // Thousands: 18.7K
      return '${(amount / 1000).toStringAsFixed(1)}K';
    } else if (amount >= 1) {
      // Regular: 750
      return amount.toStringAsFixed(0);
    } else {
      // Small amounts: 0.50
      return amount.toStringAsFixed(2);
    }
  }
}
