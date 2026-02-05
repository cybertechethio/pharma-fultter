# Branch Stocks API — Request / Response (UI-used endpoints)

This doc covers **only the endpoints used by the UI** (`frontend/src/features/branch-stocks`): list, get one, update, get batches for item, expired batches.

**Base path:** **`/api/branch-stocks`**. All mutation bodies use **`{ "data": { ... } }`**. Auth required. Branch from context (e.g. `x-branch-id`). camelCase only.

**Errors:** `400` validation, `401`/`403` auth, `404` not found, `500` server.

**Success envelope:** `success: boolean`, `message?: string`, `data: object | array`, `pagination?: object` (list only), `metadata?: object`.

---

## Data types & enums

### Enums

| Enum | Values | Usage |
|------|--------|--------|
| **lowStockStatus** (BranchStockLowStatus) | `inactive`, `critical`, `ignored`, `new` | Request body (update), response `lowStockStatus` |
| **sortBy** (list) | `createdAt`, `totalQuantity`, `lowStockThreshold` | Query param `sortBy` on GET /api/branch-stocks |
| **sortOrder** | `asc`, `desc` | Query param `sortOrder` on GET /api/branch-stocks |

### BranchStock object (response: list, get one, update)

| Field | Type | Required in response | Notes |
|-------|------|----------------------|--------|
| id | number | M | |
| companyId | number | M | |
| branchId | number | M | |
| itemId | number | M | |
| totalQuantity | number | M | |
| lowStockThreshold | number \| null | M | |
| lowStockStatus | string | M | Enum: `inactive` \| `critical` \| `ignored` \| `new` |
| location | string \| null | M | |
| createdAt | string | M | ISO date |
| updatedAt | string | M | ISO date |
| createdBy | number \| null | M | |
| updatedBy | number \| null | M | |
| item | object \| null | M | Flattened: id, name, code, categories, subCategories, brands, units, models (strings or null) |
| branchStockBatches | array | M | See below |

### branchStockBatches element

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| id | number | M | |
| batchId | number | M | |
| quantity | number | M | |
| costPrice | number \| null | M | |
| unitPrice | number \| null | M | |
| lastUsedAt | string \| null | M | ISO date |
| batchNumber | string \| null | M | |
| batchName | string \| null | M | |
| expirationDate | string \| null | M | ISO date |

### Batch-for-item object (response: GET /:itemId/batches)

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| batchId | number | M | |
| batchNumber | string | M | |
| batchName | string \| null | M | |
| quantity | number | M | |
| expirationDate | string \| null | M | ISO date |
| manufacturingDate | string \| null | M | ISO date |

### Expired item object (response: GET /expired-batches)

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| itemId | number | M | |
| itemName | string | M | |
| itemCode | string \| null | M | |
| category | string \| null | M | |
| brand | string \| null | M | |
| sku | string \| null | M | |
| unit | string \| null | M | |
| barcode | string \| null | M | |
| totalExpiredQuantity | number | M | |
| batches | array | M | Expired batch rows (see below) |

### Expired batch row (inside expired item.batches)

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| batchId | number | M | |
| batchName | string \| null | M | |
| expirationDate | string \| null | M | |
| quantity | number | M | |
| costPrice | number \| null | M | |
| unitPrice | number \| null | M | |

### Pagination object (list response only)

| Field | Type | Required |
|-------|------|----------|
| currentPage | number | M |
| totalPages | number | M |
| totalItems | number | M |
| itemsPerPage | number | M |
| hasNextPage | boolean | M |
| hasPreviousPage | boolean | M |
| nextPage | number \| null | M |
| prevPage | number \| null | M |

---

## 1. LIST — GET `/api/branch-stocks`

**Used by UI:** `branchStockService.getBranchStocks` (BranchStockList, BranchStockDetailPage, etc.).

**Query** (all optional)

| Param | Type | Required | Default | Notes |
|-------|------|----------|---------|--------|
| page | number | O | 1 | ≥ 1 |
| limit | number | O | 1000 | 1–1000; API may accept `size` |
| all | boolean | O | false | If true, no pagination (single page) |
| itemId | number | O | — | Filter by item |
| categoryId | number | O | — | Filter by item category |
| batchId | number | O | — | Filter by batch |
| lowStockStatus | string | O | — | Enum: `inactive` \| `critical` \| `ignored` \| `new` |
| lowStock | boolean | O | — | If true, exclude `inactive` |
| search | string | O | — | Item name, branch name |
| sortBy | string | O | createdAt | Enum: `createdAt` \| `totalQuantity` \| `lowStockThreshold` |
| sortOrder | string | O | desc | Enum: `asc` \| `desc` |

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "Branch stock fetched successfully" (string (M)),
  "data": [
    {
      "id": 1 (number (M)),
      "companyId": 1 (number (M)),
      "branchId": 2 (number (M)),
      "itemId": 10 (number (M)),
      "totalQuantity": 100 (number (M)),
      "lowStockThreshold": 20 (number \| null (M)),
      "lowStockStatus": "critical" (lowStockStatus: inactive | critical | ignored | new (M)),
      "location": "Aisle 3" (string \| null (M)),
      "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "createdBy": null (number \| null (M)),
      "updatedBy": null (number \| null (M)),
      "item": {
        "id": 10 (number (M)),
        "name": "Item Name" (string (M)),
        "code": "ITEM-001" (string \| null (M)),
        "categories": "Category Name" (string \| null (M)),
        "subCategories": null (string \| null (M)),
        "brands": "Brand Name" (string \| null (M)),
        "units": "Unit" (string \| null (M)),
        "models": null (string \| null (M))
      },
      "branchStockBatches": [
        {
          "id": 1 (number (M)),
          "batchId": 5 (number (M)),
          "quantity": 50 (number (M)),
          "costPrice": 80 (number \| null (M)),
          "unitPrice": 100 (number \| null (M)),
          "lastUsedAt": "2024-01-10T12:00:00.000Z" (string \| null (M)),
          "batchNumber": "BATCH-001" (string \| null (M)),
          "batchName": "Batch 1" (string \| null (M)),
          "expirationDate": "2024-12-31T00:00:00.000Z" (string \| null (M))
        }
      ]
    }
  ],
  "pagination": {
    "currentPage": 1 (number (M)),
    "totalPages": 5 (number (M)),
    "totalItems": 50 (number (M)),
    "itemsPerPage": 10 (number (M)),
    "hasNextPage": true (boolean (M)),
    "hasPreviousPage": false (boolean (M)),
    "nextPage": 2 (number \| null (M)),
    "prevPage": null (number \| null (M))
  },
  "metadata": { ... }
}
```

---

## 2. GET ONE — GET `/api/branch-stocks/:id`

**Used by UI:** `branchStockService.getBranchStockById` (e.g. detail page).

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "Branch stock fetched successfully" (string (M)),
  "data": {
    "id": 1 (number (M)),
    "companyId": 1 (number (M)),
    "branchId": 2 (number (M)),
    "itemId": 10 (number (M)),
    "totalQuantity": 100 (number (M)),
    "lowStockThreshold": 20 (number \| null (M)),
    "lowStockStatus": "critical" (lowStockStatus: inactive | critical | ignored | new (M)),
    "location": "Aisle 3" (string \| null (M)),
    "createdAt": "..." (string (M)),
    "updatedAt": "..." (string (M)),
    "createdBy": null (number \| null (M)),
    "updatedBy": null (number \| null (M)),
    "item": { ... },
    "branchStockBatches": [ ... ]
  },
  "metadata": { ... }
}
```

404 if not found or not in current branch.

---

## 3. UPDATE — PUT `/api/branch-stocks/:id`

**Used by UI:** `branchStockService.updateBranchStock` (e.g. low-stock settings, location).

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Request (body)** — All optional; at least one required.

```json
{
  "data": {
    "lowStockThreshold": 25 (number \| null (O)),
    "lowStockStatus": "ignored" (lowStockStatus: inactive | critical | ignored | new (O)),
    "location": "Warehouse A" (string \| null (O))
  }
}
```

**Response 200** — Same shape as get one; updated branch stock with `item` and `branchStockBatches`.

400 if validation fails; 404 if not found or not in current branch. Updating `lowStockThreshold` may cause backend to recalculate `lowStockStatus`.

---

## 4. GET BATCHES FOR ITEM — GET `/api/branch-stocks/:itemId/batches`

**Used by UI:** `branchStockService.getBatchesForItem` (batch dropdown, bin card, etc.). Route param is **itemId** (not branch-stock id).

**Path**

| Param | Type | Required |
|-------|------|----------|
| itemId | number | M |

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "Batches fetched successfully" (string (M)),
  "data": [
    {
      "batchId": 5 (number (M)),
      "batchNumber": "BATCH-001" (string (M)),
      "batchName": "Batch 1" (string \| null (M)),
      "quantity": 50 (number (M)),
      "expirationDate": "2024-12-31T00:00:00.000Z" (string \| null (M)),
      "manufacturingDate": "2024-01-01T00:00:00.000Z" (string \| null (M))
    }
  ],
  "metadata": { ... }
}
```

404 if item has no branch stock in current branch (implementation may return `[]`).

---

## 5. EXPIRED BATCHES — GET `/api/branch-stocks/expired-batches`

**Used by UI:** `expiredBatchesService.getExpiredBatches` (ExpiredBatchesList).

**Query:** None. Branch from context.

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "Expired batches fetched successfully" (string (M)),
  "data": [
    {
      "itemId": 10 (number (M)),
      "itemName": "Item Name" (string (M)),
      "itemCode": "ITEM-001" (string \| null (M)),
      "category": "Category Name" (string \| null (M)),
      "brand": "Brand Name" (string \| null (M)),
      "sku": "SKU-001" (string \| null (M)),
      "unit": "Unit" (string \| null (M)),
      "barcode": "123456789" (string \| null (M)),
      "totalExpiredQuantity": 25 (number (M)),
      "batches": [
        {
          "batchId": 5 (number (M)),
          "batchName": "Batch 1" (string \| null (M)),
          "expirationDate": "2024-01-10" (string \| null (M)),
          "quantity": 15 (number (M)),
          "costPrice": 80 (number \| null (M)),
          "unitPrice": 100 (number \| null (M))
        }
      ]
    }
  ],
  "metadata": { ... }
}
```

---

## Summary (UI-used only)

| # | Method | Endpoint | Used by UI |
|---|--------|----------|------------|
| 1 | GET | `/api/branch-stocks` | `branchStockService.getBranchStocks` |
| 2 | GET | `/api/branch-stocks/:id` | `branchStockService.getBranchStockById` |
| 3 | PUT | `/api/branch-stocks/:id` | `branchStockService.updateBranchStock` |
| 4 | GET | `/api/branch-stocks/:itemId/batches` | `branchStockService.getBatchesForItem` |
| 5 | GET | `/api/branch-stocks/expired-batches` | `expiredBatchesService.getExpiredBatches` |

**Route order:** `GET /expired-batches` is registered before `GET /:id` and `GET /:itemId/batches`, so paths are distinct. Branch from request context (e.g. `x-branch-id`); do not send `branchId` in body.
