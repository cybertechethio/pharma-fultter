import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/utils/validators.dart';
import '../providers/profile_notifier.dart';
import '../providers/profile_loading_providers.dart';

/// Dialog for editing user profile
class EditProfileDialog extends ConsumerStatefulWidget {
  final User user;

  const EditProfileDialog({
    super.key,
    required this.user,
  });

  @override
  ConsumerState<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends ConsumerState<EditProfileDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.user.firstName);
    _lastNameController = TextEditingController(text: widget.user.lastName);
    _emailController = TextEditingController(text: widget.user.email ?? '');
    _phoneController = TextEditingController(text: widget.user.phone);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final updatedUser = widget.user.copyWith(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        updatedAt: DateTime.now(),
      );

      // Note: profileNotifierProvider will be available after code generation
      // For now using the provider directly from profile_providers
      await ref.read(profileProvider.notifier).updateProfile(
        user: updatedUser,
      );

      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isLoading = ref.watch(profileUpdateLoadingProvider);

    return AlertDialog(
      title: Text(l10n.editProfile),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                labelText: l10n.firstName,
                controller: _firstNameController,
                prefixIcon: Icons.person_outline,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.firstNameRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSizes.md),
              CustomTextField(
                labelText: l10n.lastName,
                controller: _lastNameController,
                prefixIcon: Icons.person_outline,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l10n.lastNameRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppSizes.md),
              CustomTextField(
                labelText: l10n.email,
                controller: _emailController,
                prefixIcon: Icons.email_outlined,
                inputType: TextInputType.emailAddress,
                validator: (value) {
                  final isValid = Validators.isValidEmail(value ?? '');
                  return isValid ? null : l10n.enterValidEmail;
                },
              ),
              const SizedBox(height: AppSizes.md),
              CustomTextField(
                labelText: l10n.phoneNumber,
                controller: _phoneController,
                prefixIcon: Icons.phone_outlined,
                inputType: TextInputType.phone,
                validator: (value) {
                  final isValid = Validators.isValidPhone(value ?? '');
                  return isValid ? null : l10n.enterValidPhone;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        CustomButton(
          text: l10n.save,
          onPressed: isLoading ? null : _submit,
          isLoading: isLoading,
          loadingText: l10n.updating,
        ),
      ],
    );
  }
}

