import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/components/common/app_bar.dart';
import '../../../../shared/components/forms/custom_text_field.dart';
import '../../../../shared/components/forms/custom_button.dart';
import '../../../../shared/utils/validators.dart';
import '../../domain/entities/user.dart';
import '../providers/user_notifier.dart';
import '../providers/user_loading_providers.dart';
import '../providers/user_events.dart';

class UserFormScreen extends ConsumerStatefulWidget {
  final UserEntity? initialUser;
  final int? userId; // For fetching user when editing

  const UserFormScreen({
    super.key,
    this.initialUser,
    this.userId,
  });

  @override
  ConsumerState<UserFormScreen> createState() => _UserFormScreenState();
}

class _UserFormScreenState extends ConsumerState<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  bool _isActive = true;

  bool get _isEditing => widget.initialUser != null || widget.userId != null;
  
  UserEntity? _currentUser;

  @override
  void initState() {
    super.initState();
    // Initialize controllers first
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    // Then initialize from user if provided
    _initializeFromUser(widget.initialUser);
  }

  void _initializeFromUser(UserEntity? user) {
    if (user != null) {
      _currentUser = user;
      _firstNameController.text = user.firstName;
      _lastNameController.text = user.lastName;
      _emailController.text = user.email;
      _phoneController.text = user.phone;
      _isActive = user.isActive;
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final creating = ref.read(userCreateLoadingProvider);
    final userId = _currentUser?.id ?? widget.initialUser?.id ?? widget.userId;
    final updating = _isEditing && userId != null
        ? ref.read(userUpdateLoadingProvider).contains(userId)
        : false;

    if (creating || updating) return;

    if (_isEditing && _currentUser != null) {
      await ref.read(userProvider.notifier).updateUser(
            id: _currentUser!.id,
            firstName: _firstNameController.text.trim(),
            lastName: _lastNameController.text.trim(),
            email: _emailController.text.trim(),
            phone: _phoneController.text.trim(),
            isActive: _isActive,
          );
    } else {
      await ref.read(userProvider.notifier).create(
            firstName: _firstNameController.text.trim(),
            lastName: _lastNameController.text.trim(),
            email: _emailController.text.trim(),
            phone: _phoneController.text.trim(),
            isActive: _isActive,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final creating = ref.watch(userCreateLoadingProvider);
    final userId = widget.initialUser?.id ?? widget.userId;
    final updating = _isEditing && userId != null
        ? ref.watch(userUpdateLoadingProvider).contains(userId)
        : false;
    final usersAsync = ref.watch(userProvider);

    // Listen to events for navigation
    ref.listen<UserUiEvent?>(
      userUiEventsProvider,
      (prev, next) {
        if (next == null) return;
        if (next is UserCreated || next is UserUpdated) {
          if (mounted) {
            context.pop();
          }
        }
        ref.read(userUiEventsProvider.notifier).clear();
      },
    );

    // Fetch user if we have userId but no initialUser
    if (widget.userId != null && _currentUser == null) {
      usersAsync.whenData((users) {
        final user = users.firstWhere(
          (u) => u.id == widget.userId,
          orElse: () => throw Exception('User not found'),
        );
        if (mounted && _currentUser == null) {
          setState(() {
            _initializeFromUser(user);
          });
        }
      });
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: _isEditing ? l10n.editUser : l10n.createUser,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First Name Field
              CustomTextField(
                labelText: '${l10n.firstName} *',
                controller: _firstNameController,
                prefixIcon: Icons.person_outline,
                validator: Validators.validateFirstName,
              ),
              const SizedBox(height: 16),

              // Last Name Field
              CustomTextField(
                labelText: '${l10n.lastName} *',
                controller: _lastNameController,
                prefixIcon: Icons.person_outline,
                validator: Validators.validateLastName,
              ),
              const SizedBox(height: 16),

              // Email Field
              CustomTextField(
                labelText: '${l10n.email} *',
                controller: _emailController,
                prefixIcon: Icons.email_outlined,
                inputType: TextInputType.emailAddress,
                validator: Validators.validateEmail,
              ),
              const SizedBox(height: 16),

              // Phone Field
              CustomTextField(
                labelText: '${l10n.phone} *',
                controller: _phoneController,
                prefixIcon: Icons.phone_outlined,
                inputType: TextInputType.phone,
                validator: Validators.validatePhone,
              ),
              const SizedBox(height: 16),

              // Active Status Toggle
              Card(
                child: SwitchListTile(
                  title: Text(l10n.activeStatus),
                  subtitle: Text(l10n.enableOrDisableUser),
                  value: _isActive,
                  onChanged: (value) {
                    setState(() {
                      _isActive = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Submit Button
              CustomButton(
                text: _isEditing ? l10n.updateUser : l10n.createUser,
                isLoading: creating || updating,
                loadingText: _isEditing ? l10n.updating : l10n.creating,
                onPressed: _handleSubmit,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

