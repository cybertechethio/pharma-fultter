import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/brand_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/card_title.dart';
import '../../../../shared/components/common/delete_confirmation_dialog.dart';
import '../../../../shared/components/ui/action_buttons.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../shared/components/common/initial_avatar.dart';
import '../../../../routes/route_name.dart';
import '../../domain/entities/supplier_customer.dart';
import '../providers/supplier_customer_notifier.dart';
import '../providers/supplier_customer_loading_providers.dart';
import 'supplier_customer_form_dialog.dart';

class SupplierCustomerCard extends ConsumerWidget {
  final SupplierCustomer item;
  final SupplierCustomerType type;
  const SupplierCustomerCard({super.key, required this.item, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deleting = ref.watch(supplierCustomerDeleteLoadingProvider(type)).contains(item.id);
    final updating = ref.watch(supplierCustomerUpdateLoadingProvider(type)).contains(item.id);
    final l10n = AppLocalizations.of(context);

    return InkWell(
      onTap: () => context.push(RouteName.supplierCustomerDetailPath(item.id)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.lg,
          vertical: AppSizes.md,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row 1: Avatar + Name (left), Phone (right)
            Row(
              children: [
                InitialAvatar(
                  name: item.name,
                  size: 40,
                ),
                const SizedBox(width: AppSizes.sm),
                Expanded(
                  child: cardTitle(title: item.name),
                ),
                ActionButtons(
                  onEdit: () => _openEdit(context),
                  onDelete: () => _confirmDelete(context, ref, l10n),
                  isEditing: updating,
                  isDeleting: deleting,
                  style: ActionButtonStyle.text,
                  editLabel: l10n.edit,
                  deleteLabel: l10n.delete,
                ),
                
              ],
            ),
            const SizedBox(height: AppSizes.sm),
            // Row 2: Status (left), ActionButtons (right)
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Text(
                item.phone,
                style: context.small(color: BrandColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openEdit(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => SupplierCustomerFormDialog(
        type: type,
        title: type == SupplierCustomerType.customer ? l10n.editCustomer : l10n.editSupplier,
        buttonText: l10n.update,
        initial: item,
      ),
    );
  }



  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, AppLocalizations l10n) async {
    final confirmed = await DeleteConfirmationHelper.showItemDeleteConfirmation(
      context: context,
      itemName: item.name,
      itemType: type == SupplierCustomerType.customer ? l10n.customer : l10n.supplier,
    );
    if (!confirmed) return;

    await ref.read(supplierCustomerProvider(type).notifier).delete(
      type: type,
      id: item.id,
    );
  }
}
