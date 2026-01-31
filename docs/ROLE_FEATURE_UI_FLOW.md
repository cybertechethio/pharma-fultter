# Role Feature - UI Flow Documentation

## 📋 Overview

This document describes the **Role Management** feature from a UI/UX perspective to help the web team replicate the user experience and interface flow. The feature allows users to create, view, edit, and delete roles with associated permissions.

## 🎯 Feature Purpose

The Role feature enables administrators to:
- **Create roles** with custom names, descriptions, and permission sets
- **View all roles** in a list with key information
- **Edit existing roles** to modify permissions and details
- **Delete roles** with confirmation
- **View role details** including all assigned permissions grouped by category
- **Manage permissions** by selecting/deselecting individual permissions or entire categories

---

## 🗺️ Navigation Flow

### Route Structure

```
/roles                          → Role List Screen
/roles/create                    → Create Role Form
/roles/:id                       → Role Detail Screen
/roles/:id/edit                  → Edit Role Form
```

### Navigation Patterns

1. **List → Create**: Click "+" button in AppBar → Navigate to `/roles/create`
2. **List → Detail**: Click on any role card → Navigate to `/roles/:id`
3. **Detail → Edit**: Click "Edit" button → Navigate to `/roles/:id/edit`
4. **Form → List**: After successful create/update → Auto-navigate back (pop)
5. **Detail → List**: Click back button → Navigate back to list

---

## 📱 Screen Breakdown

### 1. Role List Screen (`/roles`)

**Purpose**: Display all available roles in a scrollable list

#### UI Components

- **AppBar**
  - Title: "Roles" (localized)
  - Action: "+" icon button (tooltip: "Add New")
    - Opens create form when clicked

- **Body States**:

  **Loading State**:
  - Centered `CircularProgressIndicator`

  **Empty State**:
  - `EmptyWidget` component
  - Icon: `Icons.badge_outlined`
  - Title: "No Roles" (localized)
  - Message: "No roles message" (localized)

  **Error State**:
  - `ErrorsWidget` component showing error message
  - "Retry" button below error message
  - Clicking retry reloads the list

  **Data State**:
  - `RefreshIndicator` wrapper (pull-to-refresh enabled)
  - `ListView.builder` with vertical padding
  - Each item: `RoleCard` component

#### Role Card Component

**Layout**: Material Card with InkWell (ripple effect on tap)

**Structure**:
```
┌─────────────────────────────────────────────┐
│ [Avatar] Role Name        [Count] [Edit] [X] │
│              Description...                   │
└─────────────────────────────────────────────┘
```

**Elements**:
- **Leading**: CircleAvatar with badge icon
  - Background: `primaryContainer` color
  - Icon: `Icons.badge_outlined`
  - Icon color: `onPrimaryContainer`

- **Title**: Role name (bold)

- **Subtitle**: Role description (or "No description")
  - Max 1 line, ellipsis overflow

- **Trailing** (right side):
  1. **Permission Count Badge**
     - Container with rounded corners
     - Shows total permission count
     - Background: `secondaryContainer`
     - Text color: `onSecondaryContainer`
     - Bold font weight

  2. **Edit Icon Button**
     - Icon: `Icons.edit_outlined`
     - Tooltip: "Edit"
     - Shows loading spinner if updating
     - Disabled during update operation
     - Navigates to `/roles/:id/edit` on click

  3. **Delete Icon Button**
     - Icon: `Icons.delete_outline`
     - Tooltip: "Delete"
     - Shows loading spinner if deleting
     - Disabled during delete operation
     - Opens confirmation dialog on click

**Interactions**:
- **Tap card body**: Navigate to detail screen (`/roles/:id`)
- **Tap edit button**: Navigate to edit form (`/roles/:id/edit`)
- **Tap delete button**: Show confirmation dialog → Delete if confirmed

**Loading States**:
- Edit button shows spinner when role is being updated
- Delete button shows spinner when role is being deleted
- Both buttons disabled during respective operations

---

### 2. Role Form Screen (`/roles/create` or `/roles/:id/edit`)

**Purpose**: Create new roles or edit existing ones

#### UI Components

- **AppBar**
  - Title: "Create Role" or "Edit Role" (localized, based on mode)

- **Body**: Scrollable form with padding (16px all sides)

#### Form Fields

**1. Name Field** (Required)
- `CustomTextField` component
- Label: "Name *"
- Validation: Required, cannot be empty
- Error message: "Name required" (localized)

**2. Description Field** (Optional)
- `CustomTextField` component
- Label: "Description"
- Input type: Multiline
- No validation required

**3. Active Status Toggle**
- Material `Card` containing `SwitchListTile`
- Title: "Active Status" (localized)
- Subtitle: "Enable or disable role" (localized)
- Default: `true` (active)
- Toggleable switch

**4. Permissions Section**

**Header**:
- Title: "Permissions" (large, bold)
- Subtitle: "X selected" (shows count of selected permissions)

**Permission Groups**:

Each permission category is displayed as a collapsible card using `PermissionGroupWidget`:

```
┌─────────────────────────────────────────────┐
│ ▼ CATEGORY_NAME        [X/Y] [Select All]  │
│   ☑ Permission 1                           │
│   ☑ Permission 2                           │
│   ☐ Permission 3                           │
└─────────────────────────────────────────────┘
```

**Permission Group Widget Structure**:

- **Header (ListTile)**:
  - Leading: Expand/collapse icon (`Icons.expand_less` / `Icons.expand_more`)
  - Title: Category name (UPPERCASE, bold)
  - Subtitle: "X of Y selected" (localized)
  - Trailing: "Select All" / "Deselect All" button (only in edit mode)
  - Tappable to expand/collapse

- **Permission List** (when expanded):
  - Each permission as `CheckboxListTile`
  - Checkbox state: checked if permission ID in selected list
  - Title: Permission description (or "N/A")
  - Dense layout
  - Left padding: 72px, right padding: 16px
  - Tappable to toggle selection

**States**:

**Loading State**:
- Centered `CircularProgressIndicator` with padding

**Error State**:
- Error message text with error details

**Empty State**:
- "No permissions available" message

**5. Submit Button**

- `CustomButton` component
- Text: "Create Role" or "Update Role" (based on mode)
- Loading text: "Creating..." or "Updating..."
- Shows loading spinner during operation
- Disabled during create/update operations

#### Form Validation

1. **Name**: Required, cannot be empty
2. **Permissions**: At least one permission must be selected
   - If none selected: Shows warning snackbar
   - Message: "Select at least one permission" (localized)

#### User Interactions

**Permission Selection**:
- Click checkbox → Toggle permission selection
- Click "Select All" → Select all permissions in category
- Click "Deselect All" → Deselect all permissions in category
- Click category header → Expand/collapse category

**Form Submission**:
1. Validate form fields
2. Check at least one permission selected
3. Show loading state on button
4. Call create/update API
5. On success: Show success snackbar → Auto-navigate back
6. On error: Show error snackbar → Stay on form

#### Loading States

- **Create Loading**: Button shows spinner, form disabled
- **Update Loading**: Button shows spinner, form disabled
- **Permission Loading**: Shows spinner while fetching permissions

---

### 3. Role Detail Screen (`/roles/:id`)

**Purpose**: View complete role information including all permissions

#### UI Components

- **AppBar**
  - Title: "Role Details" (localized)
  - Back button (standard navigation)

- **Body**: Scrollable content

#### Content Sections

**1. Role Info Card**

Material Card with padding (16px all sides, 16px margin):

```
┌─────────────────────────────────────────────┐
│ Role Name                    [Active Chip]  │
│                                              │
│ Description                                  │
│ (if available)                               │
│                                              │
│ Total Permissions: X                         │
└─────────────────────────────────────────────┘
```

**Elements**:
- **Role Name**: Headline small, bold
- **Status Chip**: 
  - Green background (20% opacity) if active
  - Grey background (20% opacity) if inactive
  - Text: "Active" or "Inactive" (localized)
- **Description** (if exists):
  - Label: "Description"
  - Text: Role description
- **Permission Count**: Body large text
  - Format: "Total Permissions: X" (localized)

**2. Permissions Section**

**Header**:
- Title: "Permissions" (large, bold)
- Padding: 16px horizontal

**Permission Groups**:

Same `PermissionGroupWidget` structure as form, but:
- **Read-only mode**: Checkboxes disabled, no "Select All" button
- Shows all permissions grouped by category
- Categories expanded by default
- Checkboxes reflect which permissions are assigned to role

**Empty State**:
- If no permissions: "No permissions assigned" message

**3. Action Buttons**

Two buttons in a row (16px padding all sides):

```
┌──────────────────┐  ┌──────────────────┐
│  [Edit Icon]     │  │  [Delete Icon]   │
│   Edit Role      │  │   Delete         │
└──────────────────┘  └──────────────────┘
```

**Edit Button**:
- `OutlinedButton.icon`
- Icon: `Icons.edit`
- Label: "Edit Role" (localized)
- Navigates to `/roles/:id/edit`

**Delete Button**:
- `ElevatedButton.icon`
- Icon: `Icons.delete`
- Label: "Delete" (localized)
- Background: Error color
- Foreground: On error color
- Opens confirmation dialog → Deletes if confirmed → Navigates back

#### States

**Loading State**:
- Centered `CircularProgressIndicator`

**Error State**:
- Error message text
- "Go Back" button

**Data State**:
- Role info card
- Permissions section
- Action buttons

---

## 🔄 User Flow Diagrams

### Create Role Flow

```
1. User on Role List Screen
   ↓
2. Click "+" button in AppBar
   ↓
3. Navigate to /roles/create
   ↓
4. Fill form:
   - Enter role name (required)
   - Enter description (optional)
   - Toggle active status (default: active)
   - Select permissions (at least one required)
   ↓
5. Click "Create Role" button
   ↓
6. Validation:
   - Name required? ✓
   - At least one permission? ✓
   ↓
7. Show loading state
   ↓
8. API call (create role)
   ↓
9. Success:
   - Show success snackbar
   - Auto-navigate back to list
   - List updates optimistically
   ↓
   OR
   ↓
9. Error:
   - Show error snackbar
   - Stay on form
```

### Edit Role Flow

```
1. User on Role List Screen
   ↓
2. Click edit icon on role card
   OR
   Click role card → Click "Edit" button on detail screen
   ↓
3. Navigate to /roles/:id/edit
   ↓
4. Form pre-filled with role data:
   - Name field: role name
   - Description field: role description
   - Active toggle: role.isActive
   - Permissions: role permissions pre-selected
   ↓
5. User modifies fields
   ↓
6. Click "Update Role" button
   ↓
7. Validation (same as create)
   ↓
8. Show loading state
   ↓
9. API call (update role)
   ↓
10. Success:
    - Show success snackbar
    - Auto-navigate back
    - List updates optimistically
    ↓
    OR
    ↓
10. Error:
    - Show error snackbar
    - Stay on form
```

### Delete Role Flow

```
1. User on Role List Screen
   ↓
2. Click delete icon on role card
   OR
   Click role card → Click "Delete" button on detail screen
   ↓
3. Confirmation Dialog appears:
   - Title: "Delete Role"
   - Message: "Are you sure you want to delete [Role Name]? This action cannot be undone."
   - Buttons: "Cancel" | "Delete"
   ↓
4. User clicks "Cancel":
   - Dialog closes
   - No action taken
   ↓
   OR
   ↓
4. User clicks "Delete":
   - Dialog closes
   - Show loading spinner on delete button
   ↓
5. API call (delete role)
   ↓
6. Success:
   - Show success snackbar
   - Role removed from list (optimistic update)
   - If on detail screen: Navigate back to list
   ↓
   OR
   ↓
6. Error:
   - Show error snackbar
   - Role remains in list
```

### View Role Details Flow

```
1. User on Role List Screen
   ↓
2. Click on role card
   ↓
3. Navigate to /roles/:id
   ↓
4. Display:
   - Role information card
   - All permissions grouped by category
   - Edit and Delete action buttons
   ↓
5. User can:
   - Click "Edit" → Navigate to edit form
   - Click "Delete" → Delete flow
   - Click back → Return to list
```

---

## 🎨 UI Components Reference

### Permission Group Widget

**Purpose**: Display permissions grouped by category with selection capability

**Props**:
- `categoryName`: String (category name, displayed in UPPERCASE)
- `permissions`: List<PermissionEntity> (permissions in this category)
- `selectedPermissionIds`: List<int> (IDs of selected permissions)
- `isReadOnly`: bool (if true, checkboxes disabled, no select all button)
- `onPermissionToggle`: Function(int permissionId, bool selected)? (callback for checkbox toggle)
- `onSelectAll`: VoidCallback? (callback for select all button)

**Behavior**:
- Expandable/collapsible (starts expanded)
- Shows selected count: "X of Y selected"
- "Select All" / "Deselect All" button (only if not read-only)
- Individual checkboxes for each permission
- Displays permission description (or "N/A")

**Visual States**:
- **Expanded**: Shows all permissions with checkboxes
- **Collapsed**: Shows only header
- **Read-only**: Checkboxes disabled, no select all button
- **Editable**: Checkboxes enabled, select all button visible

---

## 📊 Data Structure

### Role Entity

```dart
RoleEntity {
  id: int                    // Unique identifier
  name: string              // Role name (required)
  description: string?      // Optional description
  companyId: int           // Company association
  isActive: boolean        // Active status (default: true)
  permissions: Map<string, List<PermissionEntity>>  // Grouped by category
  createdAt: DateTime      // Creation timestamp
}
```

### Permission Entity

```dart
PermissionEntity {
  id: int                   // Unique identifier
  name: string             // Permission name
  description: string?     // Permission description (displayed in UI)
  category: string?       // Category for grouping
  isActive: boolean       // Active status
  createdAt: DateTime     // Creation timestamp
  createdBy: int?        // Creator user ID
  updatedBy: int?        // Last updater user ID
}
```

### Permission Grouping

Permissions are grouped by `category` field:
- Each category becomes a collapsible section
- Permissions within category shown as checkboxes
- Category name displayed in UPPERCASE as header

---

## 🔔 User Feedback Patterns

### Success Messages (Snackbars)

- **Create Success**: "Role created successfully"
- **Update Success**: "Role updated successfully"
- **Delete Success**: "Role deleted successfully"

### Error Messages (Snackbars)

- **Validation Error**: "Select at least one permission"
- **API Errors**: Displayed via `ErrorsWidget` component
- **Network Errors**: Network error message
- **Server Errors**: Server error message

### Loading Indicators

- **List Loading**: Centered spinner
- **Form Submission**: Button shows spinner + loading text
- **Permission Loading**: Centered spinner in permissions section
- **Card Actions**: Small spinner replaces icon during operation

### Confirmation Dialogs

- **Delete Confirmation**: 
  - Title: "Delete Role"
  - Message: "Are you sure you want to delete [Role Name]? This action cannot be undone."
  - Actions: "Cancel" | "Delete"

---

## 🎯 Key UI Patterns

### 1. Optimistic Updates

- List updates immediately after create/update/delete
- No need to reload from server
- Snackbar confirms operation success

### 2. Loading States

- Separate loading states for different operations
- Edit button shows spinner when updating
- Delete button shows spinner when deleting
- Form button shows spinner when submitting

### 3. Form Validation

- Real-time validation on blur/submit
- Required fields marked with "*"
- Custom validation messages
- Prevents submission if invalid

### 4. Permission Selection

- Individual checkbox selection
- Category-level "Select All" / "Deselect All"
- Visual feedback: Selected count displayed
- Validation: At least one permission required

### 5. Navigation

- Auto-navigate back after successful create/update
- Manual navigation via back button
- Deep linking supported (can navigate directly to detail/edit)

### 6. Empty States

- List: Shows empty widget with icon and message
- Permissions: Shows "No permissions available" message
- Role permissions: Shows "No permissions assigned" message

### 7. Error Handling

- Error state in list: Shows error widget + retry button
- Error state in form: Shows error snackbar, stays on form
- Error state in detail: Shows error message + go back button

---

## 🎨 Visual Design Notes

### Colors

- **Primary**: Used for avatar background, primary actions
- **Secondary**: Used for permission count badge
- **Error**: Used for delete button background
- **Surface**: Used for cards and containers

### Typography

- **Headline Small**: Role name in detail screen
- **Title Large**: Section headers (Permissions)
- **Title Medium**: Category names, field labels
- **Body Large**: Permission counts, descriptions
- **Body Medium**: Subtitles, helper text

### Spacing

- **Card Margin**: 16px horizontal, 8px vertical (list)
- **Card Padding**: 16px all sides
- **Form Padding**: 16px all sides
- **Section Spacing**: 16px-24px between sections

### Icons

- **Badge**: `Icons.badge_outlined` (role avatar)
- **Add**: `Icons.add` (create button)
- **Edit**: `Icons.edit_outlined`, `Icons.edit` (edit actions)
- **Delete**: `Icons.delete_outline`, `Icons.delete` (delete actions)
- **Expand**: `Icons.expand_less`, `Icons.expand_more` (category toggle)

---

## 📝 Implementation Checklist for Web Team

### Role List Screen

- [ ] AppBar with title and "+" button
- [ ] Loading state (centered spinner)
- [ ] Empty state (icon + message)
- [ ] Error state (error widget + retry button)
- [ ] List of role cards with pull-to-refresh
- [ ] Role card component with:
  - [ ] Avatar with badge icon
  - [ ] Role name and description
  - [ ] Permission count badge
  - [ ] Edit button (with loading state)
  - [ ] Delete button (with loading state)
  - [ ] Tap to navigate to detail

### Role Form Screen

- [ ] AppBar with dynamic title
- [ ] Scrollable form container
- [ ] Name field (required, validation)
- [ ] Description field (optional, multiline)
- [ ] Active status toggle (card with switch)
- [ ] Permissions section:
  - [ ] Section header with selected count
  - [ ] Permission group widgets (collapsible)
  - [ ] Individual permission checkboxes
  - [ ] Select All / Deselect All buttons
- [ ] Submit button (with loading state)
- [ ] Form validation (name required, at least one permission)
- [ ] Success: Show snackbar + navigate back
- [ ] Error: Show snackbar + stay on form

### Role Detail Screen

- [ ] AppBar with title
- [ ] Scrollable content
- [ ] Role info card:
  - [ ] Role name (large, bold)
  - [ ] Active/Inactive chip
  - [ ] Description (if available)
  - [ ] Permission count
- [ ] Permissions section:
  - [ ] Section header
  - [ ] Permission groups (read-only mode)
  - [ ] Empty state if no permissions
- [ ] Action buttons:
  - [ ] Edit button (outlined, with icon)
  - [ ] Delete button (elevated, error color, with icon)
- [ ] Delete confirmation dialog

### Permission Group Widget

- [ ] Collapsible card
- [ ] Header with category name (UPPERCASE)
- [ ] Selected count subtitle
- [ ] Select All / Deselect All button (if editable)
- [ ] Expand/collapse icon
- [ ] Permission checkboxes (when expanded)
- [ ] Read-only mode support

### User Feedback

- [ ] Success snackbars (create, update, delete)
- [ ] Error snackbars (validation, API errors)
- [ ] Loading indicators (buttons, spinners)
- [ ] Confirmation dialogs (delete)

### Navigation

- [ ] List → Create (`/roles/create`)
- [ ] List → Detail (`/roles/:id`)
- [ ] Detail → Edit (`/roles/:id/edit`)
- [ ] Form → List (auto-navigate after success)
- [ ] Back navigation (standard back button)

---

## 🔗 Related Documentation

- [State Management Guidelines](../docs/STATE_MANAGEMENT_GUIDELINES.md) - For understanding state management patterns
- [Architecture Overview](../docs/ARCHITECTURE.md) - For understanding overall architecture
- [Code Generation Guide](../docs/CODE_GENERATION_GUIDE.md) - For code structure patterns

---

## 📞 Notes for Web Team

1. **Permission Grouping**: Permissions are grouped by `category` field. Each category becomes a collapsible section.

2. **Optimistic Updates**: The list updates immediately after operations. You don't need to reload from the server.

3. **Loading States**: Each operation has its own loading state. Edit and delete buttons show spinners during their respective operations.

4. **Form Validation**: Validate on submit, not on blur. Show validation errors below fields.

5. **Permission Selection**: Track selected permission IDs, not names. Use IDs for API calls.

6. **Navigation**: Use auto-navigate back after successful create/update. Manual back button always available.

7. **Error Handling**: Show user-friendly error messages. Provide retry options where appropriate.

8. **Empty States**: Always provide helpful empty states with icons and messages.

9. **Confirmation Dialogs**: Always confirm destructive actions (delete) before executing.

10. **Responsive Design**: Ensure forms and lists work well on different screen sizes.

---

**Last Updated**: 2024
**Feature Version**: 1.0






















