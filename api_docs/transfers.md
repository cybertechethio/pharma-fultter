# Transfers API Documentation

## Overview

This document describes the transfers API endpoints for managing stock transfers between branches. Transfers allow moving items from one branch to another, handling shortages and excesses, and managing transfer statuses.

---

## 1. CREATE TRANSFER

### POST /api/transfers

**Description:** Create a new transfer from source branch to destination branch

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:**
```json
{
  "transferType": "transfer",
  "destinationBranchId": 3,
  "notes": "Optional notes" | null,
  "items": [
    {
      "itemId": 1,
      "batches": [
        {
          "batchNumber": "BATCH-001",
          "quantity": 10,
          "costPrice": 80.00 | null,
          "unitPrice": 100.00 | null,
          "expirationDate": "2024-12-31T00:00:00Z" | null
        }
      ]
    }
  ]
}
```

**Field Descriptions:**

- `transferType` (M) - Must be `"transfer"` for regular transfers
- `destinationBranchId` (M) - ID of destination branch (must be different from source branch)
- `notes` (O) - Optional transfer notes
- `items` (M) - Array of transfer items (min: 1)
  - `itemId` (M) - Item ID
  - `batches` (M) - Array of batches for this item (min: 1)
    - `batchNumber` (M) - Batch number/identifier
    - `quantity` (M) - Quantity for this batch (must be > 0)
    - `costPrice` (O) - Cost price
    - `unitPrice` (O) - Unit price
    - `expirationDate` (O) - Expiration date in ISO format

**Important Notes:**

1. **Status**: Not sent from UI - backend automatically sets status to `"pending"`
2. **Source Branch**: Not sent from UI - backend gets from current branch context
3. **Allocated From**: Not sent from UI - backend automatically sets to `"system"`
4. **Destination Branch**: **Required** - must be different from source branch
5. **Quantity Validation**: Quantity validated against available batch quantity in source branch

**Validation Rules:**

- `destinationBranchId` is **required** and must be different from source branch
- At least one item with at least one batch is required
- Quantity must not exceed available batch quantity in source branch

**Response:**
```json
{
  "success": true,
  "message": "Transfer created successfully",
  "data": {
    "id": 456,
    "companyId": 1,
    "transferType": "transfer",
    "transferNumber": "TR24010001-1234",
    "sourceBranchId": 2,
    "destinationBranchId": 3,
    "relatedTransferId": null,
    "status": "pending",
    "notes": "Optional notes",
    "attachments": [],
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:30:00Z",
    "createdBy": 1,
    "updatedBy": null,
    "sourceBranchName": "Source Branch Name",
    "destinationBranchName": "Destination Branch Name",
    "createdByUser": null,
    "updatedByUser": null,
    "relatedTransfer": null,
    "relatedTransfers": null,
    "transferItems": [
      {
        "id": 1,
        "transferId": 456,
        "itemId": 1,
        "itemName": "Item Name",
        "itemCode": "ITEM-001",
        "quantity": 10,
        "createdAt": "2024-01-15T10:30:00Z",
        "updatedAt": "2024-01-15T10:30:00Z",
        "createdBy": null,
        "updatedBy": null,
        "transferItemBatches": [
          {
            "id": 1,
            "transferItemId": 1,
            "batchNumber": "BATCH-001",
            "quantity": 10,
            "costPrice": 80.00,
            "unitPrice": 100.00,
            "expirationDate": "2024-12-31T00:00:00Z",
            "allocatedFrom": "system",
            "createdAt": "2024-01-15T10:30:00Z",
            "updatedAt": "2024-01-15T10:30:00Z",
            "createdBy": null,
            "updatedBy": null
          }
        ]
      }
    ]
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error (e.g., missing destination branch, insufficient quantity)
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `500 Internal Server Error` - Server error

---

## 2. GET ALL TRANSFERS

### GET /api/transfers

**Description:** Get all transfers with optional filtering and pagination

**Authentication Required:** ✅ Yes (Active & Verified User)

**Query Parameters:**
- `page` (O) - Page number (default: 1)
- `limit` (O) - Items per page (default: 10)
- `transferType` (O) - Filter by transfer type: `"transfer"`, `"shortage"`, `"excess"`
- `status` (O) - Filter by status: `"pending"`, `"rejected"`, `"returned"`, `"completed"`
- `sourceBranchId` (O) - Filter by source branch ID
- `destinationBranchId` (O) - Filter by destination branch ID
- `relatedTransferId` (O) - Filter by related transfer ID

**Response:**
```json
{
  "success": true,
  "message": "Transfers fetched successfully",
  "data": [
    {
      "id": 456,
      "companyId": 1,
      "transferType": "transfer",
      "transferNumber": "TR24010001-1234",
      "sourceBranchId": 2,
      "destinationBranchId": 3,
      "relatedTransferId": null,
      "status": "pending",
      "notes": "Optional notes",
      "attachments": [],
      "createdAt": "2024-01-15T10:30:00Z",
      "updatedAt": "2024-01-15T10:30:00Z",
      "createdBy": 1,
      "updatedBy": null,
      "sourceBranchName": "Source Branch Name",
      "destinationBranchName": "Destination Branch Name",
      "createdByUser": null,
      "updatedByUser": null,
      "relatedTransfer": null,
      "relatedTransfers": null,
      "transferItems": []
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
  }
}
```

**Error Responses:**
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `500 Internal Server Error` - Server error

---

## 3. GET TRANSFER BY ID

### GET /api/transfers/:id

**Description:** Get a single transfer by ID

**Authentication Required:** ✅ Yes (Active & Verified User)

**Response:**
```json
{
  "success": true,
  "message": "Transfer fetched successfully",
  "data": {
    "id": 456,
    "companyId": 1,
    "transferType": "transfer",
    "transferNumber": "TR24010001-1234",
    "sourceBranchId": 2,
    "destinationBranchId": 3,
    "relatedTransferId": null,
    "status": "pending",
    "notes": "Optional notes",
    "attachments": [],
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:30:00Z",
    "createdBy": 1,
    "updatedBy": null,
    "sourceBranchName": "Source Branch Name",
    "destinationBranchName": "Destination Branch Name",
    "createdByUser": null,
    "updatedByUser": null,
    "relatedTransfer": null,
    "relatedTransfers": null,
    "transferItems": [
      {
        "id": 1,
        "transferId": 456,
        "itemId": 1,
        "itemName": "Item Name",
        "itemCode": "ITEM-001",
        "quantity": 10,
        "createdAt": "2024-01-15T10:30:00Z",
        "updatedAt": "2024-01-15T10:30:00Z",
        "createdBy": null,
        "updatedBy": null,
        "transferItemBatches": [
          {
            "id": 1,
            "transferItemId": 1,
            "batchNumber": "BATCH-001",
            "quantity": 10,
            "costPrice": 80.00,
            "unitPrice": 100.00,
            "expirationDate": "2024-12-31T00:00:00Z",
            "allocatedFrom": "system",
            "createdAt": "2024-01-15T10:30:00Z",
            "updatedAt": "2024-01-15T10:30:00Z",
            "createdBy": null,
            "updatedBy": null
          }
        ]
      }
    ]
  }
}
```

**Error Responses:**
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Transfer not found
- `500 Internal Server Error` - Server error

---

## 4. UPDATE TRANSFER STATUS

### PUT /api/transfers/:id/status

**Description:** Update the status of a transfer

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:**
```json
{
  "status": "pending" | "rejected" | "returned" | "completed"
}
```

**Field Descriptions:**

- `status` (M) - New status for the transfer
  - `"pending"` - Transfer is pending acceptance
  - `"rejected"` - Transfer was rejected
  - `"returned"` - Transfer was returned
  - `"completed"` - Transfer was completed

**Response:**
```json
{
  "success": true,
  "message": "Transfer status updated successfully",
  "data": {
    "id": 456,
    "companyId": 1,
    "transferType": "transfer",
    "transferNumber": "TR24010001-1234",
    "sourceBranchId": 2,
    "destinationBranchId": 3,
    "relatedTransferId": null,
    "status": "completed",
    "notes": "Optional notes",
    "attachments": [],
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:35:00Z",
    "createdBy": 1,
    "updatedBy": 1,
    "sourceBranchName": "Source Branch Name",
    "destinationBranchName": "Destination Branch Name",
    "createdByUser": null,
    "updatedByUser": null,
    "relatedTransfer": null,
    "relatedTransfers": null,
    "transferItems": []
  }
}
```

**Error Responses:**
- `400 Bad Request` - Invalid status value
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Transfer not found
- `500 Internal Server Error` - Server error

---

## 5. CREATE SHORTAGE TRANSFER

### POST /api/transfers/:transferId/shortage

**Description:** Create a shortage transfer for items that were missing during transfer acceptance

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:**
```json
{
  "items": [
    {
      "itemId": 1,
      "quantity": 5
    }
  ],
  "notes": "Optional notes" | null
}
```

**Field Descriptions:**

- `items` (M) - Array of items with shortages (min: 1)
  - `itemId` (M) - Item ID
  - `quantity` (M) - Shortage quantity (must be > 0)
- `notes` (O) - Optional notes

**Response:**
```json
{
  "success": true,
  "message": "Shortage transfer created successfully",
  "data": {
    "id": 457,
    "companyId": 1,
    "transferType": "shortage",
    "transferNumber": "TS24010001-1235",
    "sourceBranchId": 3,
    "destinationBranchId": 2,
    "relatedTransferId": 456,
    "status": "pending",
    "notes": "Optional notes",
    "attachments": [],
    "createdAt": "2024-01-15T10:40:00Z",
    "updatedAt": "2024-01-15T10:40:00Z",
    "createdBy": 1,
    "updatedBy": null,
    "sourceBranchName": "Destination Branch Name",
    "destinationBranchName": "Source Branch Name",
    "createdByUser": null,
    "updatedByUser": null,
    "relatedTransfer": {
      "id": 456,
      "transferType": "transfer",
      "transferNumber": "TR24010001-1234",
      "status": "completed",
      "sourceBranchId": 2,
      "sourceBranchName": "Source Branch Name",
      "destinationBranchId": 3,
      "destinationBranchName": "Destination Branch Name",
      "createdAt": "2024-01-15T10:30:00Z"
    },
    "relatedTransfers": null,
    "transferItems": []
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Original transfer not found
- `500 Internal Server Error` - Server error

---

## 6. CREATE EXCESS TRANSFER

### POST /api/transfers/:transferId/excess

**Description:** Create an excess transfer for items that were received in excess during transfer acceptance

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:**
```json
{
  "items": [
    {
      "itemId": 1,
      "quantity": 2
    }
  ],
  "notes": "Optional notes" | null
}
```

**Field Descriptions:**

- `items` (M) - Array of items with excess (min: 1)
  - `itemId` (M) - Item ID
  - `quantity` (M) - Excess quantity (must be > 0)
- `notes` (O) - Optional notes

**Response:**
```json
{
  "success": true,
  "message": "Excess transfer created successfully",
  "data": {
    "id": 458,
    "companyId": 1,
    "transferType": "excess",
    "transferNumber": "TE24010001-1236",
    "sourceBranchId": 3,
    "destinationBranchId": 2,
    "relatedTransferId": 456,
    "status": "pending",
    "notes": "Optional notes",
    "attachments": [],
    "createdAt": "2024-01-15T10:45:00Z",
    "updatedAt": "2024-01-15T10:45:00Z",
    "createdBy": 1,
    "updatedBy": null,
    "sourceBranchName": "Destination Branch Name",
    "destinationBranchName": "Source Branch Name",
    "createdByUser": null,
    "updatedByUser": null,
    "relatedTransfer": {
      "id": 456,
      "transferType": "transfer",
      "transferNumber": "TR24010001-1234",
      "status": "completed",
      "sourceBranchId": 2,
      "sourceBranchName": "Source Branch Name",
      "destinationBranchId": 3,
      "destinationBranchName": "Destination Branch Name",
      "createdAt": "2024-01-15T10:30:00Z"
    },
    "relatedTransfers": null,
    "transferItems": []
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Original transfer not found
- `500 Internal Server Error` - Server error

---

## 7. REVERSE SHORTAGE/EXCESS TRANSFER

### POST /api/transfers/:transferId/reverse

**Description:** Reverse a shortage or excess transfer

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:** No request body required

**Response:**
```json
{
  "success": true,
  "message": "Transfer reversed successfully",
  "data": {
    "id": 457,
    "companyId": 1,
    "transferType": "shortage",
    "transferNumber": "TS24010001-1235",
    "sourceBranchId": 3,
    "destinationBranchId": 2,
    "relatedTransferId": 456,
    "status": "completed",
    "notes": "Optional notes",
    "attachments": [],
    "createdAt": "2024-01-15T10:40:00Z",
    "updatedAt": "2024-01-15T10:50:00Z",
    "createdBy": 1,
    "updatedBy": 1,
    "sourceBranchName": "Destination Branch Name",
    "destinationBranchName": "Source Branch Name",
    "createdByUser": null,
    "updatedByUser": null,
    "relatedTransfer": null,
    "relatedTransfers": null,
    "transferItems": []
  }
}
```

**Error Responses:**
- `400 Bad Request` - Transfer cannot be reversed
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Transfer not found
- `500 Internal Server Error` - Server error

---

## Notes

1. **Transfer Number**: Automatically generated by backend in format: `{PREFIX}{YYMM}{SEQUENCE}-{RANDOM}`
   - Regular transfer: `TR24010001-1234`
   - Shortage: `TS24010001-1235`
   - Excess: `TE24010001-1236`

2. **Stock Impact**: 
   - Transfers update stock in both source and destination branches
   - Source branch stock decreases immediately on creation
   - Destination branch stock increases immediately on creation
   - Status changes do not affect stock (stock already updated on creation)

3. **Transfer Status Flow**:
   - Created transfers start with `"pending"` status
   - Can be updated to `"completed"`, `"rejected"`, or `"returned"`
   - Status updates do not affect stock movements (already processed on creation)

4. **Shortage/Excess Transfers**:
   - Created from destination branch when accepting a transfer
   - Shortage: Items missing (reverse direction transfer)
   - Excess: Items received in excess (reverse direction transfer)
   - Both link to original transfer via `relatedTransferId`

5. **Branch Context**: Source branch is automatically determined from user's current branch context
