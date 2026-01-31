# UI Design Rules

## 🎨 Core Design Principles

### **1. Color System**
- **MANDATORY**: Always use `BrandColors` instead of `Theme.of(context).colorScheme`
- **NEVER** use `Theme.of(context).colorScheme.primary`, use `BrandColors.primary`
- **NEVER** use `Theme.of(context).colorScheme.outlineVariant`, use `BrandColors.divider`
- **NEVER** use `Theme.of(context).colorScheme.onSurfaceVariant`, use `BrandColors.textSecondary`
- All colors must come from `BrandColors` class for consistency

**✅ CORRECT:**
```dart
color: BrandColors.primary
color: BrandColors.textSecondary
color: BrandColors.divider
```

**❌ WRONG:**
```dart
color: Theme.of(context).colorScheme.primary
color: Theme.of(context).colorScheme.outlineVariant
color: Theme.of(context).colorScheme.onSurfaceVariant
```

### **2. Text Styles**
- **MANDATORY**: Always use `TextStyleExtension` from `lib/shared/utils/text_styles.dart`
- **NEVER** use `Theme.of(context).textTheme.bodyMedium?.copyWith(...)`
- Use the 6 predefined text styles: `title`, `subtitle`, `body`, `small`, `label`, `caption`
- Use convenience methods for colors: `bodyPrimary()`, `bodySecondary()`, etc.
- **EXTENDING TEXT STYLES**: If you need a new text style that doesn't exist:
  - Check if existing styles can be used with parameters (`bold`, `color`)
  - If a new style is truly needed and will be reused, add it to `TextStyleExtension` in `lib/shared/utils/text_styles.dart`
  - Only add new styles if they provide better results and don't already exist
  - Follow the existing pattern: base method + convenience methods for colors

**✅ CORRECT:**
```dart
Text('Hello', style: context.bodyPrimary())
Text('Subtitle', style: context.subtitleSecondary())
Text('Title', style: context.title(bold: true))
```

**❌ WRONG:**
```dart
Text('Hello', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
  color: BrandColors.primary,
))
```

**Available Text Styles:**
- `context.title()` / `context.titlePrimary()` - Headline (bold by default)
- `context.subtitle()` / `context.subtitleSecondary()` - Subtitle
- `context.body()` / `context.bodyPrimary()` / `context.bodySecondary()` - Body text
- `context.small()` / `context.smallPrimary()` - Small text
- `context.label()` / `context.labelPrimary()` - Labels
- `context.caption()` / `context.captionPrimary()` - Captions

### **3. Spacing System**
- **MANDATORY**: Always use `AppSizes` constants for spacing
- **NEVER** use magic numbers like `SizedBox(height: 16)`
- Use consistent spacing values from `AppSizes`

**✅ CORRECT:**
```dart
const SizedBox(height: AppSizes.lg)
const SizedBox(height: AppSizes.xl)
padding: const EdgeInsets.all(AppSizes.lg)
```

**❌ WRONG:**
```dart
const SizedBox(height: 16)
const SizedBox(height: 24)
padding: const EdgeInsets.all(20)
```

**Available Spacing:**
- `AppSizes.xs` = 4.0
- `AppSizes.sm` = 8.0
- `AppSizes.md` = 12.0
- `AppSizes.lg` = 16.0
- `AppSizes.xl` = 24.0
- `AppSizes.xxl` = 32.0

### **4. Border Radius**
- **MANDATORY**: Always use `AppSizes` constants for border radius
- Use `AppSizes.radiusSm`, `AppSizes.radius`, or `AppSizes.radiusLg`

**✅ CORRECT:**
```dart
borderRadius: BorderRadius.circular(AppSizes.radiusLg)
```

**❌ WRONG:**
```dart
borderRadius: BorderRadius.circular(16)
```

### **5. Component Reusability (DRY)**
- **MANDATORY**: Check existing components before creating new ones
- Use components from `lib/shared/components/` whenever possible
- Create reusable widgets for repeated patterns
- Extract common UI patterns into shared components

**Component Locations:**
- Forms: `lib/shared/components/forms/`
- UI Elements: `lib/shared/components/ui/`
- Layout: `lib/shared/components/layout/`
- Common: `lib/shared/components/common/`

**Key Reusable Components:**
- **ActionButtons**: `lib/shared/components/ui/action_buttons.dart` - Edit/delete buttons for cards (MANDATORY to use)

### **6. Widget Organization**
- Keep widgets simple and focused on single responsibility
- Extract complex widgets into separate files
- **Feature-Specific Widgets**: If a component is only used within a specific feature, place it in `lib/features/[feature]/presentation/widgets/`
- **Shared Widgets**: If a component is used across multiple features, place it in `lib/shared/components/`
- Use feature-based organization: `lib/features/[feature]/presentation/widgets/` for feature-specific components
- Shared widgets go in `lib/shared/components/` (forms, ui, layout, common)

### **7. Icon Usage**
- Use Material Icons consistently
- Icon size: `AppSizes.iconSize` (20.0)
- Icon colors: Use `BrandColors.primary` for primary actions

**✅ CORRECT:**
```dart
Icon(Icons.lock, size: AppSizes.iconSize, color: BrandColors.primary)
```

### **8. Button Styling**
- Use `CustomButton` from `lib/shared/components/forms/custom_button.dart`
- Button height: `AppSizes.btnHeight` (50.0)
- Use `BrandColors` for button colors

### **8.1. Action Buttons (Edit/Delete)**
- **MANDATORY**: Always use `ActionButtons` from `lib/shared/components/ui/action_buttons.dart` for edit/delete actions in cards and list items
- **NEVER** create inline edit/delete button implementations
- Supports two styles: `ActionButtonStyle.text` (with labels) and `ActionButtonStyle.icon` (icon-only)
- Handles loading states automatically
- Use in all card components for consistent UI

**✅ CORRECT:**
```dart
ActionButtons(
  onEdit: () => _updateItem(context),
  onDelete: () => _deleteItem(context, ref, l10n),
  isEditing: updating,
  isDeleting: deleting,
  style: ActionButtonStyle.text, // or ActionButtonStyle.icon
  editLabel: l10n.edit,
  deleteLabel: l10n.delete,
)
```

**❌ WRONG:**
```dart
// Don't create inline edit/delete buttons
Row(
  children: [
    IconButton(icon: Icon(Icons.edit), onPressed: ...),
    IconButton(icon: Icon(Icons.delete), onPressed: ...),
  ],
)
```

**When to use each style:**
- `ActionButtonStyle.text` - Use in divider-based list layouts (like branch cards) where space allows
- `ActionButtonStyle.icon` - Use in compact card layouts or when space is limited

### **9. Form Fields**
- Use `CustomTextField` from `lib/shared/components/forms/custom_text_field.dart`
- Always provide proper validation
- Use appropriate input types (`TextInputType.email`, `TextInputType.number`, etc.)

### **10. Responsive Design**
- Use `SingleChildScrollView` for scrollable content
- Use `ConstrainedBox` for responsive width constraints
- Consider different screen sizes (mobile, tablet, desktop)

### **11. Accessibility**
- Provide semantic labels for interactive elements
- Ensure proper color contrast (use `BrandColors` which are tested)
- Use appropriate text sizes (use text style extension)
- Support screen readers

### **12. State Management**
- Use Riverpod for state management
- Use `ConsumerWidget` or `ConsumerStatefulWidget` for Riverpod integration
- Handle loading, error, and success states properly

### **13. Navigation**
- Use GoRouter for navigation
- Use `context.go()` or `context.push()` from `go_router`
- Use `RouteName` constants instead of hardcoded strings

### **14. Localization**
- **MANDATORY**: Always use localization for ALL user-facing text
- **NEVER** hardcode user-facing strings
- Always use `AppLocalizations.of(context)` for text
- Use `l10n` variable for localization access
- Add new localization keys to `lib/l10n/app_en.arb` and `lib/l10n/app_am.arb` when needed
- Run `flutter gen-l10n` after adding new localization keys

**✅ CORRECT:**
```dart
final l10n = AppLocalizations.of(context);
Text(l10n.login)
Text(l10n.welcomeBack)
```

**❌ WRONG:**
```dart
Text('Login')
Text('Welcome Back')
Text('Sign in to continue')
```

### **15. Error Handling**
- Use `SnackbarService` for user feedback
- Show appropriate error messages
- Handle network errors gracefully

### **16. Loading States**
- Show loading indicators during async operations
- Use `CustomButton` loading state for buttons
- Provide feedback for long-running operations

### **17. Empty States**
- Use `EmptyWidget` from `lib/shared/components/common/empty_widget.dart`
- Provide helpful messages for empty states
- Include actionable CTAs when appropriate

### **18. Card Design**
- Use consistent elevation and shadows
- Use `AppSizes.radius` for card border radius
- Maintain consistent padding using `AppSizes`

### **19. Divider Usage**
- Use `BrandColors.divider` for divider colors
- Consistent thickness (1.0)
- Proper spacing around dividers

### **20. Image Assets**
- Use `AppImages` class for image paths
- Never hardcode asset paths
- Use appropriate image sizes

**✅ CORRECT:**
```dart
Image.asset(AppImages.appLogo)
```

**❌ WRONG:**
```dart
Image.asset('assets/logo/logo.png')
```

## 📋 Checklist for New UI Components

Before creating a new UI component, check:

- [ ] Does a similar component already exist?
- [ ] For edit/delete actions, are you using `ActionButtons` component?
- [ ] Are you using `BrandColors` instead of theme colors?
- [ ] Are you using `TextStyleExtension` for text styles?
- [ ] If you need a new text style, have you checked if existing styles work first?
- [ ] Are you using `AppSizes` for spacing and dimensions?
- [ ] Is the component in the correct location? (feature-specific → `feature/presentation/widgets/`, shared → `shared/components/`)
- [ ] Is localization implemented for ALL user-facing text?
- [ ] Are loading and error states handled?
- [ ] Is the component accessible?
- [ ] Does it follow Material Design 3 guidelines?
- [ ] Is the code DRY (Don't Repeat Yourself)?

## 🚫 Common Mistakes to Avoid

1. ❌ Using `Theme.of(context).colorScheme` instead of `BrandColors`
2. ❌ Using `Theme.of(context).textTheme` directly instead of extension
3. ❌ Using magic numbers for spacing instead of `AppSizes`
4. ❌ Hardcoding strings instead of using localization
5. ❌ Creating duplicate components instead of reusing existing ones
6. ❌ Creating inline edit/delete buttons instead of using `ActionButtons` component
7. ❌ Not handling loading/error states
8. ❌ Inconsistent spacing and sizing
9. ❌ Not following the established component structure
10. ❌ Placing feature-specific widgets in shared components folder
11. ❌ Creating new text styles without checking if existing ones can be used
12. ❌ Not adding new localization keys when introducing new text

## 📚 Reference Files

- **Colors**: `lib/app/theme/brand_colors.dart`
- **Text Styles**: `lib/shared/utils/text_styles.dart`
- **Sizes**: `lib/app/theme/app_sizes.dart`
- **Images**: `lib/app/theme/app_images.dart`
- **Components**: `lib/shared/components/`
  - **ActionButtons**: `lib/shared/components/ui/action_buttons.dart` (for edit/delete actions)
- **Localization**: `lib/l10n/app_localizations.dart`

---

**Remember**: Consistency is key. Always follow these rules to maintain a cohesive, maintainable, and professional UI design system.

