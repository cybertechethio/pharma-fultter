import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../app/theme/text_styles.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../domain/entities/role.dart';
import '../../domain/entities/permission.dart';
import '../providers/role_notifier.dart';
import '../providers/permission_notifier.dart';
import '../providers/role_loading_providers.dart';
import '../providers/role_events.dart';
import '../widgets/permission_group_widget.dart';

class RoleFormScreen extends ConsumerStatefulWidget {
  final RoleEntity? initialRole;
  final int? roleId; // For fetching role when editing

  const RoleFormScreen({
    super.key,
    this.initialRole,
    this.roleId,
  });

  @override
  ConsumerState<RoleFormScreen> createState() => _RoleFormScreenState();
}

class _RoleFormScreenState extends ConsumerState<RoleFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  bool _isActive = true;
  Set<int> _selectedPermissionIds = {};
  Map<String, List<PermissionEntity>> _groupedPermissions = {};

  bool get _isEditing => widget.initialRole != null || widget.roleId != null;
  
  RoleEntity? _currentRole;

  @override
  void initState() {
    super.initState();
    // Initialize controllers first
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    // Then initialize from role if provided
    _initializeFromRole(widget.initialRole);
  }

  void _initializeFromRole(RoleEntity? role) {
    if (role != null) {
      _currentRole = role;
      _nameController.text = role.name;
      _descriptionController.text = role.description ?? '';
      _isActive = role.isActive;
      // Extract all permission IDs from the flat list
      _selectedPermissionIds = role.permissions.map((p) => p.id).toSet();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _loadPermissions(Map<String, List<PermissionEntity>> grouped) {
    setState(() {
      _groupedPermissions = grouped;
      // If editing, ensure selected permission IDs are preserved
      if (_isEditing && _currentRole != null) {
        // Extract permission IDs from the flat list
        _selectedPermissionIds = _currentRole!.permissions.map((p) => p.id).toSet();
      }
    });
  }

  void _togglePermission(int permissionId, bool selected) {
    setState(() {
      if (selected) {
        _selectedPermissionIds.add(permissionId);
      } else {
        _selectedPermissionIds.remove(permissionId);
      }
    });
  }

  void _selectAllInCategory(String category) {
    final permissions = _groupedPermissions[category] ?? [];
    final allSelected = permissions.every(
      (p) => _selectedPermissionIds.contains(p.id),
    );

    setState(() {
      if (allSelected) {
        // Deselect all
        for (final permission in permissions) {
          _selectedPermissionIds.remove(permission.id);
        }
      } else {
        // Select all
        for (final permission in permissions) {
          _selectedPermissionIds.add(permission.id);
        }
      }
    });
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final l10n = AppLocalizations.of(context);
    if (_selectedPermissionIds.isEmpty) {
      final snackbar = ref.read(snackbarServiceProvider);
      snackbar.showWarning(l10n.selectAtLeastOnePermission);
      return;
    }

    final creating = ref.read(roleCreateLoadingProvider);
    final roleId = _currentRole?.id ?? widget.initialRole?.id ?? widget.roleId;
    final updating = _isEditing && roleId != null
        ? ref.read(roleUpdateLoadingProvider).contains(roleId)
        : false;

    if (creating || updating) return;

    if (_isEditing && _currentRole != null) {
      await ref.read(roleProvider.notifier).updateRole(
            id: _currentRole!.id,
            name: _nameController.text.trim(),
            description: _descriptionController.text.trim().isEmpty
                ? null
                : _descriptionController.text.trim(),
            permissionIds: _selectedPermissionIds.toList(),
            isActive: _isActive,
          );
    } else {
      await ref.read(roleProvider.notifier).create(
            name: _nameController.text.trim(),
            description: _descriptionController.text.trim().isEmpty
                ? null
                : _descriptionController.text.trim(),
            permissionIds: _selectedPermissionIds.toList(),
            isActive: _isActive,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final creating = ref.watch(roleCreateLoadingProvider);
    final roleId = widget.initialRole?.id ?? widget.roleId;
    final updating = _isEditing && roleId != null
        ? ref.watch(roleUpdateLoadingProvider).contains(roleId)
        : false;
    final permissionsAsync = ref.watch(permissionProvider);
    final rolesAsync = ref.watch(roleProvider);

    // Listen to events for navigation
    ref.listen<RoleUiEvent?>(
      roleUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        if (next is RoleCreated || next is RoleUpdated) {
          if (mounted) {
            context.pop();
          }
        }
        ref.read(roleUiEventsProvider.notifier).clear();
      },
    );

    // Fetch role if we have roleId but no initialRole
    if (widget.roleId != null && _currentRole == null) {
      rolesAsync.whenData((roles) {
        final role = roles.firstWhere(
          (r) => r.id == widget.roleId,
          orElse: () => throw Exception('Role not found'),
        );
        if (mounted && _currentRole == null) {
          setState(() {
            _initializeFromRole(role);
          });
        }
      });
    }

    // Load permissions when available
    permissionsAsync.whenData((grouped) {
      if (_groupedPermissions.isEmpty) {
        _loadPermissions(grouped);
      }
    });

    return Scaffold(
      appBar: CustomAppBar(
        title: _isEditing ? l10n.editRole : l10n.createRole,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Field
              CustomTextField(
                labelText: '${l10n.name} *',
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.nameRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSizes.lg),

              // Description Field
              CustomTextField(
                labelText: l10n.description,
                controller: _descriptionController,
                inputType: TextInputType.multiline,
              ),
              const SizedBox(height: AppSizes.lg),

              // Active Status Toggle
              Card(
                child: SwitchListTile(
                  title: Text(l10n.activeStatus),
                  subtitle: Text(l10n.enableOrDisableRole),
                  value: _isActive,
                  onChanged: (value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: AppSizes.xxl),

              // Permissions Section
              Text(
                l10n.permissions,
                style: context.title(bold: true),
              ),
              const SizedBox(height: AppSizes.sm),
              Text(
                l10n.selectedPermissions(_selectedPermissionIds.length),
                style: context.body(),
              ),
              const SizedBox(height: AppSizes.lg),

              // Permission Groups
              permissionsAsync.when(
                loading: () => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.lg),
                    child: CircularProgressIndicator(),
                  ),
                ),
                error: (error, stack) => Padding(
                  padding: const EdgeInsets.all(AppSizes.lg),
                  child: Text(l10n.errorLoadingPermissions(error.toString())),
                ),
                data: (grouped) {
                  if (_groupedPermissions.isEmpty) {
                    _loadPermissions(grouped);
                  }

                  if (_groupedPermissions.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(AppSizes.lg),
                      child: Text(l10n.noPermissionsAvailable),
                    );
                  }

                  return Column(
                    children: _groupedPermissions.entries.map((entry) {
                      return PermissionGroupWidget(
                        categoryName: entry.key,
                        permissions: entry.value,
                        selectedPermissionIds: _selectedPermissionIds.toList(),
                        isReadOnly: false,
                        onPermissionToggle: _togglePermission,
                        onSelectAll: () => _selectAllInCategory(entry.key),
                      );
                    }).toList(),
                  );
                },
              ),

              const SizedBox(height: AppSizes.xxl),

              // Submit Button
              CustomButton(
                text: _isEditing ? l10n.updateRole : l10n.createRole,
                isLoading: creating || updating,
                loadingText: _isEditing ? l10n.updating : l10n.creating,
                onPressed: _handleSubmit,
              ),
              const SizedBox(height: AppSizes.lg),
            ],
          ),
        ),
      ),
    );
  }
}

