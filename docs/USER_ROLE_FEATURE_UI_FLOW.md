# User Role Assignment Feature - UI Flow Documentation

## 📋 Overview

This document describes the **User Role Assignment** feature from a UI/UX perspective to help the web team replicate the user experience and interface flow. The feature allows administrators to assign roles to users on a per-branch basis, enabling granular access control.

## 🎯 Feature Purpose

The User Role Assignment feature enables administrators to:
- **View role assignments** for a specific user, grouped by branch
- **Assign roles to users** for specific branches
- **Manage branch-role relationships** for users
- **See which roles** a user has in each branch

---

## 🗺️ Navigation Flow

### Integration Point

The feature is **embedded within the User Detail Screen** as a card section:
- **Location**: User Detail Screen (`/users/:id`)
- **Section**: "Role Assignments by Branch" card
- **Trigger**: Click "Assign Roles to Branches" button

### User Flow

```
1. User Detail Screen (/users/:id)
   ↓
2. Scroll to "Role Assignments by Branch" section
   ↓
3. Click "Assign Roles to Branches" button
   ↓
4. Assign Roles Dialog opens (modal)
   ↓
5. Select branches and roles
   ↓
6. Click "Save All Assignments"
   ↓
7. Dialog closes, assignments update
```

---

## 📱 UI Components Breakdown

### 1. Role Assignments Section (User Detail Screen)

**Purpose**: Display all role assignments for a user, grouped by branch

**Location**: Embedded card in User Detail Screen

#### UI Structure

```
┌─────────────────────────────────────────────┐
│ 🏷️ Role Assignments by Branch                │
├─────────────────────────────────────────────┤
│ [Branch Cards List]                          │
│ [Assign Roles to Branches Button]            │
└─────────────────────────────────────────────┘
```

#### States

**Loading State**:
- Centered `CircularProgressIndicator` with padding

**Error State**:
- Error message text
- "Retry" button below error message

**Empty State**:
- Large badge icon (`Icons.badge_outlined`, 48px)
- Title: "No role assignments found"
- Message: "This user doesn't have any role assignments in any branch yet."
- "Assign Roles to Branches" button (full width, outlined, with add icon)

**Data State**:
- List of `BranchRoleAssignmentCard` components
- "Assign Roles to Branches" button at bottom (full width, outlined, with add icon)

---

### 2. Branch Role Assignment Card

**Purpose**: Display role assignments for a single branch

#### UI Structure

```
┌─────────────────────────────────────────────┐
│ 🌳 Branch Name          [X roles] [▼/▲]     │
├─────────────────────────────────────────────┤
│ ID: {branchId}                               │
│ ─────────────────────────────────────────── │
│ Assigned Roles:                              │
│ [Role Chip] [Role Chip] [Role Chip]         │
└─────────────────────────────────────────────┘
```

#### Elements

**Header (ListTile)**:
- **Leading**: Tree icon (`Icons.account_tree_outlined`) in primary color
- **Title**: Branch name (title medium, bold)
- **Subtitle**: "ID: {branchId}" (body small, muted color)
- **Trailing**:
  1. **Role Count Badge**:
     - Container with rounded corners (12px)
     - Background: `secondaryContainer`
     - Text: "{count} role(s)" (12px, bold, `onSecondaryContainer`)
  2. **Expand/Collapse Icon**:
     - `Icons.expand_less` when expanded
     - `Icons.expand_more` when collapsed
     - Color: `onSurfaceVariant`

**Expanded Content** (when expanded):
- Divider (1px height)
- Padding: 16px all sides
- **Label**: "Assigned Roles:" (body small, bold, muted)
- **Role Chips**:
  - Wrap layout (8px spacing)
  - Each role as `Chip` component
  - Background: `surfaceContainerHighest`
  - Shows role name
- **Empty State** (if no roles):
  - Text: "No roles assigned" (body medium, italic, muted)

**Interactions**:
- **Tap header**: Toggle expand/collapse
- **Collapsed by default**: Starts collapsed, user expands to see roles

---

### 3. Assign Roles Dialog

**Purpose**: Assign roles to a user for multiple branches

**Type**: Modal dialog (overlay)

#### Dialog Structure

```
┌─────────────────────────────────────────────┐
│ Assign Roles to User              [X]        │
│ User: {userName}                             │
├─────────────────────────────────────────────┤
│ Select branches and assign roles [Select All]│
│                                              │
│ ☑ Branch 1                                   │
│   ─────────────────────────────────────────  │
│   [Role Chip] [Role Chip] [Role Chip]        │
│   Selected: X roles                           │
│                                              │
│ ☐ Branch 2                                   │
│                                              │
│ ─────────────────────────────────────────── │
│ Summary:                                     │
│ • Branch 1: X roles                          │
│ • Branch 2: Y roles                          │
│ Total: N branches, M role assignments        │
├─────────────────────────────────────────────┤
│                    [Cancel] [Save All...]    │
└─────────────────────────────────────────────┘
```

#### Dialog Dimensions
- **Max Width**: 600px
- **Max Height**: 700px
- **Layout**: Column with header, scrollable content, footer

#### Header Section

**Layout**: Row with title and close button

**Elements**:
- **Title**: "Assign Roles to User" (title large, bold)
- **Subtitle**: "User: {userName}" (body medium, muted)
- **Close Button**: Icon button with `Icons.close` (top right)

**Divider**: 1px divider below header

#### Content Section (Scrollable)

**Header Row**:
- **Left**: "Select branches and assign roles" (title medium, bold)
- **Right**: "Select All" / "Clear All" button (text button)
  - Shows "Select All" if not all branches selected
  - Shows "Clear All" if all branches selected

**Branch Cards**:

Each branch displayed as a card with:

```
┌─────────────────────────────────────────────┐
│ ☑ Branch Name                                │
├─────────────────────────────────────────────┤
│ [Role FilterChip] [Role FilterChip] ...     │
│ Selected: X roles                            │
└─────────────────────────────────────────────┘
```

**Branch Card Elements**:
- **CheckboxListTile**:
  - Checkbox: Controls branch selection
  - Title: Branch name (title medium, bold)
  - Dense layout
  - Padding: 16px horizontal, 8px vertical
- **Roles Section** (only visible if branch selected):
  - Divider (1px)
  - Padding: 16px all sides
  - **Role Chips**:
    - `FilterChip` components in Wrap layout
    - Spacing: 8px
    - Selected state: Shows check icon (18px) as avatar
    - Unselected: No avatar
    - Click to toggle selection
  - **Selected Count**: "Selected: X role(s)" (body small, muted)
  - **Loading State**: Centered spinner if roles loading
  - **Error State**: "Error loading roles" message
  - **Empty State**: "No roles available" message

**Summary Card** (only if branches selected):
- Background: `surfaceContainerHighest`
- Padding: 12px all sides
- **Title**: "Summary:" (title small, bold)
- **List**: Each selected branch with role count
  - Format: "• {Branch Name}: X role(s)"
- **Total**: "Total: N branches, M role assignments" (body small, bold)

**States**:
- **Branches Loading**: Centered spinner with padding
- **Branches Error**: Error widget with message
- **Branches Empty**: "No branches available" message
- **Roles Loading**: Centered spinner in roles section
- **Roles Error**: "Error loading roles" message
- **Roles Empty**: "No roles available" message

#### Footer Section

**Layout**: Row with buttons aligned to end

**Elements**:
- **Cancel Button**: Text button, "Cancel" (localized)
- **Save Button**: Primary button, "Save All Assignments"
  - Full width (flexible)
  - Shows loading state during save

**Divider**: 1px divider above footer

---

## 🔄 User Flow Diagrams

### Assign Roles Flow

```
1. User on User Detail Screen
   ↓
2. Scroll to "Role Assignments by Branch" section
   ↓
3. Click "Assign Roles to Branches" button
   ↓
4. Assign Roles Dialog opens
   ↓
5. Dialog loads:
   - Fetches available branches
   - Fetches available roles
   - Pre-selects branches with existing assignments
   - Pre-selects roles for those branches
   ↓
6. User interactions:
   - Select/deselect branches (checkbox)
   - For selected branches: Select/deselect roles (chips)
   - Use "Select All" to select all branches
   - Use "Clear All" to deselect all branches
   ↓
7. User clicks "Save All Assignments"
   ↓
8. Validation:
   - At least one branch selected? ✓
   ↓
9. Show loading state on save button
   ↓
10. API call (assign roles)
    ↓
11. Success:
    - Show success snackbar
    - Close dialog
    - Section updates with new assignments
    ↓
    OR
    ↓
11. Error:
    - Show error snackbar
    - Stay in dialog
```

### View Assignments Flow

```
1. User on User Detail Screen
   ↓
2. Scroll to "Role Assignments by Branch" section
   ↓
3. Section loads assignments for user
   ↓
4. Display:
   - Branch cards (collapsed by default)
   - Each card shows branch name and role count
   ↓
5. User clicks branch card header
   ↓
6. Card expands to show:
   - Assigned roles as chips
   - "No roles assigned" if empty
   ↓
7. User can:
   - Click another branch to expand/collapse
   - Click "Assign Roles to Branches" to modify
```

---

## 📊 Data Structure

### UserBranchRoleAssignment Entity

```dart
UserBranchRoleAssignment {
  branchId: int                    // Branch identifier
  branchName: string               // Branch display name
  roles: List<RoleAssignment>      // Assigned roles
}
```

### RoleAssignment Entity

```dart
RoleAssignment {
  id: int                          // Role identifier
  name: string                     // Role display name
}
```

### BranchRoleAssignmentRequest

```dart
BranchRoleAssignmentRequest {
  branchId: int                    // Branch identifier
  roleIds: List<int>               // Selected role IDs
}
```

---

## 🎨 UI Components Reference

### BranchRoleAssignmentCard Component

**Props**:
- `assignment`: UserBranchRoleAssignment (branch and roles data)
- `isExpanded`: bool (whether card is expanded)
- `onToggle`: VoidCallback (toggle expand/collapse)

**Behavior**:
- Collapsible card
- Shows role count badge
- Displays roles as chips when expanded
- Empty state if no roles assigned

### AssignRolesDialog Component

**Props**:
- `userId`: int (user identifier)
- `userName`: string (user display name)
- `currentAssignments`: List<UserBranchRoleAssignment>? (existing assignments, optional)

**Behavior**:
- Modal dialog overlay
- Pre-selects existing assignments
- Allows multi-branch and multi-role selection
- Shows summary of selections
- Validates at least one branch selected
- Saves all assignments in one operation

---

## 🔔 User Feedback Patterns

### Success Messages (Snackbars)

- **Assign Success**: "Role assignments updated successfully"

### Error Messages (Snackbars)

- **Validation Error**: "Please select at least one branch"
- **API Errors**: Displayed via error snackbar
- **Network Errors**: Network error message
- **Server Errors**: Server error message

### Loading Indicators

- **Section Loading**: Centered spinner with padding
- **Dialog Save**: Button shows loading state
- **Branches Loading**: Centered spinner in dialog
- **Roles Loading**: Centered spinner in roles section

---

## 🎯 Key UI Patterns

### 1. Hierarchical Selection

- **Branch Level**: Select/deselect entire branch
- **Role Level**: Select/deselect individual roles within branch
- **Bulk Actions**: "Select All" / "Clear All" for branches

### 2. Progressive Disclosure

- **Branch Cards**: Collapsed by default, expand to see roles
- **Dialog Roles**: Only show roles section when branch is selected

### 3. Visual Feedback

- **Selected Roles**: FilterChips with check icon avatar
- **Role Count**: Badge showing number of roles
- **Summary**: Summary card showing total assignments

### 4. State Management

- **Optimistic Updates**: Assignments update immediately after save
- **Pre-selection**: Existing assignments pre-selected in dialog
- **Local State**: Branch expansion state managed locally

### 5. Validation

- **Branch Selection**: At least one branch must be selected
- **Role Selection**: Optional (can assign branch with no roles)

### 6. Empty States

- **No Assignments**: Icon + message + action button
- **No Roles in Branch**: "No roles assigned" message
- **No Branches**: "No branches available" message
- **No Roles**: "No roles available" message

---

## 🎨 Visual Design Notes

### Colors

- **Primary**: Used for icons (tree, badge)
- **Secondary**: Used for role count badge background
- **Surface**: Used for cards and containers
- **Surface Container Highest**: Used for summary card background

### Typography

- **Title Large**: Dialog title
- **Title Medium**: Section headers, branch names
- **Title Small**: Summary title
- **Body Medium**: User name, descriptions
- **Body Small**: IDs, counts, labels

### Spacing

- **Card Margin**: 12px bottom (between cards)
- **Card Padding**: 16px all sides
- **Dialog Padding**: 16px all sides
- **Section Spacing**: 16px between sections
- **Chip Spacing**: 8px (horizontal and vertical)

### Icons

- **Badge**: `Icons.badge_outlined` (role assignments icon)
- **Tree**: `Icons.account_tree_outlined` (branch icon)
- **Add**: `Icons.add` (assign button)
- **Expand**: `Icons.expand_less`, `Icons.expand_more` (collapse/expand)
- **Check**: `Icons.check` (selected role indicator)
- **Close**: `Icons.close` (dialog close)

---

## 📝 Implementation Checklist for Web Team

### Role Assignments Section

- [ ] Card container with elevation
- [ ] Section header with icon and title
- [ ] Loading state (centered spinner)
- [ ] Error state (error message + retry button)
- [ ] Empty state:
  - [ ] Large icon (48px)
  - [ ] Title and message
  - [ ] "Assign Roles to Branches" button (full width, outlined)
- [ ] Data state:
  - [ ] List of branch assignment cards
  - [ ] "Assign Roles to Branches" button at bottom

### Branch Role Assignment Card

- [ ] Collapsible card component
- [ ] Header with:
  - [ ] Tree icon (leading)
  - [ ] Branch name (title)
  - [ ] Branch ID (subtitle)
  - [ ] Role count badge (trailing)
  - [ ] Expand/collapse icon (trailing)
- [ ] Expanded content:
  - [ ] Divider
  - [ ] "Assigned Roles:" label
  - [ ] Role chips (wrap layout)
  - [ ] Empty state if no roles
- [ ] Toggle expand/collapse on header tap

### Assign Roles Dialog

- [ ] Modal dialog (max 600x700px)
- [ ] Header:
  - [ ] Title and user name
  - [ ] Close button
- [ ] Content (scrollable):
  - [ ] Header with "Select All" / "Clear All" button
  - [ ] Branch cards:
    - [ ] Checkbox for branch selection
    - [ ] Roles section (only if branch selected):
      - [ ] Role FilterChips (wrap layout)
      - [ ] Selected count
      - [ ] Loading/error/empty states
  - [ ] Summary card (if branches selected)
- [ ] Footer:
  - [ ] Cancel button
  - [ ] Save button (with loading state)
- [ ] Validation: At least one branch selected
- [ ] Pre-select existing assignments
- [ ] Success: Show snackbar + close dialog
- [ ] Error: Show snackbar + stay in dialog

### User Feedback

- [ ] Success snackbars (assignments updated)
- [ ] Error snackbars (validation, API errors)
- [ ] Loading indicators (buttons, spinners)
- [ ] Empty states (no assignments, no roles, no branches)

---

## 🔗 Related Documentation

- [Role Feature UI Flow](./ROLE_FEATURE_UI_FLOW.md) - For understanding role structure
- [State Management Guidelines](./STATE_MANAGEMENT_GUIDELINES.md) - For state management patterns
- [Architecture Overview](./ARCHITECTURE.md) - For overall architecture

---

## 📞 Notes for Web Team

1. **Branch-Role Relationship**: Each user can have different roles in different branches. This enables granular access control.

2. **Pre-selection**: When opening the dialog, existing assignments are pre-selected to allow easy modification.

3. **Bulk Operations**: The "Select All" / "Clear All" button operates on branches only, not roles.

4. **Role Selection**: Roles are selected per branch. Selecting a branch doesn't automatically select any roles.

5. **Save Operation**: All assignments are saved in a single API call, not per branch.

6. **Optimistic Updates**: The section updates immediately after successful save, no reload needed.

7. **Empty States**: Always provide helpful empty states with clear actions.

8. **Validation**: At least one branch must be selected before saving. Role selection is optional.

9. **Collapsible Cards**: Branch cards start collapsed to reduce visual clutter. Users expand to see details.

10. **Responsive Design**: Dialog should work well on different screen sizes. Consider mobile-friendly layout.

---

**Last Updated**: 2024
**Feature Version**: 1.0






















