# Transfers API — Request / Response

**Base path:** `/api/transfers`. Auth required (active & verified user). Branch from context. camelCase only.

**Errors:** `400` validation, `401`/`403` auth, `404` not found, `500` server.

**Success envelope:** `success: boolean`, `message?: string`, `data: object | array`, `pagination?: object` (list only), `metadata?: object`.

---

## Data types & enums

### Enums

| Enum | Values | Usage |
|------|--------|--------|
| **TransferStatus** | `pending`, `rejected`, `returned`, `completed` | Request (update status), response `status` |
| **TransferType** | `transfer` | Request body `transferType` (create) |

### Transfer summary (response: create, list, update status)

Used in create, accept, reject, and list. Does **not** include `transferItems`.

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| id | number | M | |
| companyId | number | M | |
| transferType | string | M | Enum: `transfer` |
| transferNumber | string | M | Backend-generated |
| sourceBranchId | number | M | |
| destinationBranchId | number | M | |
| relatedTransferId | number \| null | M | |
| status | string | M | TransferStatus |
| notes | string \| null | M | |
| attachments | array | M | |
| createdAt | string | M | ISO date |
| updatedAt | string | M | ISO date |
| createdBy | number \| null | M | |
| updatedBy | number \| null | M | |
| sourceBranchName | string | M | |
| destinationBranchName | string | M | |
| creatorName | string \| null | M | Display name of creator |
| updaterName | string \| null | M | Display name of updater |
| relatedTransfer | object \| null | M | |
| relatedTransfers | array \| null | M | |

### Transfer detail (response: GET one only)

Same fields as Transfer summary, **plus**:

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| transferItems | array | M | See TransferItem |

### TransferItem object

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| id | number | M | |
| transferId | number | M | |
| itemId | number | M | |
| itemName | string \| null | M | |
| itemCode | string \| null | M | |
| quantity | number | M | |
| createdAt | string | M | ISO date |
| updatedAt | string | M | ISO date |
| createdBy | number \| null | M | |
| updatedBy | number \| null | M | |
| transferItemBatches | array | M | See TransferItemBatch |

### TransferItemBatch object

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| id | number | M | |
| transferItemId | number | M | |
| batchNumber | string | M | |
| quantity | number | M | |
| costPrice | number \| null | M | |
| unitPrice | number \| null | M | |
| expirationDate | string \| null | M | ISO date |
| allocatedFrom | string \| null | M | |
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

# Transfers API (`/api/transfers`)

Source branch from context. Only endpoints that exist in backend are documented.

## 1. CREATE — POST `/api/transfers`

**Mandatory:** `transferType`, `destinationBranchId`, `items` (min 1). Each item: `itemId`, `batches` (min 1). Each batch: `batchNumber`, `quantity`. **Optional:** `notes`; per batch: `costPrice`, `unitPrice`, `expirationDate`, `allocatedFrom`.

**Request (body)**

```json
{
  "transferType": "transfer" (string (M) — must be "transfer"),
  "destinationBranchId": 3 (number (M)),
  "notes": "Optional notes" (string | null (O)),
  "items": [
    {
      "itemId": 1 (number (M)),
      "batches": [
        {
          "batchNumber": "BATCH-001" (string (M)),
          "quantity": 10 (number (M) — > 0; must not exceed available at source)
        }
      ]
    }
  ]
}
```

**Response 201** — `data`: transfer summary (no `transferItems`). Same shape for Accept and Reject (PUT status).

```json
{
  "success": true (boolean (M)),
  "message": "Transfer created successfully" (string (M)),
  "data": {
    "id": 456 (number (M)),
    "transferNumber": "TR24010001-1234" (string (M)),
    "sourceBranchId": 2 (number (M)),
    "destinationBranchId": 3 (number (M)),
    "status": "pending" (string (M) — TransferStatus),
    "notes": "Optional notes" (string | null (M)),
    "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "createdBy": 1 (number | null (M)),
    "updatedBy": null (number | null (M)),
    "sourceBranchName": "Source Branch" (string (M)),
    "destinationBranchName": "Destination Branch" (string (M)),
    "creatorName": null (string | null (M)),
    "updaterName": null (string | null (M))
  },
  "metadata": { ... }
}
```

400 if validation fails (e.g. insufficient quantity). 401/403 auth.

---

## 2. LIST — GET `/api/transfers`

**Query** (all optional)

| Param | Type | Required | Default | Notes |
|-------|------|----------|---------|--------|
| page | number | O | 1 | |
| limit | number | O | 10 | |
| transferType | string | O | — | Filter |
| status | string | O | — | TransferStatus |
| sourceBranchId | number | O | — | |
| destinationBranchId | number | O | — | |
| relatedTransferId | number | O | — | |

**Response 200** — `data`: array of transfer summary objects (same shape as create/accept/reject; no `transferItems` per element).

```json
{
  "success": true (boolean (M)),
  "message": "Transfers fetched successfully" (string (M)),
  "data": [
    {
     "id": 456 (number (M)),
    "transferNumber": "TR24010001-1234" (string (M)),
    "sourceBranchId": 2 (number (M)),
    "destinationBranchId": 3 (number (M)),
    "status": "pending" (string (M) — TransferStatus),
    "notes": "Optional notes" (string | null (M)),
    "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "createdBy": 1 (number | null (M)),
    "updatedBy": null (number | null (M)),
    "sourceBranchName": "Source Branch" (string (M)),
    "destinationBranchName": "Destination Branch" (string (M)),
    "creatorName": null (string | null (M)),
    "updaterName": null (string | null (M))
    }
  ],
  "pagination": {
    "currentPage": 1 (number (M)),
    "totalPages": 5 (number (M)),
    "totalItems": 50 (number (M)),
    "itemsPerPage": 10 (number (M)),
    "hasNextPage": true (boolean (M)),
    "hasPreviousPage": false (boolean (M)),
    "nextPage": 2 (number | null (M)),
    "prevPage": null (number | null (M))
  },
  "metadata": { ... }
}
```

---

## 3. GET ONE — GET `/api/transfers/:id`

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Response 200** — `data`: single Transfer with full `transferItems` and nested `transferItemBatches`.

```json
{
  "success": true (boolean (M)),
  "message": "Transfer fetched successfully" (string (M)),
  "data": {
    "id": 456 (number (M)),
    "transferNumber": "TR24010001-1234" (string (M)),
    "sourceBranchId": 2 (number (M)),
    "destinationBranchId": 3 (number (M)),
    "status": "pending" (string (M) — TransferStatus),
    "notes": "Optional notes" (string | null (M)),
    "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "createdBy": 1 (number | null (M)),
    "updatedBy": null (number | null (M)),
    "sourceBranchName": "Source Branch" (string (M)),
    "destinationBranchName": "Destination Branch" (string (M)),
    "creatorName": null (string | null (M)),
    "updaterName": null (string | null (M))
    "transferItems": [
      {
        "id": 1 (number (M)),
        "itemName": "Item A" (string | null (M)),
        "itemCode": "CODE-A" (string | null (M)),
        "quantity": 10 (number (M)),
       
        "transferItemBatches": [
          {
            "id": 1 (number (M)),
            "transferItemId": 1 (number (M)),
            "batchNumber": "BATCH-001" (string (M)),
            "quantity": 10 (number (M)),
            "costPrice": 80 (number | null (M)),
            "unitPrice": 100 (number | null (M)),
            "expirationDate": "2024-12-31T00:00:00.000Z" (string | null (M)),
        
          }
        ]
      }
    ]
  },
  "metadata": { ... }
}
```

404 if not found.

---

## 4. UPDATE STATUS — PUT `/api/transfers/:id/status`

Same endpoint is used for **Accept** (status `completed`) and **Reject** (status `rejected`). Only the destination branch (acceptor) should call it for pending transfers.

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Mandatory:** `status`.

**Request (body)**

```json
{
  "status": "pending | rejected | returned | completed" (string (M) — TransferStatus)
}
```

**Accept (destination branch accepts the transfer)**

**Request:** `PUT /api/transfers/:id/status` with body:

```json
{
  "status": "completed"
}
```

**Response 200** — Same `data` shape as Create (transfer summary, no `transferItems`).

```json
{
  "success": true (boolean (M)),
  "message": "Transfer status updated successfully" (string (M)),
  "data": {
    "id": 456 (number (M)),
    "companyId": 1 (number (M)),
    "transferType": "transfer" (string (M)),
    "transferNumber": "TR24010001-1234" (string (M)),
    "sourceBranchId": 2 (number (M)),
    "destinationBranchId": 3 (number (M)),
    "relatedTransferId": null (number | null (M)),
    "status": "completed" (string (M) — TransferStatus),
    "notes": "Optional notes" (string | null (M)),
    "attachments": [] (array (M)),
    "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "updatedAt": "2024-01-15T11:00:00.000Z" (string (M)),
    "createdBy": 1 (number | null (M)),
    "updatedBy": 1 (number | null (M)),
    "sourceBranchName": "Source Branch" (string (M)),
    "destinationBranchName": "Destination Branch" (string (M)),
    "creatorName": "John Doe" (string | null (M)),
    "updaterName": "Jane Doe" (string | null (M)),
    "relatedTransfer": null (object | null (M)),
    "relatedTransfers": null (array | null (M))
  },
  "metadata": { ... }
}
```

**Reject (destination branch rejects the transfer)**

**Request:** `PUT /api/transfers/:id/status` with body:

```json
{
  "status": "rejected"
}
```

**Response 200** — Same `data` shape as Create and Accept (transfer summary, no `transferItems`; `status`: `"rejected"`).

400 if invalid status. 404 if not found.

---

## Accept and Reject buttons (UI)

**Who can see Accept and Reject:** Only **acceptors** — i.e. users whose **current branch is the transfer’s destination branch**. The UI uses `canAcceptOrReject(transfer, currentBranchId)`: it is true only when `transfer.status === 'pending'` and `transfer.destinationBranchId === currentBranchId`. Users at the source branch or any other branch do not see Accept/Reject. There is no separate “acceptor” role; visibility is determined only by branch context (destination branch = acceptor). Accept calls **PUT /api/transfers/:id/status** with `status: "completed"`; Reject with `status: "rejected"`.

---

## Notes

- **Transfer number:** Backend-generated (e.g. `TR24010001-1234`).
- **Stock:** Transfers update source/destination branch stock on create; status change does not change stock again.

For **transaction** APIs (create, list, get one, reverse, items/batches), see **docs/transactions.md**.
