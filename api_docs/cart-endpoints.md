# Cart page — API endpoints and data

This document lists every endpoint the **cart page** (and its components) calls, and the **request/response JSON** for each. Auth required. Branch from context where applicable. camelCase only.

**Errors:** `400` validation, `401`/`403` auth, `404` not found, `409` conflict, `500` server.

**Success envelope:** `success: boolean`, `message?: string`, `data: object | array`, `pagination?: object` (list only), `metadata?: object`.

**Where used:** Cart feature = `frontend/src/features/cart` (CartPage, CartHeader, OrderSummary, ItemsModal, CustomerModal, SupplierModal, cartService, transferService) plus hooks from items, branches, customer-supplier, and batches (e.g. refetch batches).

---

## 1. POST `/api/transactions` — Create transaction (cart submit)

**When:** User submits the cart as a transaction (sale, purchase, imported, adjustment, waste, damage). Called from `cartService.createTransaction`.

**Request (body)**

```json
{
  "data": {
    "transactionType": "sale" (string (M) — TransactionType),  
    "supplierId": null (number | null (O)),
    "customerId": 5 (number | null (O)),
    "notes": null (string | null (O)),
    "transactionDate": null (string | null (O) — ISO date),
    "attachments": [] (array (O)),
    "items": [
      {
        "itemId": 1 (number (M)),
        "batches": [
          {
            "batchNumber": "BATCH-001" (string (M)),
            "quantity": 10 (number (M)),
            "costPrice": 80 (number | null (O)),
            "unitPrice": 100 (number | null (O)),
            "expirationDate": "2024-12-31T00:00:00.000Z" (string | null (O))
          }
        ]
      }
    ],
    "payment": null (object | null (O)),
    "paymentMethods": [
      {
        "method": "cash" (string (M) — PaymentMethodType),
        "amount": 1000 (number (M)),
        "attachment": null (string | null (O)),
        "referenceNumber": null (string | null (O)),
        "bankId": null (number | null (O))
      }
    ]
  }
}
```

**Response (201)** — Cart uses `response.data` (transaction summary).

```json
{
  "success": true (boolean (M)),
  "message": "Transaction created successfully" (string (M)),
  "data": {
    "id": 100 (number (M)),
    "companyId": 1 (number (M)),
    "branchId": 2 (number (M)),
    "transactionType": "sale" (string (M) — TransactionType),
    "transactionNumber": "TXN-2024-002" (string (M)),
    "status": "completed" (string (M) — TransactionStatus),
    "supplierId": null (number | null (M)),
    "customerId": 5 (number | null (M)),
    "subtotal": 900 (number (M)),
    "totalTax": 100 (number (M)),
    "totalAmount": 1000 (number (M)),
    "notes": null (string | null (M)),
    "attachments": [] (array (M)),
    "relatedId": null (number | null (M)),
    "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "createdBy": 1 (number | null (M)),
    "updatedBy": null (number | null (M)),
    "creatorName": "John Doe" (string | null (M)),
    "updaterName": null (string | null (M)),
    "supplierName": null (string | null (M)),
    "customerName": "Customer X" (string | null (M)),
    "salesOrderNumber": null (string | null (M))
  },
  "metadata": {} (object (O))
}
```

---

## 2. POST `/api/transfers` — Create transfer (cart submit)

**When:** User submits the cart as a transfer. Called from `transferService.createTransfer`.

**Request (body)**

```json
{
  "transferType": "transfer" (string (M) — TransferType),
  "destinationBranchId": 3 (number (M)),
  "notes": null (string | null (O)),
  "transactionDate": null (string | null (O) — ISO date),
  "items": [
    {
      "itemId": 1 (number (M)),
      "batches": [
        {
          "batchNumber": "BATCH-001" (string (M)),
          "quantity": 10 (number (M)),
          "costPrice": 80 (number | null (O)),
          "unitPrice": 100 (number | null (O)),
          "expirationDate": "2024-12-31T00:00:00.000Z" (string | null (O))
        }
      ]
    }
  ]
}
```

**Response (201)** — Cart uses `response.data` (transfer summary).

```json
{
  "success": true (boolean (M)),
  "message": "Transfer created successfully" (string (M)),
  "data": {
    "id": 456 (number (M)),
    "companyId": 1 (number (M)),
    "transferType": "transfer" (string (M) — TransferType),
    "transferNumber": "TR24010001-1234" (string (M)),
    "sourceBranchId": 2 (number (M)),
    "destinationBranchId": 3 (number (M)),
    "relatedTransferId": null (number | null (M)),
    "status": "pending" (string (M) — TransferStatus),
    "notes": null (string | null (M)),
    "attachments": [] (array (M)),
    "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "createdBy": 1 (number | null (M)),
    "updatedBy": null (number | null (M)),
    "sourceBranchName": "Source Branch" (string (M)),
    "destinationBranchName": "Destination Branch" (string (M)),
    "creatorName": null (string | null (M)),
    "updaterName": null (string | null (M)),
    "relatedTransfer": null (object | null (M)),
    "relatedTransfers": null (array | null (M))
  },
  "metadata": {} (object (O))
}
```

---

## 3. GET `/api/items/include-batch` — List items with batches (cart)

**When:** Cart page and CartHeader load items for search/add-to-cart. ItemsModal receives `allItems` from parent. Called via `useItems().fetchItemsWithBatches()` → `itemService.getItemsIncludeBatches()`. **Branch required** (e.g. `x-branch-id`); returns 400/403 if missing.

**Request:** Query params only (e.g. `page`, `limit`, `search`, `categoryId`, `brandId`). No body. Branch from context (required).

**Response (200)** — Cart uses `response.data` (array of items). Each item includes a `batches` array in **canonical batch shape** with `quantity` at the current branch.

```json
{
  "success": true (boolean (M)),
  "message": "Items fetched successfully" (string (M)),
  "data": [
    {
      "id": 1 (number (M)),
      "companyId": 1 (number (M)),
      "name": "Paracetamol 500mg" (string (M)),
      "description": "Pain relief tablets" (string | null (M)),
      "categoryId": 1 (number | null (M)),
      "subCategoryId": null (number | null (M)),
      "brandId": 1 (number | null (M)),
      "unitId": 1 (number | null (M)),
      "sku": "SKU-001" (string | null (M)),
      "code": "ITEM-001" (string | null (M)),
      "barcode": "1234567890123" (string | null (M)),
      "imageUrl": null (string | null (M)),
      "isTaxable": true (boolean (M)),
      "taxRate": 8 (number (M)),
      "isActive": true (boolean (M)),
      "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "createdBy": 1 (number | null (M)),
      "updatedBy": null (number | null (M)),
      "createdByName": "John Doe" (string | null (M)),
      "categories": "Category Name" (string | null (O)),
      "subCategories": null (string | null (O)),
      "brands": "Brand Name" (string | null (O)),
      "units": "Unit" (string | null (O)),
      "batches": [
        {
          "id": 10 (number (M)),
          "companyId": 1 (number (M)),
          "itemId": 1 (number (M)),
          "batchNumber": "BATCH-001" (string (M)),
          "batchName": "Paracetamol batch" (string | null (M)),
          "expirationDate": "2025-12-31T00:00:00.000Z" (string | null (M)),
          "manufacturingDate": "2024-01-01T00:00:00.000Z" (string | null (M)),
          "costPrice": 50 (number | null (M)),
          "unitPrice": 80 (number | null (M)),
          "supplierBatchNumber": null (string | null (M)),
          "notes": null (string | null (M)),
          "isActive": true (boolean (M)),
          "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
          "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
          "createdBy": "John Doe" (string | null (M)),
          "updatedBy": null (string | null (M)),
          "itemName": "Paracetamol 500mg" (string | null (M)),
          "itemCode": "ITEM-001" (string | null (M)),
          "quantity": 100 (number (M) — at current branch)
        }
      ]
    }
  ],
  "pagination": {
    "currentPage": 1 (number (M)),
    "totalPages": 1 (number (M)),
    "totalItems": 1 (number (M)),
    "itemsPerPage": 25 (number (M)),
    "hasNextPage": false (boolean (M)),
    "hasPreviousPage": false (boolean (M)),
    "nextPage": null (number | null (M)),
    "prevPage": null (number | null (M))
  },
  "metadata": {} (object (O))
}
```

---

## 4. GET `/api/branch` — List branches

**When:** CartHeader and OrderSummary need branch list (e.g. transfer destination). Called via `useBranches()` → branchService.

**Request:** Query params only (e.g. `page`, `limit`, `search`). No body.

**Response (200)** — Cart uses `response.data` (array of branches) and optional `pagination`.

```json
{
  "success": true (boolean (M)),
  "message": "Branches fetched successfully" (string (M)),
  "data": [
    {
      "id": 1 (number (M)),
      "companyId": 1 (number (M)),
      "name": "Main Branch" (string (M)),
      "address": null (string | null (M)),
      "phone": null (string | null (M)),
      "isActive": true (boolean (M)),
      "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "createdBy": 1 (number | null (M)),
      "updatedBy": null (number | null (M))
    }
  ],
  "pagination": {
    "currentPage": 1 (number (M)),
    "totalPages": 1 (number (M)),
    "totalItems": 1 (number (M)),
    "itemsPerPage": 25 (number (M)),
    "hasNextPage": false (boolean (M)),
    "hasPreviousPage": false (boolean (M)),
    "nextPage": null (number | null (M)),
    "prevPage": null (number | null (M))
  },
  "metadata": {} (object (O))
}
```

---

## 5. GET `/api/customer-suppliers` — List customers or suppliers

**When:** CustomerModal and SupplierModal open; cart fetches customers (sale) or suppliers (purchase/imported). Called via `useCustomerSuppliers()` with `type: "CUSTOMER"` or `type: "SUPPLIER"`.

**Request:** Query params: `type` (CUSTOMER | SUPPLIER), `page`, `limit`, `search`. No body.

**Response (200)** — Cart uses `response.data` (array of customer/supplier records) and optional `pagination`.

```json
{
  "success": true (boolean (M)),
  "message": "Customer suppliers fetched successfully" (string (M)),
  "data": [
    {
      "id": 1 (number (M)),
      "companyId": 1 (number (M)),
      "name": "Customer X" (string (M)),
      "phone": "+251..." (string (M)),
      "accountCode": "CUST-001" (string (M)),
      "type": "CUSTOMER" (string (M) — CUSTOMER | SUPPLIER),
      "balance": 0 (number (M)),
      "isActive": true (boolean (M)),
      "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "createdBy": 1 (number | null (M)),
      "updatedBy": null (number | null (M))
    }
  ],
  "pagination": {
    "currentPage": 1 (number (M)),
    "totalPages": 1 (number (M)),
    "totalItems": 1 (number (M)),
    "itemsPerPage": 100 (number (M)),
    "hasNextPage": false (boolean (M)),
    "hasPreviousPage": false (boolean (M)),
    "nextPage": null (number | null (M)),
    "prevPage": null (number | null (M))
  },
  "metadata": {} (object (O))
}
```

---

## 6. GET `/api/branch-stocks/:itemId/batches` — Batches for item at current branch

**When:** Refetching available batches for cart items (e.g. after quantity change or to get latest stock). Called from `cartUtils.refetchCartItemBatches` via `batchOperationService.getBatchesForItem(itemId)`.

**Request:** No body. Path param `itemId` = item ID. Branch from context (e.g. `x-branch-id`).

**Response (200)** — Cart uses `response.data` (array of batches in **canonical batch shape** with `quantity` at the current branch). Same batch object shape as in item.batches and GET /api/batches.

```json
{
  "success": true (boolean (M)),
  "message": "Batches fetched successfully" (string (M)),
  "data": [
    {
      "id": 1 (number (M)),
      "companyId": 1 (number (M)),
      "itemId": 1 (number (M)),
      "batchNumber": "BATCH-001" (string (M)),
      "batchName": "Paracetamol batch" (string | null (M)),
      "expirationDate": "2025-12-31T00:00:00.000Z" (string | null (M)),
      "manufacturingDate": "2024-01-01T00:00:00.000Z" (string | null (M)),
      "costPrice": 50 (number | null (M) — from BranchStockBatches when present),
      "unitPrice": 80 (number | null (M) — from BranchStockBatches when present),
      "supplierBatchNumber": null (string | null (M)),
      "notes": null (string | null (M)),
      "isActive": true (boolean (M)),
      "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "createdBy": "John Doe" (string | null (M) — display name),
      "updatedBy": null (string | null (M) — display name),
      "itemName": "Item A" (string | null (M)),
      "itemCode": "ITEM-001" (string | null (M)),
      "quantity": 10 (number (M) — at current branch)
    }
  ],
  "metadata": {} (object (O))
}
```

---

## 7. GET `/api/banks` — List banks

**When:** PaymentModal opens; cart fetches banks for bank transfer payment method. Called via `useBanks().fetchBanks()` → `bankService.getBanks()`.

**Request:** Query params only (e.g. `page`, `limit`, `search`). No body.

**Response (200)** — Cart uses `response.data` (array of banks) and optional `pagination`.

```json
{
  "success": true (boolean (M)),
  "message": "Banks fetched successfully" (string (M)),
  "data": [
    {
      "id": 1 (number (M)),
      "companyId": 1 (number (M)),
      "name": "Commercial Bank of Ethiopia" (string (M)),
      "isActive": true (boolean (M)),
      "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "createdBy": 1 (number | null (M)),
      "updatedBy": null (number | null (M))
    }
  ],
  "pagination": {
    "currentPage": 1 (number (M)),
    "totalPages": 1 (number (M)),
    "totalItems": 1 (number (M)),
    "itemsPerPage": 100 (number (M)),
    "hasNextPage": false (boolean (M)),
    "hasPreviousPage": false (boolean (M)),
    "nextPage": null (number | null (M)),
    "prevPage": null (number | null (M))
  },
  "metadata": {} (object (O))
}
```

---

## Summary

| # | Method | Endpoint | Used by (cart) |
|---|--------|----------|----------------|
| 1 | POST | `/api/transactions` | cartService.createTransaction |
| 2 | POST | `/api/transfers` | transferService.createTransfer |
| 3 | GET | `/api/items/include-batch` | useItems().fetchItemsWithBatches (CartPage, CartHeader, ItemsModal — items with batches; branch required) |
| 4 | GET | `/api/branch` | useBranches (CartHeader, OrderSummary) |
| 5 | GET | `/api/customer-suppliers` | useCustomerSuppliers (CustomerModal, SupplierModal) |
| 6 | GET | `/api/branch-stocks/:itemId/batches` | batchOperationService.getBatchesForItem (refetch cart item batches) |
| 7 | GET | `/api/banks` | useBanks (PaymentModal — bank transfer payment method) |
