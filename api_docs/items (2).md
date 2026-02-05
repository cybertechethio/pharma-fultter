# Items API — Request / Response

Base path: **`/api/items`**. All mutation bodies use **`{ "data": { ... } }`**. Auth required. camelCase only.

**Errors:** `400` validation, `401`/`403` auth, `404` not found, `500` server.

**Success envelope:** `success: boolean`, `message?: string`, `data: object | array`, `pagination?: object` (list only).

---

## Data types & structures

### Item object (response: get one, create, update, delete, list items)

Single shape for get/create/update/delete and for each element in list. Optional fields may be omitted or null depending on endpoint.

| Field | Type | Required in response | Notes |
|-------|------|----------------------|--------|
| id | number | M | |
| companyId | number | M | |
| name | string | M | |
| description | string \| null | M | |
| categoryId | number \| null | M | |
| subCategoryId | number \| null | M | |
| brandId | number \| null | M | |
| unitId | number \| null | M | |
| modelId | number \| null | M | (if supported) |
| sku | string \| null | M | |
| code | string \| null | M | |
| barcode | string \| null | M | |
| color | string \| null | M | (if supported) |
| size | string \| null | M | (if supported) |
| material | string \| null | M | (if supported) |
| weight | number \| null | M | (if supported) |
| imageUrl | string \| null | M | |
| isTaxable | boolean | M | |
| taxRate | number | M | 0–100 |
| isActive | boolean | M | |
| createdAt | string | M | ISO date |
| updatedAt | string | M | ISO date |
| createdBy | number \| null | M | |
| updatedBy | number \| null | M | |
| categories | string \| null | O | List: expanded name |
| subCategories | string \| null | O | List: expanded name |
| brands | string \| null | O | List: expanded name |
| units | string \| null | O | List: expanded name |
| batches | Batch[] | O | When `include=batches` or get one |
| batchCount | number | O | List only |
| batchSummary | object | O | When `include=batches`: `{ batchCount, totalValue }` |

### Batch object (response: list batches, or inside item.batches)

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| id | number | M | |
| batchNumber | string | M | |
| quantity | number | M | |
| unitPrice | number | M | |
| costPrice | number | M | |
| expirationDate | string \| null | M | ISO date |
| manufacturingDate | string \| null | M | ISO date |

### Pagination object (list response only)

| Field | Type | Required |
|-------|------|----------|
| currentPage | number | M |
| totalPages | number | M |
| totalItems | number | M |
| itemsPerPage | number | M |
| hasNextPage | boolean | M |
| hasPreviousPage | boolean | M |

---

## 1. CREATE — POST `/api/items`

**Mandatory:** `name`, `code`, `sku`, `costPrice`, `unitPrice`. All other fields optional.

**Request (body)**

```json
{
  "data": {
    "name": "Paracetamol 500mg" (string (M)),
    "code": "ITEM-001" (string (M)),
    "sku": "SKU-001" (string (O)),
    "costPrice": 50 (number (M)),
    "unitPrice": 80 (number (M)),
    "description": "Pain relief tablets" (string | null (O)),
    "categoryId": 1 (number | null (O)),
    "subCategoryId": null (number | null (O)),
    "brandId": 1 (number | null (O)),
    "unitId": 1 (number | null (O)),
    "barcode": "1234567890123" (string | null (O)),
    "isTaxable": true (boolean (O)),
    "taxRate": 8 (number (O)),
    "isActive": true (boolean (O)),
    "imageUrl": null (string | null (O)),
    "expirationDate": "2025-12-31T00:00:00.000Z" (string | null (O)),
    "manufacturingDate": "2024-01-01T00:00:00.000Z" (string | null (O))
  }
}
```

**Response 201**

```json
{
  "success": true (boolean (M)),
  "message": "Item created successfully" (string (M)),
  "data": {
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
    "units": "Unit" (string | null (O))
  },
  "metadata": {
    "requestId": "..." (string (M)),
    "timestamp": "2024-01-15T10:30:00.000Z" (string (M))
  }
}
```

---

## 2. UPDATE — PUT `/api/items/:id`

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Request (body):** All fields optional; at least one required. When `costPrice`, `unitPrice`, `expirationDate`, or `manufacturingDate` are sent, they update the **last batch** of that item (by creation date); prices also update related branch-stock batch records.

```json
{
  "data": {
    "name": "Paracetamol 500mg Updated" (string (O)),
    "description": "" (string | null (O)),
    "categoryId": 1 (number | null (O)),
    "subCategoryId": null (number | null (O)),
    "brandId": 1 (number | null (O)),
    "unitId": 1 (number | null (O)),
    "sku": "SKU-001" (string | null (O)),
    "code": "ITEM-001" (string | null (O)),
    "barcode": "1234567890123" (string | null (O)),
    "isTaxable": true (boolean (O)),
    "taxRate": 8 (number (O)),
    "isActive": true (boolean (O)),
    "costPrice": 52 (number | null (O)),
    "unitPrice": 85 (number | null (O)),
    "expirationDate": "2025-12-31T00:00:00.000Z" (string | null (O)),
    "manufacturingDate": "2024-01-01T00:00:00.000Z" (string | null (O))
  }
}
```

**Response 200** — Same as [Create response](#1-create--post-apiitems) (envelope and `data` shape).

404 if not found.

---

## 3. GET ONE — GET `/api/items/:id`

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Headers (optional):** `x-branch-id: number` (branch context).

**Response 200** — Same as [Create response](#1-create--post-apiitems) (envelope and `data` shape).

404 if not found.

---

## 4. LIST — GET `/api/items`

**Query** (all optional)

| Param | Type | Required | Notes |
|-------|------|----------|--------|
| page | number | O | |
| limit | number | O | |
| search | string | O | or `text` |
| categoryId | number | O | |
| brandId | number | O | |
| include | string | O | e.g. `batches` for full batch list |

**Headers (optional):** `x-branch-id: number`.

**Response 200**

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
      "units": "Unit" (string | null (O))
    }
  ],
  "pagination": {
    "currentPage": 1 (number (M)),
    "totalPages": 1 (number (M)),
    "totalItems": 1 (number (M)),
    "itemsPerPage": 25 (number (M)),
    "hasNextPage": false (boolean (M)),
    "hasPreviousPage": false (boolean (M))
  },
  "metadata": {
    "requestId": "..." (string (M)),
    "timestamp": "2024-01-15T10:30:00.000Z" (string (M))
  }
}
```

With `include=batches`: each item in `data` also has `batches` and `batchSummary: { batchCount, totalValue }`.

---

## 5. GET BATCHES FOR ITEM — GET `/api/items/:itemId/batches`

**Path**

| Param | Type | Required |
|-------|------|----------|
| itemId | number | M |

**Headers (optional):** `x-branch-id: number`.

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "Item batches fetched successfully" (string (M)),
  "data": [
    {
      "id": 1 (number (M)),
      "batchNumber": "BATCH-001" (string (M)),
      "quantity": 10 (number (M)),
      "unitPrice": 80 (number (M)),
      "costPrice": 50 (number (M)),
      "expirationDate": "2025-12-31" (string | null (M)),
      "manufacturingDate": "2024-01-01" (string | null (M))
    }
  ],
  "metadata": {
    "requestId": "..." (string (M)),
    "timestamp": "2024-01-15T10:30:00.000Z" (string (M))
  }
}
```

400 if itemId invalid; 404 if item not found.

---

## 6. DELETE ONE — DELETE `/api/items/:id`

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Response 200** — Same as [Create response](#1-create--post-apiitems) (envelope and `data` shape).

404 if not found.

---

## Summary

| Method | Endpoint | Request | Response |
|--------|----------|---------|----------|
| POST | `/api/items` | Body: name, code, sku, costPrice, unitPrice (M); rest O | 201: `data: Item` |
| PUT | `/api/items/:id` | Path: id. Body: any subset; costPrice, unitPrice, expirationDate, manufacturingDate update **last batch** | 200: `data: Item` |
| GET | `/api/items/:id` | Path: id | 200: `data: Item` |
| GET | `/api/items` | Query: page, limit, search, categoryId, brandId, include | 200: `data: Item[]`, `pagination` |
| GET | `/api/items/:itemId/batches` | Path: itemId | 200: `data: Batch[]` |
| DELETE | `/api/items/:id` | Path: id | 200: `data: Item` |
