# Batch Operations API Documentation

## Overview

This document describes the batch operations API endpoints for managing batch transfers, consolidations, and splits within a branch.

---

## 1. BATCH TRANSFER

### POST /api/batch-operations/transfer

**Description:** Transfer quantity from one batch to another batch within the same branch

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:**
```json
{
  "itemId": 1,
  "sourceBatchNumber": "BATCH-001",
  "destinationBatchNumber": "BATCH-002",
  "quantity": 10,
  "costPrice": 80.00 | null,
  "unitPrice": 100.00 | null,
  "expirationDate": "2024-12-31T00:00:00Z" | null,
  "notes": "Optional notes" | null
}
```

**Field Descriptions:**

- `itemId` (M) - Item ID
- `sourceBatchNumber` (M) - Source batch number (must exist in branch stock)
- `destinationBatchNumber` (M) - Destination batch number (created if doesn't exist)
- `quantity` (M) - Quantity to transfer (must be > 0, cannot exceed available quantity in source batch)
- `costPrice` (O) - Cost price for destination batch
- `unitPrice` (O) - Unit price for destination batch
- `expirationDate` (O) - Expiration date for destination batch (ISO format)
- `notes` (O) - Optional notes

**Important Notes:**

1. **Branch Context**: Branch ID is automatically determined from user's current branch context
2. **Source Batch**: Must exist in branch stock with sufficient quantity
3. **Destination Batch**: Created automatically if it doesn't exist
4. **Quantity Validation**: Quantity must not exceed available quantity in source batch
5. **Stock Impact**: 
   - Source batch quantity decreases
   - Destination batch quantity increases

**Validation Rules:**

- `itemId` is **required**
- `sourceBatchNumber` is **required** and must exist in branch stock
- `destinationBatchNumber` is **required**
- `quantity` is **required** and must be > 0
- Quantity must not exceed available quantity in source batch

**Response:**
```json
{
  "success": true,
  "message": "Batch transfer completed successfully",
  "data": {
    "id": 1,
    "companyId": 1,
    "branchId": 2,
    "itemId": 1,
    "operationType": "batchTransfer",
    "sourceBatchId": 10,
    "sourceBatchNumber": "BATCH-001",
    "destinationBatchId": 11,
    "destinationBatchNumber": "BATCH-002",
    "quantity": 10,
    "notes": "Optional notes",
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:30:00Z",
    "createdBy": null,
    "updatedBy": null
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error (e.g., insufficient quantity, invalid batch)
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Source batch not found in branch stock
- `500 Internal Server Error` - Server error

---

## 2. BATCH CONSOLIDATION

### POST /api/batch-operations/consolidation

**Description:** Consolidate multiple source batches into a single destination batch

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:**
```json
{
  "itemId": 1,
  "destinationBatchNumber": "BATCH-CONSOLIDATED",
  "sources": [
    {
      "batchNumber": "BATCH-001",
      "quantity": 10 | null,
      "costPrice": 80.00 | null,
      "unitPrice": 100.00 | null,
      "expirationDate": "2024-12-31T00:00:00Z" | null
    },
    {
      "batchNumber": "BATCH-002",
      "quantity": 5 | null,
      "costPrice": 85.00 | null,
      "unitPrice": 105.00 | null,
      "expirationDate": "2024-12-31T00:00:00Z" | null
    }
  ],
  "notes": "Optional notes" | null
}
```

**Field Descriptions:**

- `itemId` (M) - Item ID
- `destinationBatchNumber` (M) - Destination batch number (created if doesn't exist)
- `sources` (M) - Array of source batches (min: 1)
  - `batchNumber` (M) - Source batch number (must exist in branch stock)
  - `quantity` (O) - Quantity to consolidate (if null, uses all available quantity)
  - `costPrice` (O) - Cost price (used for destination batch if provided)
  - `unitPrice` (O) - Unit price (used for destination batch if provided)
  - `expirationDate` (O) - Expiration date (used for destination batch if provided)
- `notes` (O) - Optional notes

**Important Notes:**

1. **Branch Context**: Branch ID is automatically determined from user's current branch context
2. **Source Batches**: All must exist in branch stock
3. **Quantity**: If not provided, uses all available quantity from source batch
4. **Destination Batch**: Created automatically if it doesn't exist
5. **Stock Impact**: 
   - Source batch quantities decrease (or become 0 if all quantity used)
   - Destination batch quantity increases by sum of transferred quantities

**Validation Rules:**

- `itemId` is **required**
- `destinationBatchNumber` is **required**
- `sources` array is **required** with at least one source batch
- All source batch numbers must exist in branch stock
- If quantity is provided, it must not exceed available quantity in source batch

**Response:**
```json
{
  "success": true,
  "message": "Batch consolidation completed successfully",
  "data": [
    {
      "id": 2,
      "companyId": 1,
      "branchId": 2,
      "itemId": 1,
      "operationType": "batchConsolidation",
      "sourceBatchId": 10,
      "sourceBatchNumber": "BATCH-001",
      "destinationBatchId": 12,
      "destinationBatchNumber": "BATCH-CONSOLIDATED",
      "quantity": 10,
      "notes": "Optional notes",
      "createdAt": "2024-01-15T10:40:00Z",
      "updatedAt": "2024-01-15T10:40:00Z",
      "createdBy": null,
      "updatedBy": null
    },
    {
      "id": 3,
      "companyId": 1,
      "branchId": 2,
      "itemId": 1,
      "operationType": "batchConsolidation",
      "sourceBatchId": 11,
      "sourceBatchNumber": "BATCH-002",
      "destinationBatchId": 12,
      "destinationBatchNumber": "BATCH-CONSOLIDATED",
      "quantity": 5,
      "notes": "Optional notes",
      "createdAt": "2024-01-15T10:40:00Z",
      "updatedAt": "2024-01-15T10:40:00Z",
      "createdBy": null,
      "updatedBy": null
    }
  ]
}
```

**Error Responses:**
- `400 Bad Request` - Validation error (e.g., insufficient quantity, invalid batch)
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Source batch not found in branch stock
- `500 Internal Server Error` - Server error

---

## 3. BATCH SPLIT

### POST /api/batch-operations/split

**Description:** Split a source batch into multiple destination batches

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:**
```json
{
  "itemId": 1,
  "sourceBatchNumber": "BATCH-001",
  "destinations": [
    {
      "batchNumber": "BATCH-001A",
      "quantity": 5,
      "costPrice": 80.00 | null,
      "unitPrice": 100.00 | null,
      "expirationDate": "2024-12-31T00:00:00Z" | null
    },
    {
      "batchNumber": "BATCH-001B",
      "quantity": 5,
      "costPrice": 80.00 | null,
      "unitPrice": 100.00 | null,
      "expirationDate": "2024-12-31T00:00:00Z" | null
    }
  ],
  "notes": "Optional notes" | null
}
```

**Field Descriptions:**

- `itemId` (M) - Item ID
- `sourceBatchNumber` (M) - Source batch number (must exist in branch stock)
- `destinations` (M) - Array of destination batches (min: 1)
  - `batchNumber` (M) - Destination batch number (created if doesn't exist)
  - `quantity` (M) - Quantity to split (must be > 0)
  - `costPrice` (O) - Cost price for destination batch
  - `unitPrice` (O) - Unit price for destination batch
  - `expirationDate` (O) - Expiration date for destination batch (ISO format)
- `notes` (O) - Optional notes

**Important Notes:**

1. **Branch Context**: Branch ID is automatically determined from user's current branch context
2. **Source Batch**: Must exist in branch stock with sufficient quantity
3. **Destination Batches**: Created automatically if they don't exist
4. **Quantity Validation**: Sum of all destination quantities must not exceed available quantity in source batch
5. **Stock Impact**: 
   - Source batch quantity decreases by sum of split quantities
   - Each destination batch quantity increases by its split quantity

**Validation Rules:**

- `itemId` is **required**
- `sourceBatchNumber` is **required** and must exist in branch stock
- `destinations` array is **required** with at least one destination batch
- Each destination `quantity` is **required** and must be > 0
- Sum of all destination quantities must not exceed available quantity in source batch

**Response:**
```json
{
  "success": true,
  "message": "Batch split completed successfully",
  "data": [
    {
      "id": 4,
      "companyId": 1,
      "branchId": 2,
      "itemId": 1,
      "operationType": "batchSplit",
      "sourceBatchId": 10,
      "sourceBatchNumber": "BATCH-001",
      "destinationBatchId": 13,
      "destinationBatchNumber": "BATCH-001A",
      "quantity": 5,
      "notes": "Optional notes",
      "createdAt": "2024-01-15T10:50:00Z",
      "updatedAt": "2024-01-15T10:50:00Z",
      "createdBy": null,
      "updatedBy": null
    },
    {
      "id": 5,
      "companyId": 1,
      "branchId": 2,
      "itemId": 1,
      "operationType": "batchSplit",
      "sourceBatchId": 10,
      "sourceBatchNumber": "BATCH-001",
      "destinationBatchId": 14,
      "destinationBatchNumber": "BATCH-001B",
      "quantity": 5,
      "notes": "Optional notes",
      "createdAt": "2024-01-15T10:50:00Z",
      "updatedAt": "2024-01-15T10:50:00Z",
      "createdBy": null,
      "updatedBy": null
    }
  ]
}
```

**Error Responses:**
- `400 Bad Request` - Validation error (e.g., insufficient quantity, invalid batch)
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Source batch not found in branch stock
- `500 Internal Server Error` - Server error

---

## Notes

1. **Batch Creation**: Destination batches are automatically created if they don't exist

2. **Stock Movements**: All batch operations create stock movement records for audit trail

3. **Quantity Validation**: 
   - All operations validate that source batches have sufficient quantity
   - Split operation validates that sum of destination quantities doesn't exceed source quantity

4. **Price Handling**: 
   - If prices are not provided for destination batches, they inherit from source batch
   - Prices can be updated during the operation

5. **Expiration Date**: 
   - If expiration date is not provided for destination batches, it inherits from source batch
   - Expiration date can be updated during the operation

6. **Operation Types**: 
   - `batchTransfer` - Transfer from one batch to another
   - `batchConsolidation` - Consolidate multiple batches into one
   - `batchSplit` - Split one batch into multiple batches

7. **Branch Context**: All operations are performed within the user's current branch context

8. **Audit Trail**: All operations create batch operation records and stock movement records for tracking
