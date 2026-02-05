# Customer-Supplier API Documentation

## Overview

This document describes the **Customer-Supplier** API endpoints for the pharma backend. Customers and suppliers share one entity (`CustomerSuppliers`) and are distinguished by `type`: `CUSTOMER` or `SUPPLIER`. Endpoints cover CRUD, list with filters, add balance, refund, and transaction/payment history.

- **Base path:** `/api/customer-suppliers`
- **Branch context:** Add-balance and refund use the **current branch** from request context (e.g. `x-branch-id`); list/get/update/delete are company-scoped only.

All endpoints require **authentication** (active & verified user). Decimal fields (e.g. `balance`, amounts) are returned as **numbers** in JSON. Dates are **ISO 8601** strings.

**Response envelope (success):**
- `success`: `boolean` (true)
- `message`: `string`
- `data`: payload (object or array)
- `pagination`: present only for list and transaction-history
- `metadata`: `{ requestId?, timestamp }` (optional)

**Error responses:** `400` (validation), `401` (unauthorized), `403` (forbidden), `404` (not found), `409` (conflict, e.g. duplicate phone/accountCode/tinNumber), `500` (server error).

**Conventions:** Request/response use **camelCase** only (no snake_case).

---

## 1. CREATE CUSTOMER / SUPPLIER

### POST /api/customer-suppliers

**Description:** Create a new customer or supplier. Phone, accountCode, and (if provided) tinNumber must be unique within the company.

**Authentication Required:** Yes

**Request body:** Send either the payload directly or wrapped in `data`:

```json
{
  "data": {
    "name": "Acme Corp",
    "phone": "+251911234567",
    "accountCode": "ACC-001",
    "tinNumber": "TIN123",
    "type": "CUSTOMER"
  }
}
```

**Field descriptions (request):**

| Field        | Required | Type     | Description |
|-------------|----------|----------|-------------|
| `name`      | **M**    | string   | 1–100 chars, trimmed |
| `phone`     | **M**    | string   | Trimmed; normalized by backend; unique per company |
| `accountCode` | **M**  | string   | 1–100 chars, trimmed; unique per company |
| `tinNumber` | O        | string \| null | Trimmed; if non-empty, unique per company |
| `type`      | **M**    | string   | `"CUSTOMER"` or `"SUPPLIER"` |

**Response (201):**

```json
{
  "success": true,
  "message": "Customer/Supplier created successfully",
  "data": {
    "id": 1,
    "companyId": 1,
    "name": "Acme Corp",
    "phone": "+251911234567",
    "accountCode": "ACC-001",
    "tinNumber": "TIN123",
    "type": "CUSTOMER",
    "balance": 0,
    "isActive": true,
    "createdAt": "2024-01-15T10:30:00.000Z",
    "createdBy": null,
    "updatedBy": null
  },
  "metadata": { ... }
}
```

**Response data types:**

| Field         | Type              | Notes |
|---------------|-------------------|--------|
| `id`          | number            | Customer/Supplier ID |
| `companyId`   | number            | Company ID |
| `name`        | string            | |
| `phone`       | string            | Normalized |
| `accountCode` | string            | |
| `tinNumber`   | string \| null    | |
| `type`        | string            | `CUSTOMER` \| `SUPPLIER` |
| `balance`     | number            | Decimal as number; default 0 |
| `isActive`    | boolean           | Default true |
| `createdAt`   | string            | ISO datetime |
| `createdBy`   | number \| null    | User ID |
| `updatedBy`   | number \| null    | User ID |

**Errors:** `409` if phone, accountCode, or tinNumber (when provided) already exists for the company.

---

## 2. UPDATE CUSTOMER / SUPPLIER

### PUT /api/customer-suppliers/:id

**Description:** Update an existing customer or supplier. Only provided fields are updated. Uniqueness checks apply for phone, accountCode, and tinNumber (excluding current record).

**Authentication Required:** Yes

**Path parameters:**

| Param | Type   | Description |
|-------|--------|-------------|
| `id`  | number | Customer/Supplier ID |

**Request body:** All fields optional; at least one required:

```json
{
  "data": {
    "name": "Acme Corp Ltd",
    "phone": "+251911999999",
    "accountCode": "ACC-001",
    "tinNumber": null,
    "type": "CUSTOMER",
    "isActive": true
  }
}
```

| Field         | Required | Type           | Description |
|---------------|----------|----------------|-------------|
| `name`        | O        | string         | 1–100 chars, trimmed |
| `phone`       | O        | string         | Trimmed; unique per company (excl. self) |
| `accountCode` | O        | string         | 1–100 chars; unique per company (excl. self) |
| `tinNumber`   | O        | string \| null | Trimmed; if non-empty, unique (excl. self) |
| `type`        | O        | string         | `CUSTOMER` \| `SUPPLIER` |
| `isActive`    | O        | boolean        | |

**Response (200):** Same shape as create response; `data` is the updated entity (no `updatedAt` on CustomerSuppliers model).

**Errors:** `409` on duplicate phone/accountCode/tinNumber; `404` if not found.

---

## 3. GET CUSTOMER / SUPPLIER BY ID

### GET /api/customer-suppliers/:id

**Description:** Get a single customer or supplier by ID. Only active records are returned.

**Authentication Required:** Yes

**Path parameters:**

| Param | Type   | Description |
|-------|--------|-------------|
| `id`  | number | Customer/Supplier ID |

**Response (200):** Same object shape as create response.

**Error:** `404` if not found or inactive.

---

## 4. LIST CUSTOMERS / SUPPLIERS (with pagination)

### GET /api/customer-suppliers

**Description:** List customers/suppliers for the company with optional filters and pagination. **Only active** records are returned (`isActive: true`).

**Authentication Required:** Yes

**Query parameters:**

| Parameter | Required | Type   | Default | Description |
|-----------|----------|--------|---------|-------------|
| `page`    | O        | number | 1       | Page number (≥ 1) |
| `limit`   | O        | number | 1000    | Items per page (1–1000); API also accepts `size` |
| `type`    | O        | string | —       | Filter by type: `CUSTOMER` or `SUPPLIER` (case-insensitive) |
| `search`  | O        | string | —       | Search in name, phone, accountCode, tinNumber (case-insensitive) |
| `text`    | O        | string | —       | Alias for `search` |

**Response (200):**

```json
{
  "success": true,
  "message": "Customers/Suppliers retrieved successfully",
  "data": [
    {
      "id": 1,
      "companyId": 1,
      "name": "Acme Corp",
      "phone": "+251911234567",
      "accountCode": "ACC-001",
      "tinNumber": "TIN123",
      "type": "CUSTOMER",
      "balance": 1500.50,
      "isActive": true,
      "createdAt": "2024-01-15T10:30:00.000Z",
      "createdBy": null,
      "updatedBy": null
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

## 5. DELETE CUSTOMER / SUPPLIER

### DELETE /api/customer-suppliers/:id

**Description:** Delete a customer/supplier by ID. Only active records can be fetched; delete is allowed and removes the record.

**Authentication Required:** Yes

**Path parameters:**

| Param | Type   | Description |
|-------|--------|-------------|
| `id`  | number | Customer/Supplier ID |

**Response (200):** Success message; `data` may be the deleted entity or null (implementation-specific).

**Error:** `404` if not found (e.g. already deleted or wrong company).

---

## 6. ADD BALANCE (customer or supplier)

### POST /api/customer-suppliers/add-balance

**Description:** Add balance for a **customer** (we owe them more) or pay a **supplier** (we owe them less). Creates a balance-adjustment payment and updates the customer/supplier balance. Branch is taken from request context.

**Authentication Required:** Yes

**Request body:**

```json
{
  "data": {
    "customerId": 1,
    "supplierId": null,
    "notes": "Optional notes",
    "paymentMethods": [
      {
        "method": "cash",
        "amount": 500,
        "referenceNumber": "REF-001",
        "bankId": null,
        "attachment": null
      }
    ]
  }
}
```

**Field descriptions (request):**

| Field   | Required | Type   | Description |
|---------|----------|--------|-------------|
| `customerId` | **M*** | number \| null | Customer ID (required if supplierId not set) |
| `supplierId` | **M*** | number \| null | Supplier ID (required if customerId not set) |
| `notes`     | O        | string \| null | |
| `paymentMethods` | **M** | array  | At least one entry; sum of amounts must be > 0 |

**\*** Exactly one of `customerId` or `supplierId` must be set.

**paymentMethods element:**

| Field           | Required | Type           | Description |
|-----------------|----------|----------------|-------------|
| `method`        | **M**    | string         | e.g. `cash`, `telebirr`, `mPesa`, `bankTransfer` (backend may normalize) |
| `amount`        | **M**    | number         | Must be > 0; total across methods > 0 |
| `referenceNumber` | O      | string \| null | |
| `bankId`        | O        | number \| null | |
| `attachment`    | O        | string \| null | |

**Response (200):** Payment record (balance-adjustment type) with nested payment methods:

```json
{
  "success": true,
  "message": "Add balance payment created successfully",
  "data": {
    "id": 10,
    "companyId": 1,
    "branchId": 2,
    "transactionId": null,
    "customerId": 1,
    "supplierId": null,
    "totalAmount": 0,
    "paidAmount": 500,
    "paymentType": "balanceAdjustment",
    "notes": "Optional notes",
    "createdAt": "2024-01-15T10:30:00.000Z",
    "updatedAt": "2024-01-15T10:30:00.000Z",
    "createdBy": null,
    "updatedBy": null,
    "receivedBy": null,
    "originalPaymentId": null,
    "paymentMethods": [
      {
        "id": 1,
        "paymentId": 10,
        "method": "cash",
        "amount": 500,
        "referenceNumber": "REF-001",
        "bankId": null,
        "attachment": null
      }
    ]
  },
  "metadata": { ... }
}
```

**Errors:** `400` if neither/both customerId/supplierId, or total amount ≤ 0; `404` if customer/supplier not found or inactive.

---

## 7. REFUND (standalone, customer or supplier)

### POST /api/customer-suppliers/refund

**Description:** Standalone refund (no linked transaction). For **customers**: we refund them (balance decreases). For **suppliers**: they pay us back (balance increases). Creates a refund payment and updates balance. Branch from request context.

**Authentication Required:** Yes

**Request body:**

```json
{
  "data": {
    "customerId": 1,
    "supplierId": null,
    "notes": "Refund notes",
    "paymentMethods": [
      {
        "method": "cash",
        "amount": 200,
        "referenceNumber": null,
        "bankId": null,
        "attachment": null
      }
    ]
  }
}
```

**Field descriptions (request):** Same as Add Balance — exactly one of `customerId` or `supplierId`, and `paymentMethods` array with sum > 0. Same payment-method shape.

**Response (200):** Same structure as Add Balance; `data.paymentType` is `"refund"`, and `data.paidAmount` is the total refund amount.

**Errors:** Same as Add Balance.

---

## 8. GET TRANSACTIONS (for customer/supplier)

### GET /api/customer-suppliers/:id/transactions

**Description:** Get transactions for the given customer or supplier. Backend determines type from the record; returns up to 25 transactions ordered by `createdAt` desc.

**Authentication Required:** Yes

**Path parameters:**

| Param | Type   | Description |
|-------|--------|-------------|
| `id`  | number | Customer/Supplier ID |

**Response (200):** Success with `data` = array of transaction objects (shape defined by transactions API; typically id, transactionType, customerId/supplierId, amounts, dates, etc.). No pagination in current implementation.

---

## 9. GET PAYMENTS (for customer/supplier)

### GET /api/customer-suppliers/:id/payments

**Description:** Get payments for the given customer or supplier. Backend determines type from the record; returns up to 25 payments ordered by `createdAt` desc.

**Authentication Required:** Yes

**Path parameters:**

| Param | Type   | Description |
|-------|--------|-------------|
| `id`  | number | Customer/Supplier ID |

**Response (200):** Success with `data` = array of payment objects (id, branchId, customerId/supplierId, totalAmount, paidAmount, paymentType, notes, createdAt, paymentMethods, etc.). No pagination in current implementation.

---

## 10. GET TRANSACTION HISTORY (paginated)

### GET /api/customer-suppliers/:id/transaction-history

**Description:** Get a unified transaction history (payments + transaction context) for the customer/supplier with debit/credit and type labels. Paginated.

**Authentication Required:** Yes

**Path parameters:**

| Param | Type   | Description |
|-------|--------|-------------|
| `id`  | number | Customer/Supplier ID |

**Query parameters:**

| Parameter | Required | Type   | Default | Description |
|-----------|----------|--------|---------|-------------|
| `page`    | O        | number | 1       | Page number |
| `limit`   | O        | number | 1000    | Items per page; API also accepts `size` |

**Response (200):**

```json
{
  "success": true,
  "message": "Transaction history retrieved successfully",
  "data": [
    {
      "id": 10,
      "date": "2024-01-15T10:30:00.000Z",
      "type": "Payment",
      "debit": 1000,
      "credit": 500,
      "transactionId": 5,
      "salesOrderId": null
    },
    {
      "id": 9,
      "date": "2024-01-14T09:00:00.000Z",
      "type": "Sales",
      "debit": 800,
      "credit": 800,
      "transactionId": 4,
      "salesOrderId": null
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 2,
    "totalItems": 25,
    "itemsPerPage": 25,
    "hasNextPage": true,
    "hasPreviousPage": false,
    "nextPage": 2,
    "prevPage": null
  },
  "metadata": { ... }
}
```

**Data element types:**

| Field           | Type              | Notes |
|-----------------|-------------------|--------|
| `id`            | number            | Payment ID |
| `date`          | string            | ISO datetime (payment createdAt) |
| `type`          | string            | See below |
| `debit`         | number \| null    | |
| `credit`        | number \| null    | |
| `transactionId` | number \| null    | Linked transaction (if any) |
| `salesOrderId`  | number \| null    | Linked sales order (if any) |

**Type values (labels):**  
Customers: `Sales Order`, `Sales`, `Sales Return`, `Payment Return`, `Payment`.  
Suppliers: `Purchase`, `Import`, `Purchase Return`, `Import Return`, `Payment Return`, `Payment`.  
Debit/credit semantics differ for customer vs supplier (e.g. customer payment: debit = totalAmount, credit = paidAmount; supplier payment for purchase: debit = paidAmount, credit = totalAmount).

---

## Summary table

| #  | Method | Endpoint | Description |
|----|--------|----------|-------------|
| 1  | POST   | `/api/customer-suppliers` | Create customer/supplier |
| 2  | PUT    | `/api/customer-suppliers/:id` | Update customer/supplier |
| 3  | GET    | `/api/customer-suppliers/:id` | Get by ID |
| 4  | GET    | `/api/customer-suppliers` | List (paginated, filter by type, search) |
| 5  | DELETE | `/api/customer-suppliers/:id` | Delete |
| 6  | POST   | `/api/customer-suppliers/add-balance` | Add balance (customer or supplier); branch from context |
| 7  | POST   | `/api/customer-suppliers/refund` | Standalone refund; branch from context |
| 8  | GET    | `/api/customer-suppliers/:id/transactions` | Get transactions (fixed limit) |
| 9  | GET    | `/api/customer-suppliers/:id/payments` | Get payments (fixed limit) |
| 10 | GET    | `/api/customer-suppliers/:id/transaction-history` | Paginated transaction history with debit/credit |

---

## Notes for mobile / frontend

1. **Route order:** `POST /add-balance` and `POST /refund` are registered **before** `/:id`, so they are not confused with a numeric id.
2. **Branch:** Add-balance and refund require branch context (e.g. `x-branch-id`); list/get/update/delete do not use branch.
3. **Uniqueness:** Phone and accountCode are unique per company; tinNumber is unique when non-empty. Backend normalizes phone; use the same format when updating.
4. **List:** Only **active** (`isActive: true`) records are returned by list and getById.
5. **Balance semantics:**  
   - Customer: positive balance = we owe them; negative = they owe us.  
   - Supplier: positive = we owe them; negative = they owe us.  
   Add balance (customer) increases balance; add balance (supplier) decreases balance. Refund reverses the effect.
6. **Request body:** Prefer `{ "data": payload }` for consistency with other APIs.
