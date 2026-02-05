# Batches & Batch Operations API — Request / Response

**Base paths:** **`/api/batches`** (CRUD), **`/api/batch`** (operations). All mutation bodies use **`{ "data": { ... } }`**. Auth required. Branch for operations from context (e.g. `x-branch-id`). camelCase only.

**Errors:** `400` validation, `401`/`403` auth, `404` not found, `500` server.

**Success envelope:** `success: boolean`, `message?: string`, `data: object | array`, `pagination?: object` (list only), `metadata?: object`.

---

## Data types & enums

### Enums

| Enum | Values | Usage |
|------|--------|--------|
| **BatchOperationType** | `batchTransfer`, `batchConsolidation`, `batchSplit` | Response `operationType` in batch operations |
| **sortBy** (batches list) | `createdAt`, `batchNumber`, `batchName` | Query param `sortBy` on GET /api/batches |
| **sortOrder** | `asc`, `desc` | Query param `sortOrder` on GET /api/batches |

### Batch object (response: get one, create, update, list batches; also inside item.batches when include=batches)

| Field | Type | Required in response | Notes |
|-------|------|----------------------|--------|
| id | number | M | |
| companyId | number | M | |
| itemId | number | M | |
| batchNumber | string | M | Generated; unique per company |
| batchName | string \| null | M | |
| expirationDate | string \| null | M | ISO date |
| manufacturingDate | string \| null | M | ISO date |
| costPrice | number \| null | M | |
| unitPrice | number \| null | M | |
| supplierBatchNumber | string \| null | M | |
| notes | string \| null | M | |
| isActive | boolean | M | |
| createdAt | string | M | ISO date |
| updatedAt | string | M | ISO date |
| createdBy | string \| null | M | Display name of creator |
| updatedBy | string \| null | M | Display name of updater |
| itemName | string \| null | M | From item |
| itemCode | string \| null | M | From item |
| quantity | number \| null | O | Only when branch context (e.g. x-branch-id) |

### BatchOperation object (response: transfer, consolidation, split)

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| id | number | M | |
| companyId | number | M | |
| branchId | number | M | |
| itemId | number | M | |
| operationType | string | M | Enum: `batchTransfer` \| `batchConsolidation` \| `batchSplit` |
| sourceBatchId | number | M | |
| sourceBatchNumber | string | M | |
| destinationBatchId | number | M | |
| destinationBatchNumber | string | M | |
| quantity | number | M | |
| notes | string \| null | M | |
| createdAt | string | M | ISO date |
| updatedAt | string | M | ISO date |
| createdBy | number \| null | M | |
| updatedBy | number \| null | M | |

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

# Part 1: Batches API (`/api/batches`)

## 1. CREATE — POST `/api/batches`

**Mandatory:** `itemId`, `batchName`, `costPrice`, `unitPrice`. All other fields optional.

**Request (body)**

```json
{
  "data": {
    "itemId": 1 (number (M)),
    "batchName": "Display name" (string (M)),
    "costPrice": 80.5 (number (M)),
    "unitPrice": 100 (number (M)),
    "expirationDate": "2024-12-31T00:00:00.000Z" (string \| null (O)),
    "manufacturingDate": "2024-01-01T00:00:00.000Z" (string \| null (O)),
    "supplierBatchNumber": "SUP-001" (string \| null (O)),
    "notes": "Optional notes" (string \| null (O))
  }
}
```

**Response 201**

```json
{
  "success": true (boolean (M)),
  "message": "Batch created successfully" (string (M)),
  "data": {
    "id": 1 (number (M)),
    "companyId": 1 (number (M)),
    "itemId": 1 (number (M)),
    "batchNumber": "BATCH-001" (string (M)),
    "batchName": "Display name" (string \| null (M)),
    "expirationDate": "2024-12-31T00:00:00.000Z" (string \| null (M)),
    "manufacturingDate": "2024-01-01T00:00:00.000Z" (string \| null (M)),
    "costPrice": 80.5 (number \| null (M)),
    "unitPrice": 100 (number \| null (M)),
    "supplierBatchNumber": "SUP-001" (string \| null (M)),
    "notes": "Optional notes" (string \| null (M)),
    "isActive": true (boolean (M)),
    "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "createdBy": "John Doe" (string \| null (M)),
    "updatedBy": null (string \| null (M)),
    "itemName": "Item Name" (string \| null (M)),
    "itemCode": "ITEM-001" (string \| null (M))
  },
  "metadata": { "requestId": "...", "timestamp": "..." }
}
```

---

## 2. UPDATE — PUT `/api/batches/:id`

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Request (body)** — All optional; at least one required. No `itemId`; `batchNumber` not updatable.

```json
{
  "data": {
    "batchName": "New name" (string \| null (O)),
    "expirationDate": "2025-06-30T00:00:00.000Z" (string \| null (O)),
    "manufacturingDate": null (string \| null (O)),
    "costPrice": 90 (number \| null (O)),
    "unitPrice": 110 (number \| null (O)),
    "supplierBatchNumber": null (string \| null (O)),
    "notes": null (string \| null (O))
  }
}
```

**Response 200** — Same shape as create response; `data` is updated batch.

404 if not found.

---

## 3. GET ONE — GET `/api/batches/:id`

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "Batch fetched successfully" (string (M)),
  "data": {
    "id": 1 (number (M)),
    "companyId": 1 (number (M)),
    "itemId": 1 (number (M)),
    "batchNumber": "BATCH-001" (string (M)),
    "batchName": null (string \| null (M)),
    "expirationDate": "2024-12-31T00:00:00.000Z" (string \| null (M)),
    "manufacturingDate": null (string \| null (M)),
    "costPrice": 80.5 (number \| null (M)),
    "unitPrice": 100 (number \| null (M)),
    "supplierBatchNumber": null (string \| null (M)),
    "notes": null (string \| null (M)),
    "isActive": true (boolean (M)),
    "createdAt": "..." (string (M)),
    "updatedAt": "..." (string (M)),
    "createdBy": "John Doe" (string \| null (M)),
    "updatedBy": null (string \| null (M)),
    "itemName": "Item Name" (string \| null (M)),
    "itemCode": "ITEM-001" (string \| null (M))
  },
  "metadata": { ... }
}
```

404 if not found.

---

## 4. LIST — GET `/api/batches`

**Query** (all optional)

| Param | Type | Required | Default | Notes |
|-------|------|----------|---------|--------|
| page | number | O | 1 | ≥ 1 |
| limit | number | O | 1000 | 1–1000; API may accept `size` |
| itemId | number | O | — | Filter by item |
| search | string | O | — | batchNumber, batchName |
| isActive | boolean | O | — | |
| sortBy | string | O | createdAt | Enum: `createdAt` \| `batchNumber` \| `batchName` |
| sortOrder | string | O | desc | Enum: `asc` \| `desc` |

**Response 200**

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
      "batchName": null (string \| null (M)),
      "expirationDate": "2024-12-31T00:00:00.000Z" (string \| null (M)),
      "manufacturingDate": null (string \| null (M)),
      "costPrice": 80.5 (number \| null (M)),
      "unitPrice": 100 (number \| null (M)),
      "supplierBatchNumber": null (string \| null (M)),
      "notes": null (string \| null (M)),
      "isActive": true (boolean (M)),
      "createdAt": "..." (string (M)),
      "updatedAt": "..." (string (M)),
      "createdBy": "John Doe" (string \| null (M)),
      "updatedBy": null (string \| null (M)),
      "itemName": "Item Name" (string \| null (M)),
      "itemCode": "ITEM-001" (string \| null (M))
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

# Part 2: Items with batches

Use **GET /api/items?include=batches** for initial batch list: returns items with `batches[]` and `batchSummary` per item. When branch context is sent (e.g. `x-branch-id`), each batch includes `quantity`. See **items.md** for full item/list shape.

**GET /api/items/:itemId/batches** — Returns `data`: array of batch objects only (same Batch shape; `quantity` when branch context). No pagination. See **items.md**.

---

# Part 3: Batch Operations API (`/api/batch`)

Branch from request context (e.g. `x-branch-id`). Do not send `branchId` in body.

## 5. BATCH TRANSFER — POST `/api/batch/transfer`

**Mandatory:** `itemId`, `sourceBatchNumber`, `destinationBatchNumber`, `quantity`. Others optional.

**Request (body)**

```json
{
  "data": {
    "itemId": 1 (number (M)),
    "sourceBatchNumber": "BATCH-001" (string (M)),
    "destinationBatchNumber": "BATCH-002" (string (M)),
    "quantity": 10 (number (M)),
    "costPrice": 80 (number \| null (O)),
    "unitPrice": 100 (number \| null (O)),
    "expirationDate": "2024-12-31T00:00:00.000Z" (string \| null (O)),
    "notes": "Optional notes" (string \| null (O))
  }
}
```

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "Batch transfer completed successfully" (string (M)),
  "data": {
    "id": 1 (number (M)),
    "companyId": 1 (number (M)),
    "branchId": 2 (number (M)),
    "itemId": 1 (number (M)),
    "operationType": "batchTransfer" (BatchOperationType: batchTransfer | batchConsolidation | batchSplit (M)),
    "sourceBatchId": 10 (number (M)),
    "sourceBatchNumber": "BATCH-001" (string (M)),
    "destinationBatchId": 11 (number (M)),
    "destinationBatchNumber": "BATCH-002" (string (M)),
    "quantity": 10 (number (M)),
    "notes": "Optional notes" (string \| null (M)),
    "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "createdBy": null (number \| null (M)),
    "updatedBy": null (number \| null (M))
  },
  "metadata": { ... }
}
```

400 if insufficient quantity; 404 if source batch not in branch.

---

## 6. BATCH CONSOLIDATION — POST `/api/batch/consolidation`

**Mandatory:** `itemId`, `destinationBatchNumber`, `sources` (min 1 entry). `sources[].batchNumber` M; `sources[].quantity` O (null = all).

**Request (body)**

```json
{
  "data": {
    "itemId": 1 (number (M)),
    "destinationBatchNumber": "BATCH-MERGED" (string (M)),
    "sources": [
      {
        "batchNumber": "BATCH-001" (string (M)),
        "quantity": 5 (number \| null (O)),
        "costPrice": 80 (number \| null (O)),
        "unitPrice": 100 (number \| null (O)),
        "expirationDate": "2024-12-31T00:00:00.000Z" (string \| null (O))
      },
      {
        "batchNumber": "BATCH-002" (string (M)),
        "quantity": null (number \| null (O))
      }
    ],
    "notes": "Consolidation notes" (string \| null (O))
  }
}
```

**Response 200** — `data`: array of BatchOperation objects (one per source); `operationType`: `batchConsolidation`.

```json
{
  "success": true (boolean (M)),
  "message": "Batch consolidation completed successfully" (string (M)),
  "data": [
    {
      "id": 1 (number (M)),
      "companyId": 1 (number (M)),
      "branchId": 2 (number (M)),
      "itemId": 1 (number (M)),
      "operationType": "batchConsolidation" (BatchOperationType: batchTransfer | batchConsolidation | batchSplit (M)),
      "sourceBatchId": 10 (number (M)),
      "sourceBatchNumber": "BATCH-001" (string (M)),
      "destinationBatchId": 12 (number (M)),
      "destinationBatchNumber": "BATCH-MERGED" (string (M)),
      "quantity": 5 (number (M)),
      "notes": "Consolidation notes" (string \| null (M)),
      "createdAt": "..." (string (M)),
      "updatedAt": "..." (string (M)),
      "createdBy": null (number \| null (M)),
      "updatedBy": null (number \| null (M))
    }
  ],
  "metadata": { ... }
}
```

400 if quantity exceeds available; 404 if source batch not in branch.

---

## 7. BATCH SPLIT — POST `/api/batch/split`

**Mandatory:** `itemId`, `sourceBatchNumber`, `destinations` (min 1 entry). Each `destinations[].batchNumber` M, `destinations[].quantity` M.

**Request (body)**

```json
{
  "data": {
    "itemId": 1 (number (M)),
    "sourceBatchNumber": "BATCH-001" (string (M)),
    "destinations": [
      {
        "batchNumber": "BATCH-001-A" (string (M)),
        "quantity": 5 (number (M)),
        "costPrice": 80 (number \| null (O)),
        "unitPrice": 100 (number \| null (O)),
        "expirationDate": "2024-12-31T00:00:00.000Z" (string \| null (O))
      },
      {
        "batchNumber": "BATCH-001-B" (string (M)),
        "quantity": 3 (number (M)),
        "costPrice": null (number \| null (O)),
        "unitPrice": null (number \| null (O)),
        "expirationDate": null (string \| null (O))
      }
    ],
    "notes": "Split notes" (string \| null (O))
  }
}
```

**Response 200** — `data`: array of BatchOperation objects (one per destination); `operationType`: `batchSplit`.

```json
{
  "success": true (boolean (M)),
  "message": "Batch split completed successfully" (string (M)),
  "data": [
    {
      "id": 1 (number (M)),
      "companyId": 1 (number (M)),
      "branchId": 2 (number (M)),
      "itemId": 1 (number (M)),
      "operationType": "batchSplit" (BatchOperationType: batchTransfer | batchConsolidation | batchSplit (M)),
      "sourceBatchId": 10 (number (M)),
      "sourceBatchNumber": "BATCH-001" (string (M)),
      "destinationBatchId": 13 (number (M)),
      "destinationBatchNumber": "BATCH-001-A" (string (M)),
      "quantity": 5 (number (M)),
      "notes": "Split notes" (string \| null (M)),
      "createdAt": "..." (string (M)),
      "updatedAt": "..." (string (M)),
      "createdBy": null (number \| null (M)),
      "updatedBy": null (number \| null (M))
    }
  ],
  "metadata": { ... }
}
```

400 if total destination quantity exceeds source; 404 if source batch not in branch.

---

## Summary

| # | Method | Endpoint | Description |
|---|--------|----------|-------------|
| 1 | POST | `/api/batches` | Create batch |
| 2 | PUT | `/api/batches/:id` | Update batch |
| 3 | GET | `/api/batches/:id` | Get batch by ID |
| 4 | GET | `/api/batches` | List batches (paginated) |
| 5 | POST | `/api/batch/transfer` | Transfer quantity between batches (branch from context) |
| 6 | POST | `/api/batch/consolidation` | Consolidate sources into one destination (branch from context) |
| 7 | POST | `/api/batch/split` | Split source into multiple destinations (branch from context) |

Items with batches: **GET /api/items?include=batches**, **GET /api/items/:itemId/batches** — see **items.md**.
