# Flutter Code Generation Guide

## Overview
This guide provides precise patterns and standards for generating code in this Flutter project. The project follows Clean Architecture principles with Material Design 3, Riverpod state management, and comprehensive theming support.

## 🏗️ Architecture Patterns

### 1. Project Structure
```
lib/
├── app/                    # App-level configuration
│   ├── config/            # Environment and app configs
│   └── theme/             # Theme system (colors, typography, etc.)
├── core/                  # Core utilities and base classes
│   ├── base/              # Base classes for providers, widgets, etc.
│   ├── constants/         # App constants and endpoints
│   ├── errors/            # Error handling classes
│   ├── network/           # API client and network layer
│   ├── permissions/       # Permission handling
│   ├── services/          # Core services
│   ├── state/             # Global state providers
│   └── utils/             # Utilities and extensions
├── features/              # Feature-based modules
│   └── [feature_name]/
│       ├── data/          # Data layer (models, repositories, datasources)
│       ├── domain/        # Domain layer (entities, usecases, repositories)
│       └── presentation/  # Presentation layer (screens, widgets, providers)
├── shared/                # Shared components and utilities
│   ├── components/        # Reusable UI components
│   ├── models/            # Shared data models
│   ├── providers/         # Shared state providers
│   ├── services/          # Shared services
│   └── utils/             # Shared utilities
├── routes/                # Navigation and routing
└── l10n/                  # Internationalization files
```

### 2. Clean Architecture Layers

#### Domain Layer (Business Logic)
```dart
// lib/features/[feature]/domain/entities/[entity].dart
class User {
  final String id;
  final String name;
  final String email;
  
  const User({
    required this.id,
    required this.name,
    required this.email,
  });
  
  User copyWith({
    String? id,
    String? name,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }
}
```

#### Data Layer (Implementation)
```dart
// lib/features/[feature]/data/models/[entity]_model.dart
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
  });
  
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
```

## 🎨 Theme System & Dark/Light Mode

### 1. Theme Structure
Always use the existing theme system:

```dart
// Access theme in widgets
final theme = Theme.of(context);
final colorScheme = theme.colorScheme;
final textTheme = theme.textTheme;

// For custom colors, use AppColorSystem
final appColors = AppColorSystem(seedColor);
final lightColors = appColors.colorSchemeLight;
final darkColors = appColors.colorSchemeDark;
```

### 2. Theme-Aware Components
All components must support both light and dark modes:

```dart
class CustomComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      color: colorScheme.surface,           // Adapts to theme
      child: Text(
        'Hello World',
        style: theme.textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurface,     // Adapts to theme
        ),
      ),
    );
  }
}
```

### 3. Theme Provider Usage
```dart
// Access theme state
final themeState = ref.watch(appThemeProvider);

// Toggle theme
ref.read(appThemeProvider.notifier).toggleTheme();

// Change brand color
ref.read(appThemeProvider.notifier).updateBrandColor(newColor);
```

## 🧩 Reusable Components

### 1. Component Priority
**ALWAYS** check existing components before creating new ones:

1. **Forms**: `CustomTextField`, `CustomButton`, `CustomDropdown`, `CustomCheckbox`
2. **Layout**: `CustomAppBar`, `CustomCard`, `ResponsiveLayout`
3. **Common**: `LoadingWidget`, `ErrorWidget`, `EmptyWidget`
4. **UI**: `CustomListTile`, `Badge`, `Chip`, `Divider`

### 2. Component Creation Pattern
If a reusable component doesn't exist, create it following this pattern:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// [ComponentName] - Brief description
/// 
/// Features:
/// - Feature 1
/// - Feature 2
/// - Dark/light mode support
/// - Accessibility support
class CustomComponent extends StatelessWidget {
  /// Parameter description
  final String? parameter;
  
  /// Callback description
  final VoidCallback? onTap;
  
  const CustomComponent({
    super.key,
    this.parameter,
    this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context);
    
    return Container(
      // Implementation using theme colors
      color: colorScheme.surface,
      child: Text(
        parameter ?? l10n.defaultText,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}
```

### 3. Component Variants
Use enums for component variants:

```dart
enum CustomComponentVariant {
  primary,
  secondary,
  outlined,
  text,
}

enum CustomComponentSize {
  small,
  medium,
  large,
}
```

## 🔄 State Management (Riverpod)

### 1. State Class Pattern
```dart
class FeatureState {
  final bool isLoading;
  final String? error;
  final List<Item> items;
  
  const FeatureState({
    this.isLoading = false,
    this.error,
    this.items = const [],
  });
  
  FeatureState copyWith({
    bool? isLoading,
    String? error,
    List<Item>? items,
  }) {
    return FeatureState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}
```

### 2. Notifier Pattern
```dart
class FeatureNotifier extends Notifier<FeatureState> {
  @override
  FeatureState build() {
    return const FeatureState();
  }
  
  Future<void> loadItems() async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      final items = await repository.getItems();
      state = state.copyWith(
        isLoading: false,
        items: items,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}

final featureProvider = NotifierProvider<FeatureNotifier, FeatureState>(
  FeatureNotifier.new,
);
```

### 3. Provider Usage in Widgets
```dart
class FeatureScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(featureProvider);
    final notifier = ref.read(featureProvider.notifier);
    
    return Scaffold(
      body: state.isLoading
          ? const LoadingWidget()
          : state.error != null
              ? ErrorWidget(message: state.error!)
              : ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      title: state.items[index].name,
                      onTap: () => notifier.selectItem(state.items[index]),
                    );
                  },
                ),
    );
  }
}
```

## 🌐 Internationalization

### 1. Localization Usage
```dart
// Always use AppLocalizations
final l10n = AppLocalizations.of(context);

// In widgets
Text(l10n.welcomeMessage)

// In components with fallback
Text(parameter ?? l10n.defaultText)
```

### 2. Adding New Strings
Add to `lib/l10n/app_en.arb`:
```json
{
  "newString": "New String Value",
  "@newString": {
    "description": "Description of the string usage"
  }
}
```

## 📱 Screen Creation Pattern

### 1. Screen Structure
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/components/layout/custom_app_bar.dart';
import '../../shared/components/common/loading_widget.dart';
import '../../shared/components/common/error_widget.dart' as custom_error;

class FeatureScreen extends ConsumerWidget {
  const FeatureScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final state = ref.watch(featureProvider);
    
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.featureTitle,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _showSettings(context),
          ),
        ],
      ),
      body: _buildBody(context, ref, state, l10n, colorScheme),
    );
  }
  
  Widget _buildBody(
    BuildContext context,
    WidgetRef ref,
    FeatureState state,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    if (state.isLoading) {
      return const LoadingWidget();
    }
    
    if (state.error != null) {
      return custom_error.ErrorWidget(
        message: state.error!,
        onRetry: () => ref.read(featureProvider.notifier).retry(),
      );
    }
    
    return _buildContent(context, ref, state, l10n, colorScheme);
  }
  
  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    FeatureState state,
    AppLocalizations l10n,
    ColorScheme colorScheme,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Use existing components
        CustomCard(
          child: CustomTextField(
            label: l10n.searchHint,
            prefixIcon: Icons.search,
            onChanged: (value) => _handleSearch(value),
          ),
        ),
        const SizedBox(height: 16),
        // Content implementation
      ],
    );
  }
}
```

## 🔧 Service Layer Pattern

### 1. Service Interface
```dart
abstract class FeatureService {
  Future<List<Item>> getItems();
  Future<Item> createItem(Item item);
  Future<void> updateItem(Item item);
  Future<void> deleteItem(String id);
}
```

### 2. Service Implementation
```dart
class FeatureServiceImpl implements FeatureService {
  final ApiClient _apiClient;
  
  FeatureServiceImpl(this._apiClient);
  
  @override
  Future<List<Item>> getItems() async {
    try {
      final response = await _apiClient.get('/items');
      return (response.data as List)
          .map((json) => ItemModel.fromJson(json))
          .toList();
    } catch (e) {
      throw FeatureException('Failed to load items: $e');
    }
  }
}
```

## 🚀 Code Generation Checklist

### Before Writing Code:
- [ ] Check if reusable components exist in `lib/shared/components/`
- [ ] Verify theme system usage for dark/light mode support
- [ ] Plan state management with Riverpod providers
- [ ] Consider internationalization requirements
- [ ] Follow Clean Architecture layer separation

### Component Creation:
- [ ] Use existing theme colors and typography
- [ ] Support both light and dark modes
- [ ] Include proper documentation
- [ ] Add accessibility support
- [ ] Use AppLocalizations for text
- [ ] Follow Material Design 3 guidelines

### State Management:
- [ ] Create immutable state classes with copyWith
- [ ] Use NotifierProvider for state management
- [ ] Handle loading, error, and success states
- [ ] Implement proper error handling

### Screen Development:
- [ ] Use CustomAppBar for consistent navigation
- [ ] Implement responsive layout
- [ ] Use existing loading and error widgets
- [ ] Follow the established screen structure pattern
- [ ] Include proper internationalization

### Testing Considerations:
- [ ] Make components testable with dependency injection
- [ ] Use proper error handling and validation
- [ ] Consider edge cases and error states
- [ ] Ensure accessibility compliance

## 📋 Common Patterns

### 1. Form Handling
```dart
class FormScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends ConsumerState<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: _emailController,
            label: l10n.email,
            type: CustomTextFieldType.email,
            validator: (value) => _validateEmail(value),
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: l10n.submit,
            onPressed: _handleSubmit,
            loading: state.isLoading,
          ),
        ],
      ),
    );
  }
}
```

### 2. List Display
```dart
Widget _buildList(List<Item> items) {
  if (items.isEmpty) {
    return const EmptyWidget(
      message: l10n.noItemsFound,
    );
  }
  
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return CustomListTile(
        title: item.name,
        subtitle: item.description,
        trailing: IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () => _showItemOptions(context, item),
        ),
        onTap: () => _navigateToItemDetail(context, item),
      );
    },
  );
}
```

This guide ensures consistent, maintainable, and theme-aware code generation that follows the established patterns in your Flutter project.


Key Features of the Guide:
🎨 Dark/Light Mode Support
Complete theme system integration using AppColorSystem
Automatic color adaptation for all components
Theme provider usage patterns
Material Design 3 compliance
🧩 Reusable Components Priority
Mandatory check of existing components before creating new ones
Complete inventory of available components in each category
Standardized component creation patterns
Component variant system using enums
🏗️ Architecture Patterns
Clean Architecture layer separation
Feature-based organization
Consistent state management with Riverpod
Service layer patterns
📱 Screen Development Standards
Standardized screen structure
Theme-aware implementation
Internationalization integration
Responsive design patterns
🔄 State Management
Immutable state classes with copyWith methods
Proper error handling and loading states
Provider usage patterns
Async operation handling
🌐 Internationalization
AppLocalizations integration
Fallback text handling
ARB file management
📋 Quality Assurance
Pre-code generation checklist
Component creation checklist
Testing considerations
Common pattern examples
The guide ensures that all generated code will:
✅ Support both dark and light modes automatically
✅ Use existing reusable components whenever possible
✅ Create new reusable components following established patterns
✅ Follow Clean Architecture principles
✅ Include proper internationalization
✅ Maintain consistent theming and styling
✅ Handle errors and loading states properly
This guide will serve as the definitive reference for all future code generation in your Flutter project, ensuring consistency, maintainability, and adherence to your established patterns.
