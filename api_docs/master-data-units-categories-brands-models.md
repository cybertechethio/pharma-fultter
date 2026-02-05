# Master Data API: Units, Categories, Sub-Categories, Brands, Models

## Overview

This document describes the **master data** API endpoints for the pharma backend: **Units**, **Categories**, **Sub-Categories**, **Brands**, and **Models**. These are company-scoped lookup entities used by items and other features. All endpoints require **authentication** (active & verified user). Request/response use **camelCase** only.

**Common response envelope (success):**
- `success`: `boolean` (true)
- `message`: `string`
- `data`: payload (object or array)
- `pagination`: present only for list endpoints
- `metadata`: `{ requestId?, timestamp }` (optional)

**Common errors:** `400` (validation), `401` (unauthorized), `403` (forbidden), `404` (not found), `409` (conflict, e.g. duplicate name), `500` (server error).

**Request body:** Where applicable, send payload in `{ "data": payload }` or as raw body. Endpoints that use `parsePayload` accept the `data` wrapper.

---

# 1. Units

**Base path:** `/api/units`

| # | Method | Endpoint | Description |
|---|--------|----------|-------------|
| 1 | POST | `/api/units` | Create unit |
| 2 | PUT | `/api/units/:id` | Update unit |
| 3 | GET | `/api/units/:id` | Get unit by ID |
| 4 | GET | `/api/units` | List units (paginated, search) |
| 5 | DELETE | `/api/units/:id` | Delete one unit |
| 6 | DELETE | `/api/units/delete-many` | Delete many units (body: `ids[]`) |

**Route order:** `DELETE /delete-many` is registered before `DELETE /:id`.

---

## 1.1 Create Unit — POST /api/units

**Request:**
```json
{ "data": { "name": "Box", "description": "Box of 10" } }
```

| Field | Required | Type | Description |
|-------|----------|------|-------------|
| `name` | **M** | string | Min 1 char, trimmed; unique per company |
| `description` | O | string \| null | |

**Response (201):** `data` = `{ id, companyId, name, description, createdAt, updatedAt, createdBy, updatedBy }`. Types: id number, companyId number, name string, description string \| null, createdAt/updatedAt ISO string, createdBy/updatedBy number \| null.

**Errors:** `400` validation; `409` if name already exists (service may return 400 for duplicate name).

---

## 1.2 Update Unit — PUT /api/units/:id

**Request:** Same fields as create; all optional; at least one required.

**Response (200):** Updated unit (same shape as create response).

---

## 1.3 Get Unit — GET /api/units/:id

**Response (200):** Single unit object (same shape as create response).

---

## 1.4 List Units — GET /api/units

**Query:** `page`, `limit` (or `size`), `search` or `text` (search in name, description, case-insensitive).

**Response (200):** `data` = array of units; `pagination` = { currentPage, totalPages, totalItems, itemsPerPage, hasNextPage, hasPreviousPage, nextPage, prevPage }.

---

## 1.5 Delete Unit — DELETE /api/units/:id

**Response (200):** Success; `data` may be deleted entity or null.

---

## 1.6 Delete Many Units — DELETE /api/units/delete-many

**Request:** `{ "data": { "ids": [1, 2, 3] } }`. `ids` (M): number[], min length 1.

**Response (200):** Success; `data` = array of deleted units. If no matching IDs, service throws (e.g. 404).

---

# 2. Categories

**Base path:** `/api/categories`

| # | Method | Endpoint | Description |
|---|--------|----------|-------------|
| 1 | POST | `/api/categories` | Create category |
| 2 | PUT | `/api/categories/:id` | Update category |
| 3 | GET | `/api/categories/:id` | Get category by ID |
| 4 | GET | `/api/categories` | List categories (paginated, search, sort) |
| 5 | DELETE | `/api/categories/:id` | Delete category |

**Note:** Categories routes use `parsePayload`. Request body should use `{ "data": payload }`.

---

## 2.1 Create Category — POST /api/categories

**Request:**
```json
{ "data": { "name": "Medicines", "description": "Pharmaceuticals", "imageUrl": null } }
```

| Field | Required | Type | Description |
|-------|----------|------|-------------|
| `name` | **M** | string | Min 1 char, trimmed; unique per company |
| `description` | O | string \| null | |
| `imageUrl` | O | string \| null | Validator allows; schema may not persist it |

**Response (201):** `data` = `{ id, companyId, name, description, createdAt, updatedAt, createdBy, updatedBy }`. (Categories schema has no imageUrl; service create only sets name, description.)

**Errors:** `409` if category name already exists.

---

## 2.2 Update Category — PUT /api/categories/:id

**Request:** Same as create; all optional; min 1 field. Validator allows `imageUrl`; service only updates name, description (schema has no imageUrl).

**Response (200):** Updated category (same shape).

---

## 2.3 Get Category — GET /api/categories/:id

**Response (200):** Single category object.

---

## 2.4 List Categories — GET /api/categories

**Query:** `page`, `limit` (or `size`), `search` or `text` (name, description), `sortBy` (id, name, description, createdAt, updatedAt), `sortOrder` (asc, desc). Default sort: createdAt desc.

**Response (200):** `data` = array of categories; `pagination` (same shape as units).

---

## 2.5 Delete Category — DELETE /api/categories/:id

**Response (200):** Success; `data` may be deleted entity or null.

---

# 3. Sub-Categories

**Base path:** `/api/sub-categories`

| # | Method | Endpoint | Description |
|---|--------|----------|-------------|
| 1 | POST | `/api/sub-categories` | Create sub-category |
| 2 | PUT | `/api/sub-categories/:id` | Update sub-category |
| 3 | GET | `/api/sub-categories/:id` | Get sub-category by ID |
| 4 | GET | `/api/sub-categories` | List sub-categories (paginated, filter by categoryId, search) |
| 5 | DELETE | `/api/sub-categories/:id` | Delete one sub-category |
| 6 | DELETE | `/api/sub-categories/delete-many` | Delete many sub-categories (body: `ids[]`) |

**Route order:** `DELETE /delete-many` before `DELETE /:id`.

---

## 3.1 Create Sub-Category — POST /api/sub-categories

**Request:**
```json
{ "data": { "categoryId": 1, "name": "Tablets", "description": null, "imageUrl": null } }
```

| Field | Required | Type | Description |
|-------|----------|------|-------------|
| `categoryId` | **M** | number | Parent category ID; must exist for company |
| `name` | **M** | string | Min 1 char, trimmed; unique per parent category |
| `description` | O | string \| null | |
| `imageUrl` | O | string \| null | |

**Response (201):** `data` = `{ id, companyId, categoryId, name, description, imageUrl, createdAt, updatedAt, createdBy, updatedBy }`.

**Errors:** `400` if parent category not found; `400` if sub-category name already exists for that category.

---

## 3.2 Update Sub-Category — PUT /api/sub-categories/:id

**Request:** Same fields; all optional; min 1. If `categoryId` provided, parent must exist. Uniqueness: name unique per (categoryId).

**Response (200):** Updated sub-category (same shape).

---

## 3.3 Get Sub-Category — GET /api/sub-categories/:id

**Response (200):** Single sub-category object.

---

## 3.4 List Sub-Categories — GET /api/sub-categories

**Query:** `page`, `limit` (or `size`), `categoryId` (filter by parent), `search` or `text` (name, description).

**Response (200):** `data` = array of sub-categories; `pagination` (same shape).

---

## 3.5 Delete Sub-Category — DELETE /api/sub-categories/:id

**Response (200):** Success; `data` may be deleted entity or null.

---

## 3.6 Delete Many Sub-Categories — DELETE /api/sub-categories/delete-many

**Request:** `{ "data": { "ids": [1, 2, 3] } }`. `ids` (M): number[], min 1.

**Response (200):** Success; `data` = array of deleted sub-categories. If no matching IDs, service throws (e.g. 404).

---

# 4. Brands

**Base path:** `/api/brands`

| # | Method | Endpoint | Description |
|---|--------|----------|-------------|
| 1 | POST | `/api/brands` | Create brand |
| 2 | PUT | `/api/brands/:id` | Update brand |
| 3 | GET | `/api/brands/:id` | Get brand by ID |
| 4 | GET | `/api/brands` | List brands (paginated, search) |
| 5 | DELETE | `/api/brands/:id` | Delete brand |

**Note:** Brands routes use `parsePayload` (and router.use(parsePayload)). Request body: `{ "data": payload }`.

---

## 4.1 Create Brand — POST /api/brands

**Request:**
```json
{ "data": { "name": "Acme Pharma", "description": null, "imageUrl": null } }
```

| Field | Required | Type | Description |
|-------|----------|------|-------------|
| `name` | **M** | string | Min 1 char, trimmed; unique per company |
| `description` | O | string \| null | |
| `imageUrl` | O | string \| null | |

**Response (201):** `data` = `{ id, companyId, name, description, imageUrl, createdAt, updatedAt, createdBy, updatedBy }`.

**Errors:** `409` if brand name already exists.

---

## 4.2 Update Brand — PUT /api/brands/:id

**Request:** Same as create; all optional; min 1. Name cannot be empty if provided.

**Response (200):** Updated brand (same shape).

---

## 4.3 Get Brand — GET /api/brands/:id

**Response (200):** Single brand object.

---

## 4.4 List Brands — GET /api/brands

**Query:** `page`, `limit` (or `size`), `search` or `text` (name, description).

**Response (200):** `data` = array of brands; `pagination` (same shape).

---

## 4.5 Delete Brand — DELETE /api/brands/:id

**Response (200):** Success; `data` may be deleted entity or null.

---

# 5. Models

**Base path:** `/api/models`

| # | Method | Endpoint | Description |
|---|--------|----------|-------------|
| 1 | POST | `/api/models` | Create model |
| 2 | PUT | `/api/models/:id` | Update model |
| 3 | GET | `/api/models/:id` | Get model by ID |
| 4 | GET | `/api/models` | List models (paginated, search, sort) |
| 5 | DELETE | `/api/models/:id` | Delete model |

**Note:** Models routes use `parsePayload` for create/update. Request body: `{ "data": payload }`.

---

## 5.1 Create Model — POST /api/models

**Request:**
```json
{ "data": { "name": "Standard", "description": null } }
```

| Field | Required | Type | Description |
|-------|----------|------|-------------|
| `name` | **M** | string | Min 1 char, trimmed; unique per company |
| `description` | O | string \| null | |

**Response (201):** `data` = `{ id, companyId, name, description, createdAt, updatedAt, createdBy, updatedBy }`.

**Errors:** `409` if model name already exists.

---

## 5.2 Update Model — PUT /api/models/:id

**Request:** Same as create; all optional; min 1.

**Response (200):** Updated model (same shape).

---

## 5.3 Get Model — GET /api/models/:id

**Response (200):** Single model object.

---

## 5.4 List Models — GET /api/models

**Query:** `page`, `limit` (or `size`), `search` or `text` (name, description), `sortBy` (id, name, description, createdAt, updatedAt), `sortOrder` (asc, desc). Default sort: createdAt desc.

**Response (200):** `data` = array of models; `pagination` (same shape).

---

## 5.5 Delete Model — DELETE /api/models/:id

**Response (200):** Success; `data` may be deleted entity or null.

---

# Summary Table

| Resource | Base path | Create | Update | Get One | List | Delete One | Delete Many |
|----------|-----------|--------|--------|---------|------|------------|-------------|
| Units | `/api/units` | POST | PUT /:id | GET /:id | GET | DELETE /:id | DELETE /delete-many |
| Categories | `/api/categories` | POST | PUT /:id | GET /:id | GET | DELETE /:id | — |
| Sub-Categories | `/api/sub-categories` | POST | PUT /:id | GET /:id | GET | DELETE /:id | DELETE /delete-many |
| Brands | `/api/brands` | POST | PUT /:id | GET /:id | GET | DELETE /:id | — |
| Models | `/api/models` | POST | PUT /:id | GET /:id | GET | DELETE /:id | — |

---

# Response Data Types (common)

- **id**: number  
- **companyId**: number  
- **name**: string  
- **description**: string \| null  
- **imageUrl**: string \| null (Categories/SubCategories/Brands only where schema has it)  
- **categoryId**: number (SubCategories only)  
- **createdAt**, **updatedAt**: string (ISO datetime)  
- **createdBy**, **updatedBy**: number \| null  

**Pagination:** `currentPage`, `totalPages`, `totalItems`, `itemsPerPage`, `hasNextPage`, `hasPreviousPage`, `nextPage`, `prevPage` (numbers or null for next/prev).

---

# Notes for Mobile / Frontend

1. **Delete-many:** Only **Units** and **Sub-Categories** have `DELETE /delete-many`; request body `{ "data": { "ids": number[] } }`. Route is defined before `/:id`.
2. **Uniqueness:**  
   - Units: name unique per company.  
   - Categories: name unique per company.  
   - Sub-Categories: name unique per **parent category** (categoryId).  
   - Brands: name unique per company.  
   - Models: name unique per company.
3. **Sub-Categories:** Require valid `categoryId` (parent category) on create; can change parent on update.
4. **Categories:** Validator allows `imageUrl`; backend Categories schema has no imageUrl — only name and description are persisted in create/update.
5. **Request body:** Prefer `{ "data": payload }` for create/update where `parsePayload` is used (categories, brands, models). Units and sub-categories use extractPayload which also accepts body.data or body.
