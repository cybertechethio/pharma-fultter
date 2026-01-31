# Item Create Form Structure

## Overview
The Item Create Form is organized into 5 main sections, each contained within a Card widget with consistent styling and spacing.

## Form Sections

### 1. Basic Information
**Purpose**: Core item identification details

**Fields**:
- **Name** * (required) - Text input with label icon
- **Description** * (required) - Multi-line text area (3 lines max)

**Layout**: Vertical stack with 12px spacing between fields

---

### 2. Identification
**Purpose**: Unique identifiers for inventory tracking

**Fields**:
- **SKU** * (required) - Stock Keeping Unit
- **Code** * (required) - Item code
- **Barcode** * (required) - Barcode identifier

**Layout**: Vertical stack with 12px spacing between fields

---

### 3. Product Details
**Purpose**: Physical product attributes

**Fields**:
- **Color** * (required)
- **Size** * (required)
- **Material** * (required)
- **Weight (kg)** * (required) - Numeric input with validation

**Layout**: Vertical stack with 12px spacing between fields

---

### 4. Relationships
**Purpose**: Links to related entities (all optional)

**Fields**:
- **Category** - Dropdown (depends on category provider)
- **Sub-Category** - Dropdown (depends on selected category)
- **Brand** - Dropdown (depends on brand provider)
- **Unit** - Dropdown (depends on unit provider)
- **Model** - Dropdown (depends on model provider)

**Layout**: Vertical stack with 12px spacing between fields
**Note**: Each dropdown shows loading/error states and handles empty data gracefully

---

### 5. Tax & Status
**Purpose**: Tax configuration and item status

**Fields**:
- **Is Taxable** - Switch toggle (default: true)
- **Tax Rate** - Numeric input (enabled only when taxable, 0-100 validation)
- **Is Active** - Switch toggle (default: true)

**Layout**: Vertical stack with 12px spacing between fields

---

## Section Structure

Each section follows this pattern:
```
Card Widget
  └─ Padding (12px)
      └─ Column
          ├─ Section Title (titleSmall, fontWeight: w600)
          ├─ SizedBox (12px spacing)
          └─ Section Fields (children)
```

## Form Layout

```
SingleChildScrollView
  └─ Padding (12px all sides)
      └─ Column
          ├─ Basic Information Section
          ├─ SizedBox (12px)
          ├─ Identification Section
          ├─ SizedBox (12px)
          ├─ Product Details Section
          ├─ SizedBox (12px)
          ├─ Relationships Section
          ├─ SizedBox (12px)
          ├─ Tax & Status Section
          ├─ SizedBox (24px)
          ├─ Submit Button
          └─ SizedBox (16px)
```

## Visual Design

- **Section Cards**: White background, 1px elevation, 8px border radius
- **Section Titles**: Small title text with semi-bold weight
- **Field Spacing**: 12px vertical spacing between fields within sections
- **Section Spacing**: 12px vertical spacing between sections
- **Required Fields**: Marked with asterisk (*) in label text




















