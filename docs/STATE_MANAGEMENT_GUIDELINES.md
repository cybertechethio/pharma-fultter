# Flutter State Management Guidelines
## Riverpod + AsyncValue Pattern

This document outlines the standardized state management pattern used in this project. **All developers must follow these guidelines strictly** to maintain consistency and code quality.

---

## 🎯 **Core Principles**

1. **Use Riverpod with AsyncValue** - No custom state classes
2. **Keep it Simple** - Follow the established patterns
3. **Consistent Feedback** - Always provide user feedback
4. **Clean Architecture** - Separate concerns properly

---

## 📋 **Standard Pattern for New Features**

### **1. Notifier Structure**

```dart
// ✅ CORRECT - Use this pattern for ALL new features
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/your_entity.dart';
import 'your_providers.dart';

part 'your_notifier.g.dart';

@riverpod
class YourNotifier extends _$YourNotifier {
  @override
  Future<List<YourEntity>> build() async {
    return await _loadData();
  }

  /// Load all data
  Future<void> loadData() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData());
  }

  /// Create new item
  Future<void> createItem(String name) async {
    await AsyncValue.guard(() => _createItem(name));
    loadData(); // Auto-reload
  }

  /// Update existing item
  Future<void> updateItem(String id, String name) async {
    await AsyncValue.guard(() => _updateItem(id, name));
    loadData(); // Auto-reload
  }

  /// Delete item
  Future<void> deleteItem(String id) async {
    await AsyncValue.guard(() => _deleteItem(id));
    loadData(); // Auto-reload
  }

  // Private methods for actual operations
  Future<List<YourEntity>> _loadData() async {
    final useCase = ref.read(getYourUseCaseProvider);
    final result = await useCase.call();
    
    return result.fold(
      (failure) => throw failure,
      (data) => data,
    );
  }

  Future<YourEntity> _createItem(String name) async {
    final useCase = ref.read(createYourUseCaseProvider);
    final result = await useCase.call(name: name);
    
    return result.fold(
      (failure) => throw failure,
      (data) => data,
    );
  }

  Future<YourEntity> _updateItem(String id, String name) async {
    final useCase = ref.read(updateYourUseCaseProvider);
    final result = await useCase.call(id: id, name: name);
    
    return result.fold(
      (failure) => throw failure,
      (data) => data,
    );
  }

  Future<YourEntity> _deleteItem(String id) async {
    final useCase = ref.read(deleteYourUseCaseProvider);
    final result = await useCase.call(id: id);
    
    return result.fold(
      (failure) => throw failure,
      (data) => data,
    );
  }
}
```

### **2. List Screen Structure**

```dart
// ✅ CORRECT - Use this pattern for ALL list screens
class YourListScreen extends ConsumerStatefulWidget {
  const YourListScreen({super.key});

  @override
  ConsumerState<YourListScreen> createState() => _YourListScreenState();
}

class _YourListScreenState extends ConsumerState<YourListScreen> {
  @override
  void initState() {
    super.initState();
    // Load data when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(yourProvider.notifier).loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dataAsync = ref.watch(yourProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.yourTitle,
        onBackPressed: () => context.go('/previous'),
      ),
      body: dataAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: EmptyWidget(
                icon: Icons.your_icon,
                title: l10n.noItems,
                message: l10n.noItemsMessage,
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref.read(yourProvider.notifier).loadData(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: YourCard(item: item),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ErrorWidget(message: error.toString()),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.read(yourProvider.notifier).loadData(),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreateDialog(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (context) => YourFormDialog(
        title: l10n.createItem,
        buttonText: l10n.create,
      ),
    );
  }
}
```

### **3. Form Dialog Structure**

```dart
// ✅ CORRECT - Use this pattern for ALL form dialogs
class YourFormDialog extends ConsumerStatefulWidget {
  final YourEntity? entity; // null for create, Entity for edit
  final String title;
  final String buttonText;

  const YourFormDialog({
    super.key,
    this.entity,
    required this.title,
    required this.buttonText,
  });

  @override
  ConsumerState<YourFormDialog> createState() => _YourFormDialogState();
}

class _YourFormDialogState extends ConsumerState<YourFormDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.entity != null) {
      _nameController.text = widget.entity!.name;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState?.validate() != true) return;

    if (widget.entity == null) {
      // Create
      await ref.read(yourProvider.notifier).createItem(_nameController.text.trim());
    } else {
      // Update
      await ref.read(yourProvider.notifier).updateItem(
        widget.entity!.id,
        _nameController.text.trim(),
      );
    }
    
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final dataAsync = ref.watch(yourProvider);

    return AlertDialog(
      title: Text(widget.title),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              controller: _nameController,
              labelText: l10n.itemName,
              validator: Validators.validateItemName,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        CustomButton(
          text: widget.buttonText,
          onPressed: _handleSubmit,
          isLoading: dataAsync.isLoading,
        ),
      ],
    );
  }
}
```

### **4. Card Widget Structure**

```dart
// ✅ CORRECT - Use this pattern for ALL card widgets
class YourCard extends ConsumerWidget {
  final YourEntity entity;

  const YourCard({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entity.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        entity.formattedCreatedAt,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Edit button
                    IconButton(
                      onPressed: () => _updateItem(context, ref),
                      icon: const Icon(Icons.edit, color: Colors.green),
                      tooltip: 'Edit Item',
                    ),
                    // Delete button
                    IconButton(
                      onPressed: () => _deleteItem(context, ref),
                      icon: const Icon(Icons.delete, color: Colors.red),
                      tooltip: 'Delete Item',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Status indicator or other info
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: entity.isActive 
                        ? Colors.green.withValues(alpha: 0.1)
                        : Colors.red.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    entity.isActive ? 'Active' : 'Inactive',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: entity.isActive ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _updateItem(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => YourFormDialog(
        entity: entity,
        title: 'Edit Item',
        buttonText: 'Update',
      ),
    );
  }

  Future<void> _deleteItem(BuildContext context, WidgetRef ref) async {
    final confirmed = await DeleteConfirmationHelper.showItemDeleteConfirmation(
      context: context,
      itemName: entity.name,
      itemType: 'item',
    );
    
    if (confirmed) {
      ref.read(yourProvider.notifier).deleteItem(entity.id);
    }
  }
}
```

---

## 🚫 **What NOT to Do**

### **❌ NEVER Create Custom State Classes**
```dart
// ❌ WRONG - Don't create custom states
class YourState {
  final List<YourEntity> items;
  final bool isLoading;
  final String? error;
  // ... more fields
}
```

### **❌ NEVER Use Complex State Management**
```dart
// ❌ WRONG - Don't use complex patterns
state = YourState.loading();
state = YourState.itemsLoaded(items);
state = YourState.itemCreated(item);
state = YourState.itemUpdated(item);
state = YourState.itemDeleted(item);
```

### **❌ NEVER Skip User Feedback**
```dart
// ❌ WRONG - Don't skip feedback
await ref.read(yourProvider.notifier).deleteItem(id);
// Missing success/error feedback
```

---

## ✅ **Mandatory Checklist for New Features**

- [ ] **Notifier**: Uses `AsyncValue<List<Entity>>`
- [ ] **Methods**: Use `AsyncValue.guard()` for operations
- [ ] **Auto-reload**: Call `loadData()` after create/update/delete
- [ ] **List Screen**: Uses `dataAsync.when()` pattern
- [ ] **Form Dialog**: Handles success/error properly
- [ ] **Card Widget**: Has edit/delete actions
- [ ] **User Feedback**: Shows success/error messages
- [ ] **Localization**: Uses `l10n` for all text
- [ ] **Error Handling**: Proper error boundaries
- [ ] **Loading States**: Shows loading indicators

---

## 🔧 **Code Generation**

**Always run code generation after creating new notifiers:**

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 📚 **File Structure**

```
lib/features/your_feature/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── providers/
    │   ├── your_notifier.dart
    │   └── your_providers.dart
    ├── screens/
    │   └── your_list_screen.dart
    └── widgets/
        ├── your_card.dart
        └── your_form_dialog.dart
```

---

## 🎯 **Key Benefits of This Pattern**

1. **Consistency** - Same pattern across all features
2. **Simplicity** - Easy to understand and maintain
3. **Performance** - Built-in Riverpod optimizations
4. **User Experience** - Consistent feedback everywhere
5. **Scalability** - Handles growth well
6. **Testing** - Easy to test with AsyncValue

---

## 📞 **Questions or Issues?**

If you have questions about implementing this pattern or encounter issues, refer to:
- Existing `CompanyNotifier` and `BranchNotifier` as examples
- This guideline document
- Team lead for clarification

**Remember**: Consistency is key. Follow this pattern exactly for all new features.
