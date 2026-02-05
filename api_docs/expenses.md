# Expenses API Documentation

## Overview

This document describes the **Expenses** API endpoints for the pharma backend. Expenses are branch-scoped records with an amount, date, name, notes, attachments, and one or more **payment methods** (e.g. cash, bank transfer). Each expense has an internal **ExpensePayment** (1:1) whose amount is the sum of its payment methods; payment methods are managed via sub-resource routes.

- **Base path:** `/api/expenses`
- **Branch context:** Create and list use the **current branch** from request context (e.g. `x-branch-id`). Get/update/delete are company-scoped by expense id.

All endpoints require **authentication** (active & verified user). Decimal fields (amounts) are returned as **numbers** in JSON. Dates are **ISO 8601** strings.

**Response envelope (success):**
- `success`: `boolean` (true)
- `message`: `string`
- `data`: payload (object or array)
- `pagination`: present only for list endpoints
- `metadata`: `{ requestId?, timestamp }` (optional)

**Error responses:** `400` (validation), `401` (unauthorized), `403` (forbidden), `404` (not found), `500` (server error).

**Conventions:** Request/response use **camelCase** only (no snake_case).

---

# Part 1: Expenses

---

## 1. CREATE EXPENSE

### POST /api/expenses

**Description:** Create a new expense for the **current branch**. Amount is derived from the sum of payment methods. Creates the expense, an internal expense-payment record, and all given payment methods in one transaction.

**Authentication Required:** Yes

**Request body:** Send either the payload directly or wrapped in `data`:

```json
{
  "data": {
    "expenseDate": "2024-01-15T00:00:00.000Z",
    "name": "Office supplies",
    "notes": "Monthly restock",
    "attachments": [],
    "paymentMethods": [
      {
        "method": "cash",
        "amount": 500,
        "attachment": null,
        "referenceNumber": "REF-001",
        "bankId": null
      },
      {
        "method": "bankTransfer",
        "amount": 1000,
        "referenceNumber": "TRF-002",
        "bankId": 1
      }
    ]
  }
}
```

**Field descriptions (request):**

| Field            | Required | Type     | Description |
|------------------|----------|----------|-------------|
| `expenseDate`    | O        | string (ISO date) \| null | Defaults to now if null/omitted |
| `name`           | **M**    | string   | 1–255 chars, trimmed |
| `notes`         | O        | string \| null | Max 5000 chars |
| `attachments`   | O        | string[] | Default [] |
| `paymentMethods` | **M**    | array    | At least one entry; see below |

**paymentMethods element:**

| Field            | Required | Type           | Description |
|------------------|----------|----------------|-------------|
| `method`        | **M**    | string         | e.g. `cash`, `telebirr`, `mPesa`, `bankTransfer`, `check`, `other` (backend may normalize) |
| `amount`        | **M**    | number         | ≥ 0.01 |
| `attachment`    | O        | string \| null | |
| `referenceNumber` | O      | string \| null | |
| `bankId`        | O        | number \| null | |

**Response (200):** Created expense with nested `expensePayments` and their `paymentMethods`:

```json
{
  "success": true,
  "message": "Expense created successfully",
  "data": {
    "id": 1,
    "companyId": 1,
    "branchId": 2,
    "amount": 1500,
    "expenseDate": "2024-01-15T00:00:00.000Z",
    "name": "Office supplies",
    "notes": "Monthly restock",
    "attachments": [],
    "createdAt": "2024-01-15T10:30:00.000Z",
    "updatedAt": "2024-01-15T10:30:00.000Z",
    "createdBy": 1,
    "updatedBy": null,
    "expensePayments": [
      {
        "id": 1,
        "expenseId": 1,
        "companyId": 1,
        "branchId": 2,
        "amount": 1500,
        "notes": null,
        "paymentMethods": [
          {
            "id": 1,
            "method": "cash",
            "amount": 500,
            "attachment": null,
            "referenceNumber": "REF-001",
            "bankId": null
          },
          {
            "id": 2,
            "method": "bankTransfer",
            "amount": 1000,
            "referenceNumber": "TRF-002",
            "bankId": 1
          }
        ]
      }
    ]
  },
  "metadata": { ... }
}
```

**Response data types (expense):**

| Field         | Type              | Notes |
|---------------|-------------------|--------|
| `id`          | number            | Expense ID |
| `companyId`   | number            | |
| `branchId`    | number            | |
| `amount`      | number            | Sum of payment methods (decimal as number) |
| `expenseDate` | string \| null    | ISO datetime |
| `name`        | string \| null    | |
| `notes`       | string \| null    | |
| `attachments` | string[]          | |
| `createdAt`   | string            | ISO datetime |
| `updatedAt`   | string            | ISO datetime |
| `createdBy`   | number \| null    | User ID |
| `updatedBy`   | number \| null    | User ID |
| `expensePayments` | array         | Each has `id`, `expenseId`, `companyId`, `branchId`, `amount`, `notes`, `paymentMethods` (array) |

**paymentMethods in response:** `id`, `method` (string), `amount` (number), `attachment`, `referenceNumber`, `bankId`, plus audit fields if included.

---

## 2. UPDATE EXPENSE

### PUT /api/expenses/:id

**Description:** Update expense header fields only (date, name, notes, attachments). Does **not** update payment methods; use payment-method endpoints for that.

**Authentication Required:** Yes

**Path parameters:**

| Param | Type   | Description |
|-------|--------|-------------|
| `id`  | number | Expense ID |

**Request body:**

```json
{
  "data": {
    "expenseDate": "2024-01-16T00:00:00.000Z",
    "name": "Office supplies (updated)",
    "notes": null,
    "attachments": ["url1", "url2"]
  }
}
```

**Field descriptions (request):** All required for update schema in code; at least one should be sent in practice:

| Field         | Required | Type           | Description |
|---------------|----------|----------------|-------------|
| `expenseDate` | O        | string \| null | ISO date; if provided, can be null (backend may set to now) |
| `name`        | **M***   | string         | 1–255 chars, trimmed |
| `notes`       | O        | string \| null | Max 5000 |
| `attachments` | O        | string[]       | |

*\* Validator requires `name` when update payload is sent.*

**Response (200):** Updated expense with nested `expensePayments` and `paymentMethods` (same shape as create response).

**Error:** `404` if expense not found.

---

## 3. GET EXPENSE BY ID

### GET /api/expenses/:id

**Description:** Get a single expense by ID with nested expense payments and payment methods. Branch info may be included.

**Authentication Required:** Yes

**Path parameters:**

| Param | Type   | Description |
|-------|--------|-------------|
| `id`  | number | Expense ID |

**Response (200):** Same structure as create/update response (expense object with `expensePayments[].paymentMethods`). May include `branches` (e.g. `id`, `name`) and `paymentMethods[].banks` depending on backend include.

**Error:** `404` if not found.

---

## 4. LIST EXPENSES (with pagination)

### GET /api/expenses

**Description:** List expenses for the **current branch** with optional filters and pagination.

**Authentication Required:** Yes

**Query parameters:**

| Parameter  | Required | Type   | Default | Description |
|------------|----------|--------|---------|-------------|
| `page`     | O        | number | 1       | Page number (≥ 1) |
| `limit`    | O        | number | 1000    | Items per page (1–1000); API may accept `size` |
| `fromDate` | O        | string | —       | Filter: expenseDate ≥ this date (ISO or date string) |
| `toDate`   | O        | string | —       | Filter: expenseDate ≤ this date |
| `search`   | O        | string | —       | Search in name and notes (case-insensitive) |

**Response (200):**

```json
{
  "success": true,
  "message": "Expenses fetched successfully",
  "data": [
    {
      "id": 1,
      "companyId": 1,
      "branchId": 2,
      "amount": 1500,
      "expenseDate": "2024-01-15T00:00:00.000Z",
      "name": "Office supplies",
      "notes": "Monthly restock",
      "attachments": [],
      "createdAt": "2024-01-15T10:30:00.000Z",
      "updatedAt": "2024-01-15T10:30:00.000Z",
      "createdBy": 1,
      "updatedBy": null,
      "expensePayments": [ { "id": 1, "amount": 1500, "paymentMethods": [ ... ] } ]
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 5,
    "totalItems": 50,
    "itemsPerPage": 10,
    "hasNextPage": true,
    "hasPreviousPage": false,
    "nextPage": 2,
    "prevPage": null
  },
  "metadata": { ... }
}
```

**Data types:** Each item same as create response. Pagination shape same as in other list APIs.

---

## 5. DELETE EXPENSE

### DELETE /api/expenses/:id

**Description:** Delete an expense. Cascades to its expense-payment and all payment methods.

**Authentication Required:** Yes

**Path parameters:**

| Param | Type   | Description |
|-------|--------|-------------|
| `id`  | number | Expense ID |

**Response (200):** Success message; `data` may be the deleted expense entity (with nested expensePayments/paymentMethods) or null.

**Error:** `404` if not found.

---

# Part 2: Expense Payment Methods

All payment-method routes are under **`/api/expenses/:expenseId/payment-methods`**. The expense must exist and have an associated ExpensePayment (created with the expense). Updating or adding payment methods triggers recalculation of the expense payment amount (and thus the expense amount).

---

## 6. CREATE PAYMENT METHOD

### POST /api/expenses/:expenseId/payment-methods

**Description:** Add a single payment method to the expense’s payment. The expense’s (and expense payment’s) total amount is recalculated after creation.

**Authentication Required:** Yes

**Path parameters:**

| Param       | Type   | Description |
|------------|--------|-------------|
| `expenseId`| number | Expense ID  |

**Request body:**

```json
{
  "data": {
    "method": "cash",
    "amount": 200,
    "attachment": null,
    "referenceNumber": null,
    "bankId": null
  }
}
```

**Field descriptions (request):** Same as the payment-method element in Create Expense (method, amount ≥ 0.01, optional attachment, referenceNumber, bankId).

**Response (200):** Created payment-method object, e.g.:

```json
{
  "success": true,
  "message": "Payment method created successfully",
  "data": {
    "id": 3,
    "expensePaymentId": 1,
    "method": "cash",
    "amount": 200,
    "attachment": null,
    "referenceNumber": null,
    "bankId": null,
    "createdAt": "...",
    "updatedAt": "...",
    "createdBy": null,
    "updatedBy": null
  },
  "metadata": { ... }
}
```

**Error:** `404` if expense or expense payment not found.

---

## 7. LIST PAYMENT METHODS

### GET /api/expenses/:expenseId/payment-methods

**Description:** List payment methods for the given expense’s payment, with pagination.

**Authentication Required:** Yes

**Path parameters:**

| Param       | Type   | Description |
|------------|--------|-------------|
| `expenseId`| number | Expense ID  |

**Query parameters:** `page`, `limit` (or `size`) — same pagination as other list endpoints.

**Response (200):** Paginated array of payment-method objects (same shape as create response). Pagination object in response.

**Error:** `404` if expense or expense payment not found.

---

## 8. GET PAYMENT METHOD BY ID

### GET /api/expenses/:expenseId/payment-methods/:id

**Description:** Get a single payment method by id, scoped to the expense’s payment.

**Authentication Required:** Yes

**Path parameters:**

| Param       | Type   | Description |
|------------|--------|-------------|
| `expenseId`| number | Expense ID  |
| `id`       | number | Payment method ID |

**Response (200):** Single payment-method object.

**Error:** `404` if expense, expense payment, or payment method not found.

---

## 9. UPDATE PAYMENT METHOD

### PUT /api/expenses/:expenseId/payment-methods/:id

**Description:** Update a payment method. At least one field required. Recalculates the expense payment (and expense) amount after update.

**Authentication Required:** Yes

**Path parameters:** Same as Get (expenseId, id).

**Request body:** Same fields as create; all optional (partial update):

| Field            | Required | Type           | Description |
|------------------|----------|----------------|-------------|
| `method`         | O        | string         | |
| `amount`         | O        | number         | ≥ 0.01 |
| `attachment`     | O        | string \| null | |
| `referenceNumber`| O        | string \| null | |
| `bankId`         | O        | number \| null | |

**Response (200):** Updated payment-method object.

**Error:** `404` if not found.

---

## 10. DELETE PAYMENT METHOD

### DELETE /api/expenses/:expenseId/payment-methods/:id

**Description:** Delete a payment method. At least one payment method must remain for the expense; otherwise returns validation error. Recalculates expense payment amount after delete.

**Authentication Required:** Yes

**Path parameters:** Same as Get (expenseId, id).

**Response (200):** Success; `data` may be the deleted payment-method entity or null.

**Errors:** `400` if this would remove the last payment method; `404` if not found.

---

## Summary table

| #  | Method | Endpoint | Description |
|----|--------|----------|-------------|
| 1  | POST   | `/api/expenses` | Create expense (branch from context; includes payment methods) |
| 2  | PUT    | `/api/expenses/:id` | Update expense (header only) |
| 3  | GET    | `/api/expenses/:id` | Get expense by ID |
| 4  | GET    | `/api/expenses` | List expenses (current branch; paginated; fromDate, toDate, search) |
| 5  | DELETE | `/api/expenses/:id` | Delete expense (cascades) |
| 6  | POST   | `/api/expenses/:expenseId/payment-methods` | Add payment method |
| 7  | GET    | `/api/expenses/:expenseId/payment-methods` | List payment methods (paginated) |
| 8  | GET    | `/api/expenses/:expenseId/payment-methods/:id` | Get payment method |
| 9  | PUT    | `/api/expenses/:expenseId/payment-methods/:id` | Update payment method |
| 10 | DELETE | `/api/expenses/:expenseId/payment-methods/:id` | Delete payment method (at least one must remain) |

---

## Notes for mobile / frontend

1. **Route order:** Payment-method routes (`/:expenseId/payment-methods`) are registered **before** the generic `/:id` expense routes, so e.g. `GET /api/expenses/1/payment-methods` lists payment methods for expense 1, and `GET /api/expenses/1` gets expense 1.
2. **Branch:** Create and list use the **current branch** from context; get/update/delete use company + expense id.
3. **Amount:** Expense `amount` and ExpensePayment `amount` are always the sum of payment methods; they are updated when payment methods are added/updated/deleted.
4. **Payment method types:** Backend typically accepts values such as `cash`, `telebirr`, `mPesa`, `bankTransfer`, `check`, `other` (camelCase); normalization may be applied.
5. **Request body:** Prefer `{ "data": payload }` for consistency with other APIs.
