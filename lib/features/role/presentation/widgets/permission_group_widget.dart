import 'package:flutter/material.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/permission.dart';

class PermissionGroupWidget extends StatefulWidget {
  final String categoryName;
  final List<PermissionEntity> permissions;
  final List<int> selectedPermissionIds; // Changed from selectedPermissionNames
  final bool isReadOnly;
  final Function(int permissionId, bool selected)? onPermissionToggle;
  final VoidCallback? onSelectAll;

  const PermissionGroupWidget({
    super.key,
    required this.categoryName,
    required this.permissions,
    required this.selectedPermissionIds,
    this.isReadOnly = false,
    this.onPermissionToggle,
    this.onSelectAll,
  });

  @override
  State<PermissionGroupWidget> createState() => _PermissionGroupWidgetState();
}

class _PermissionGroupWidgetState extends State<PermissionGroupWidget> {
  bool _isExpanded = true;

  bool _isAllSelected() {
    if (widget.permissions.isEmpty) return false;
    return widget.permissions.every(
      (permission) => widget.selectedPermissionIds.contains(permission.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final allSelected = _isAllSelected();
    final selectedCount = widget.permissions
        .where((p) => widget.selectedPermissionIds.contains(p.id))
        .length;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.sm),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
            ),
            title: Text(
              widget.categoryName.toUpperCase(),
              style: context.title(bold: true),
            ),
            subtitle: Text(l10n.selectedCount(selectedCount, widget.permissions.length)),
            trailing: !widget.isReadOnly && widget.onSelectAll != null
                ? TextButton(
                    onPressed: widget.onSelectAll,
                    child: Text(allSelected ? l10n.deselectAll : l10n.selectAll),
                  )
                : null,
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
          if (_isExpanded)
            ...widget.permissions.map((permission) {
              final isSelected =
                  widget.selectedPermissionIds.contains(permission.id);
              return CheckboxListTile(
                value: isSelected,
                onChanged: widget.isReadOnly
                    ? null
                    : (value) {
                        widget.onPermissionToggle?.call(
                          permission.id,
                          value ?? false,
                        );
                      },
                title: Text(permission.description ?? 'N/A'), // Show description instead of name
                dense: true,
                contentPadding: const EdgeInsets.only(left: 72, right: 16),
              );
            }),
        ],
      ),
    );
  }
}

