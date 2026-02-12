# Transactions API — Request / Response

**Base path:** `/api/transactions`. Auth required (active & verified user). Branch from context. camelCase only.

**Errors:** `400` validation, `401`/`403` auth, `404` not found, `500` server.

**Success envelope:** `success: boolean`, `message?: string`, `data: object | array`, `pagination?: object` (list only), `metadata?: object`.

---

## Data types & enums

### Enums

| Enum | Values | Usage |
|------|--------|--------|
| **TransactionType** | `purchase`, `imported`, `sale`, `adjustment`, `waste`, `damage`, `transactionType` |
| **TransactionStatus** | `completed`, `reversed` | Response `status` |
| **PaymentType** | `payment`, `refund`, `balanceAdjustment` | Response `payment.paymentType` |
| **PaymentMethodType** | `cash`, `telebirr`, `mPesa`, `bankTransfer`, `check`, `other` | Response `paymentMethods[].method` |

### Transaction summary (response: create, list, reverse)

Used in create, list, and reverse. Does **not** include `items` or `payment`.

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| id | number | M | |
| companyId | number | M | |
| branchId | number | M | |
| transactionType | string | M | TransactionType |
| transactionNumber | string | M | Backend-generated |
| status | string | M | TransactionStatus |
| supplierId | number \| null | M | |
| customerId | number \| null | M | |
| subtotal | number | M | |
| totalTax | number | M | |
| totalAmount | number | M | |
| notes | string \| null | M | |
| attachments | array | M | |
| relatedId | number \| null | M | |
| createdAt | string | M | ISO date |
| updatedAt | string | M | ISO date |
| createdBy | number \| null | M | |
| updatedBy | number \| null | M | |
| creatorName | string \| null | M | Display name of creator |
| updaterName | string \| null | M | Display name of updater |
| supplierName | string \| null | M | |
| customerName | string \| null | M | |
| salesOrderNumber | string \| null | M | |

### Transaction detail (response: GET one only)

Same fields as Transaction summary, **plus**:

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| items | array | M | See TransactionItem |
| payment | object \| null | M | See Payment; null if none |

### TransactionItem object

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| id | number | M | |
| transactionId | number | M | |
| itemId | number | M | |
| itemName | string \| null | M | |
| itemCode | string \| null | M | |
| quantity | number | M | |
| taxRate | number | M | From Item (backend) |
| total | number | M | |
| createdAt | string | M | ISO date |
| updatedAt | string | M | ISO date |
| createdBy | number \| null | M | |
| updatedBy | number \| null | M | |
| batches | array | M | See TransactionItemBatch |

### TransactionItemBatch object

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| id | number | M | |
| transactionItemId | number | M | |
| batchNumber | string | M | |
| quantity | number | M | |
| costPrice | number \| null | M | |
| unitPrice | number \| null | M | |
| taxableAmount | number | M | |
| taxAmount | number | M | |
| total | number | M | |
| expirationDate | string \| null | M | ISO date; from backend (Batch) |
| allocatedFrom | string \| null | M | |
| createdAt | string | M | ISO date |
| updatedAt | string | M | ISO date |
| createdBy | number \| null | M | |
| updatedBy | number \| null | M | |

### Payment object (GET one only, when present)

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| id | number | M | |
| companyId | number | M | |
| branchId | number | M | |
| transactionId | number \| null | M | |
| customerId | number \| null | M | |
| supplierId | number \| null | M | |
| totalAmount | number | M | |
| paidAmount | number | M | |
| paymentType | string \| null | M | PaymentType |
| originalPaymentId | number \| null | M | |
| notes | string \| null | M | |
| createdAt | string | M | ISO date |
| updatedAt | string | M | ISO date |
| createdBy | number \| null | M | |
| updatedBy | number \| null | M | |
| receivedBy | number \| null | M | |
| paymentMethods | array | M | See PaymentMethod |

### PaymentMethod object

| Field | Type | Required | Notes |
|-------|------|----------|--------|
| id | number | M | |
| paymentId | number | M | |
| method | string | M | PaymentMethodType |
| amount | number | M | |
| attachment | string \| null | M | |
| referenceNumber | string \| null | M | |
| bankId | number \| null | M | |
| bankName | string \| null | M | From Banks |
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

# Transactions API (`/api/transactions`)

Source branch from context. Only endpoints that exist in backend are documented.

## 1. CREATE — POST `/api/transactions`

**Mandatory:** `transactionType`, `items` (min 1). Each item: `itemId`, `batches` (min 1). Each batch: `batchNumber`, `quantity`. For `purchase`/`imported`: batch `costPrice` ≥ 0. For other types: batch `unitPrice` ≥ 0. **Optional:** `supplierId`, `customerId`, `notes`, `transactionDate`, `attachments`, `payment`, `paymentMethods` (only for purchase \| imported \| sale). **Backend-derived:** `taxRate` from Item; `expirationDate` from Batch (by batchNumber).

**Request (body)**

```json
{
  "transactionType": "purchase" (string (M) — TransactionType),
  "supplierId": 1 (number | null (O)),
  "customerId": null (number | null (O)),
  "notes": null (string | null (O)),
  "transactionDate": null (string | null (O) — ISO date),
  "attachments": [] (array (O)),
  "items": [
    {
      "itemId": 1 (number (M)),
      "batches": [
        {
          "batchNumber": "BATCH-001" (string (M)),
          "quantity": 10 (number (M) — > 0),
          "costPrice": 80 (number | null (O) — required for purchase/imported),
          "unitPrice": 100 (number | null (O) — required for sale/adjustment/waste/damage)
        }
      ]
    }
  ],
  "payment": null (object | null (O) — only for purchase | imported | sale),
  "paymentMethods": null (array | null (O) — only for purchase | imported | sale)
}
```

**Response 201** — `data`: transaction summary (same shape as list; no `items`, no `payment`).

```json
{
  "success": true (boolean (M)),
  "message": "Transaction created successfully" (string (M)),
  "data": {
    "id": 100 (number (M)),
    "companyId": 1 (number (M)),
    "branchId": 2 (number (M)),
    "transactionType": "purchase" (string (M) — TransactionType),
    "transactionNumber": "TXN-2024-001" (string (M)),
    "status": "completed" (string (M) — TransactionStatus),
    "supplierId": 1 (number | null (M)),
    "customerId": null (number | null (M)),
    "subtotal": 800 (number (M)),
    "totalTax": 0 (number (M)),
    "totalAmount": 800 (number (M)),
    "notes": null (string | null (M)),
    "attachments": [] (array (M)),
    "relatedId": null (number | null (M)),
    "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "createdBy": 1 (number | null (M)),
    "updatedBy": null (number | null (M)),
    "creatorName": "John Doe" (string | null (M)),
    "updaterName": null (string | null (M)),
    "supplierName": "Supplier A" (string | null (M)),
    "customerName": null (string | null (M)),
    "salesOrderNumber": null (string | null (M))
  },
  "metadata": { ... }
}
```

400 if validation fails. 401/403 auth.

---

## 2. LIST — GET `/api/transactions`

**Query** (all optional)

| Param | Type | Required | Default | Notes |
|-------|------|----------|---------|--------|
| page | number | O | 1 | |
| limit | number | O | 10 | |
| branchId | number | O | — | From context if not set |
| status | string | O | — | TransactionStatus |
| transactionType | string | O | — | TransactionType |
| supplierId | number | O | — | |
| customerId | number | O | — | |
| transactionNumber | string | O | — | |
| minTotalAmount | number | O | — | |
| maxTotalAmount | number | O | — | |
| minSubtotal | number | O | — | |
| maxSubtotal | number | O | — | |
| search | string | O | — | transactionNumber, notes |
| relatedId | number | O | — | |
| fromDate | string | O | — | ISO date |
| toDate | string | O | — | ISO date |

**Response 200** — `data`: array of transaction summary objects (same shape as create/reverse; no `items`, no `payment` per element).

```json
{
  "success": true (boolean (M)),
  "message": "Transactions fetched successfully" (string (M)),
  "data": [
    {
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

## 3. GET ONE — GET `/api/transactions/:id`

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Response 200** — `data`: transaction detail with full `items` (each with `batches`) and `payment` (with `paymentMethods`). `payment`: null if no payment.

```json
{
  "success": true (boolean (M)),
  "message": "Transaction fetched successfully" (string (M)),
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
    "salesOrderNumber": null (string | null (M)),
    "items": [
      {
        "id": 1 (number (M)),
        "transactionId": 100 (number (M)),
        "itemId": 5 (number (M)),
        "itemName": "Item Name" (string | null (M)),
        "itemCode": "ITEM-001" (string | null (M)),
        "quantity": 10 (number (M)),
        "taxRate": 0 (number (M)),
        "total": 1000 (number (M)),
        "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
        "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
        "createdBy": 1 (number | null (M)),
        "updatedBy": null (number | null (M)),
        "batches": [
          {
            "id": 1 (number (M)),
            "transactionItemId": 1 (number (M)),
            "batchNumber": "BATCH-001" (string (M)),
            "quantity": 10 (number (M)),
            "costPrice": 80 (number | null (M)),
            "unitPrice": 100 (number | null (M)),
            "taxableAmount": 100 (number (M)),
            "taxAmount": 0 (number (M)),
            "total": 1000 (number (M)),
            "expirationDate": "2024-12-31T00:00:00.000Z" (string | null (M)),
            "allocatedFrom": "system" (string | null (M)),
            "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
            "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
            "createdBy": 1 (number | null (M)),
            "updatedBy": null (number | null (M))
          }
        ]
      }
    ],
    "payment": {
      "id": 1 (number (M)),
      "companyId": 1 (number (M)),
      "branchId": 2 (number (M)), 
      "transactionId": 100 (number | null (M)),
      "customerId": 5 (number | null (M)),
      "supplierId": null (number | null (M)),
      "totalAmount": 1000 (number (M)),
      "paidAmount": 1000 (number (M)),
      "paymentType": "payment" (string | null (M) — PaymentType),
      "originalPaymentId": null (number | null (M)),
      "notes": null (string | null (M)),
      "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
      "createdBy": 1 (number | null (M)),
      "updatedBy": null (number | null (M)),
      "receivedBy": null (number | null (M)),
      "paymentMethods": [
        {
          "id": 1 (number (M)),
          "paymentId": 1 (number (M)),
          "method": "cash" (string (M) — PaymentMethodType: cash | telebirr | mPesa | bankTransfer | check | other),
          "amount": 1000 (number (M)),
          "attachment": null (string | null (M)),
          "referenceNumber": null (string | null (M)),
          "bankId": null (number | null (M)),
          "bankName": null (string | null (M)),
          "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
          "updatedAt": "2024-01-15T10:30:00.000Z" (string (M)),
          "createdBy": 1 (number | null (M)),
          "updatedBy": null (number | null (M))
        }
      ]
    }
  },
  "metadata": { ... }
}
```

404 if not found.

---

## 4. REVERSE — POST `/api/transactions/:transactionId/reverse`

Only for **purchase**, **imported**, **sale**. Transaction must be `completed` and not already reversed.

**Path**

| Param | Type | Required |
|-------|------|----------|
| transactionId | number | M |

**Request (body)**

```json
{
  "notes": "Reversal reason" (string | null (O))
}
```

Or with envelope: `{ "data": { "notes": "Reversal reason" } }`.

**Response 200** — Same `data` shape as Create (transaction summary; no `items`, no `payment`). `status`: `"reversed"`.

```json
{
  "success": true (boolean (M)),
  "message": "Transaction reversed successfully" (string (M)),
  "data": {
    "id": 100 (number (M)),
    "companyId": 1 (number (M)),
    "branchId": 2 (number (M)),
    "transactionType": "sale" (string (M) — TransactionType),
    "transactionNumber": "TXN-2024-002" (string (M)),
    "status": "reversed" (string (M) — TransactionStatus),
    "supplierId": null (number | null (M)),
    "customerId": 5 (number | null (M)),
    "subtotal": 900 (number (M)),
    "totalTax": 100 (number (M)),
    "totalAmount": 1000 (number (M)),
    "notes": "Reversal reason" (string | null (M)),
    "attachments": [] (array (M)),
    "relatedId": null (number | null (M)),
    "createdAt": "2024-01-15T10:30:00.000Z" (string (M)),
    "updatedAt": "2024-01-15T11:00:00.000Z" (string (M)),
    "createdBy": 1 (number | null (M)),
    "updatedBy": 1 (number | null (M)),
    "creatorName": "John Doe" (string | null (M)),
    "updaterName": "Jane Doe" (string | null (M)),
    "supplierName": null (string | null (M)),
    "customerName": "Customer X" (string | null (M)),
    "salesOrderNumber": null (string | null (M))
  },
  "metadata": { ... }
}
```

400 if invalid status or already reversed. 404 if not found.

---

## 5. Payment methods — add / update / remove

These endpoints live under **`/api/payments`**. They apply to any payment (e.g. from GET `/api/transactions/:id` → `data.payment`), including:

- **Payment** (`paymentType`: `payment`) — original transaction payment.
- **Refund** (`paymentType`: `refund`) — refund payment linked to a reversed transaction.

For **reversed transactions**, add/update/remove of payment methods is allowed; customer/supplier balance is **not** updated when the related transaction is `reversed`.

### 5.1 ADD payment methods — POST `/api/payments/:paymentId/methods`

**Request (body)** — array of payment method objects (non-empty).

```json
{
  "data": [
    {
      "method": "cash" (string (M) — PaymentMethodType),
      "amount": 500 (number (M)),
      "attachment": null (string | null (O)),
      "referenceNumber": null (string | null (O)),
      "bankId": null (number | null (O))
    }
  ]
}
```

**Response 201** — `data`: array of created PaymentMethod objects (same shape as in Payment object above).

400 if validation fails or array empty. 404 if payment not found.

### 5.2 UPDATE payment method — PUT `/api/payments/:paymentId/methods/:id`

**Request (body)** — at least one field.

```json
{
  "data": {
    "method": "telebirr" (string (O) — PaymentMethodType),
    "amount": 600 (number (O)),
    "attachment": null (string | null (O)),
    "referenceNumber": "REF-001" (string | null (O)),
    "bankId": null (number | null (O))
  }
}
```

**Response 200** — `data`: updated PaymentMethod object.

400 if validation fails. 404 if payment or payment method not found.

### 5.3 REMOVE payment method — DELETE `/api/payments/:paymentId/methods/:id`

No request body.

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "Payment method deleted successfully" (string (M)),
  "data": null (null (M))
}
```

404 if payment or payment method not found.

---

## Notes

- **Transaction number:** Backend-generated (e.g. `TXN-2024-001`).
- **Tax rate:** Taken from Item (backend); do not send in create request.
- **Expiration date:** Resolved from Batch by `batchNumber` (backend); do not send in create request.
- **Payment:** Allowed only for `purchase`, `imported`, `sale`. Other types reject `payment`/`paymentMethods`.
- **Payment methods (add/update/remove):** Apply to both **payment** and **refund**; for **reversed** transactions, payment method changes do not update customer/supplier balance.

For **transfers**, see **docs/transfers.md**.
