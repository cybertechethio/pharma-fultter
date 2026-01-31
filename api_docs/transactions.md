# Transactions API Documentation

## Overview

This document describes the transactions API endpoints for managing various types of transactions including purchases, sales, adjustments, waste, damage, and related operations.

---

## 1. CREATE TRANSACTION

### POST /api/transactions

**Description:** Create a new transaction

**Authentication Required:** ✅ Yes (Active & Verified User)

**Transaction Types Available:**
- `purchase` - Purchase transaction (increases stock)
- `imported` - Imported transaction (increases stock)
- `sale` - Sale transaction (decreases stock)
- `adjustment` - Stock adjustment (special)
- `waste` - Waste transaction (decreases stock)
- `damage` - Damage transaction (decreases stock)
- `batch_transfer` - Batch transfer transaction
- `batch_consolidation` - Batch consolidation transaction
- `batch_split` - Batch split transaction
- `shortage` - Shortage transaction
- `excess` - Excess transaction

**Request:**
```json
{
  "transactionType": "purchase" | "sale" | "adjustment" | "waste" | "damage" | "imported" | "batch_transfer" | "batch_consolidation" | "batch_split" | "shortage" | "excess",
  "supplierId": 123 | null,
  "customerId": 456 | null,
  "relatedId": 789 | null,
  "notes": "Optional notes" | null,
  "attachments": ["url1", "url2"],
  "items": [
    {
      "itemId": 1,
      "taxRate": 15.0 | null,
      "batches": [
        {
          "batchNumber": "BATCH-001",
          "quantity": 10,
          "unitPrice": 100.00,
          "costPrice": 80.00 | null,
          "expirationDate": "2024-12-31T00:00:00Z" | null
        }
      ]
    }
  ],
  "payment": {
    "amount": 500.00 | null,
    "notes": null
  },
  "paymentMethods": [
    {
      "method": "cash" | "telebirr" | "m_pesa" | "bank_transfer" | "check" | "other",
      "amount": 500.00,
      "bankId": 1 | null,
      "referenceNumber": "REF123" | null,
      "attachment": "url" | null
    }
  ]
}
```

**Field Descriptions:**

- `transactionType` (M) - Type of transaction
- `supplierId` (O) - Required for `purchase` and `imported` transactions, null for others
- `customerId` (O) - Required for `sale` transactions. `null` = walking customer (no customer selected)
- `relatedId` (M) - Required when `transactionType` is `shortage` or `excess` (ID of related transaction)
- `notes` (O) - Optional transaction notes
- `attachments` (O) - Array of attachment URLs (uploaded separately)
- `items` (M) - Array of transaction items (min: 1)
  - `itemId` (M) - Item ID
  - `taxRate` (O) - Tax rate (if null, fetched from item configuration)
  - `batches` (M) - Array of batches for this item (min: 1)
    - `batchNumber` (M) - Batch number/identifier
    - `quantity` (M) - Quantity for this batch (must be > 0)
    - `unitPrice` (M) - Unit price for this batch
    - `costPrice` (O) - Cost price (typically used for purchase transactions)
    - `expirationDate` (O) - Expiration date in ISO format
- `payment` (O) - Payment object (required for `purchase`, `imported`, and `sale` transactions)
  - `amount` (O) - Total paid amount (sum of all payment methods)
  - `notes` (O) - Payment notes
- `paymentMethods` (O) - Array of payment methods (required if payment provided)
  - `method` (M) - Payment method type
  - `amount` (M) - Amount for this payment method
  - `bankId` (O) - Bank ID (required for `bank_transfer`)
  - `referenceNumber` (O) - Reference number
  - `attachment` (O) - Attachment URL for payment receipt

**Important Notes:**

1. **Status**: Not sent from UI - backend automatically sets status to `"completed"`
2. **Tax Rate**: If not provided, backend fetches tax rate from item configuration
3. **Allocated From**: Not sent from UI - backend automatically sets to `"system"`
4. **Walking Customer**: When no customer is selected for sale, send `customerId: null`
5. **Payment Amount**: Must be the sum of all payment method amounts
6. **Quantity Validation**: 
   - For `purchase` and `imported`: Unlimited quantity allowed (no validation)
   - For other types: Quantity validated against available batch quantity
7. **Price Display**:
   - For `purchase` and `imported`: Shows cost price (`costPrice`)
   - For other types: Shows unit price (`unitPrice`)

**Validation Rules:**

- `purchase` and `imported`: `supplierId` is **required**
- `sale`: `customerId` can be `null` (walking customer)
- `adjustment`, `waste`, `damage`: No supplier/customer required
- `shortage`, `excess`: `relatedId` is **required**
- All transaction types: At least one item with at least one batch is required
- Payment: Required only for `purchase`, `imported`, and `sale` transactions

**Response:**
```json
{
  "success": true,
  "message": "Transaction created successfully",
  "data": {
    "id": 789,
    "companyId": 1,
    "branchId": 2,
    "transactionType": "purchase",
    "transactionNumber": "PUR-2401-0001-1234",
    "status": "completed",
    "supplierId": 123,
    "customerId": null,
    "subtotal": 1000.00,
    "totalTax": 150.00,
    "totalAmount": 1150.00,
    "notes": "Optional notes",
    "attachments": ["url1", "url2"],
    "relatedId": null,
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:30:00Z",
    "createdBy": 1,
    "updatedBy": null,
    "creatorName": "Creator Name",
    "supplierName": "Supplier Name",
    "customerName": null,
    "salesOrderNumber": null,
    "items": [
      {
        "id": 1,
        "transactionId": 789,
        "itemId": 1,
        "itemName": "Item Name",
        "itemCode": "ITEM-001",
        "quantity": 10,
        "taxRate": 15.0,
        "total": 1150.00,
        "createdAt": "2024-01-15T10:30:00Z",
        "updatedAt": "2024-01-15T10:30:00Z",
        "createdBy": null,
        "updatedBy": null,
        "batches": [
          {
            "id": 1,
            "transactionItemId": 1,
            "batchNumber": "BATCH-001",
            "quantity": 10,
            "unitPrice": 100.00,
            "costPrice": 80.00,
            "taxableAmount": 869.57,
            "taxAmount": 130.43,
            "total": 1000.00,
            "expirationDate": "2024-12-31T00:00:00Z",
            "allocatedFrom": "system",
            "createdAt": "2024-01-15T10:30:00Z",
            "updatedAt": "2024-01-15T10:30:00Z",
            "createdBy": null,
            "updatedBy": null
          }
        ]
      }
    ],
    "payment": {
      "id": 1,
      "companyId": 1,
      "branchId": 2,
      "transactionId": 789,
      "customerId": null,
      "supplierId": 123,
      "totalAmount": 1150.00,
      "paidAmount": 500.00,
      "paymentType": "payment",
      "originalPaymentId": null,
      "notes": null,
      "createdAt": "2024-01-15T10:30:00Z",
      "updatedAt": "2024-01-15T10:30:00Z",
      "createdBy": null,
      "updatedBy": null,
      "receivedBy": null,
      "paymentMethods": [
        {
          "id": 1,
          "paymentId": 1,
          "method": "cash",
          "amount": 500.00,
          "attachment": null,
          "referenceNumber": null,
          "bankId": null,
          "bankName": null,
          "createdAt": "2024-01-15T10:30:00Z",
          "updatedAt": "2024-01-15T10:30:00Z",
          "createdBy": null,
          "updatedBy": null
        }
      ]
    }
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error (e.g., missing supplier for purchase, missing items)
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `500 Internal Server Error` - Server error

---

## 2. GET ALL TRANSACTIONS

### GET /api/transactions

**Description:** Get all transactions with optional filtering and pagination

**Authentication Required:** ✅ Yes (Active & Verified User)

**Query Parameters:**
- `page` (O) - Page number (default: 1)
- `limit` (O) - Items per page (default: 10)
- `transactionType` (O) - Filter by transaction type
- `status` (O) - Filter by status: `"completed"`, `"reversed"`
- `supplierId` (O) - Filter by supplier ID
- `customerId` (O) - Filter by customer ID
- `branchId` (O) - Filter by branch ID
- `dateFrom` (O) - Filter from date (ISO format)
- `dateTo` (O) - Filter to date (ISO format)

**Response:**
```json
{
  "success": true,
  "message": "Transactions fetched successfully",
  "data": [
    {
      "id": 789,
      "companyId": 1,
      "branchId": 2,
      "transactionType": "purchase",
      "transactionNumber": "PUR-2401-0001-1234",
      "status": "completed",
      "supplierId": 123,
      "customerId": null,
      "subtotal": 1000.00,
      "totalTax": 150.00,
      "totalAmount": 1150.00,
      "notes": "Optional notes",
      "attachments": [],
      "relatedId": null,
      "createdAt": "2024-01-15T10:30:00Z",
      "updatedAt": "2024-01-15T10:30:00Z",
      "createdBy": 1,
      "updatedBy": null,
      "creatorName": "Creator Name",
      "supplierName": "Supplier Name",
      "customerName": null,
      "salesOrderNumber": null,
      "items": [],
      "payment": null
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

## 3. GET TRANSACTION BY ID

### GET /api/transactions/:id

**Description:** Get a single transaction by ID

**Authentication Required:** ✅ Yes (Active & Verified User)

**Response:**
```json
{
  "success": true,
  "message": "Transaction fetched successfully",
  "data": {
    "id": 789,
    "companyId": 1,
    "branchId": 2,
    "transactionType": "purchase",
    "transactionNumber": "PUR-2401-0001-1234",
    "status": "completed",
    "supplierId": 123,
    "customerId": null,
    "subtotal": 1000.00,
    "totalTax": 150.00,
    "totalAmount": 1150.00,
    "notes": "Optional notes",
    "attachments": ["url1", "url2"],
    "relatedId": null,
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:30:00Z",
    "createdBy": 1,
    "updatedBy": null,
    "creatorName": "Creator Name",
    "supplierName": "Supplier Name",
    "customerName": null,
    "salesOrderNumber": null,
    "items": [
      {
        "id": 1,
        "transactionId": 789,
        "itemId": 1,
        "itemName": "Item Name",
        "itemCode": "ITEM-001",
        "quantity": 10,
        "taxRate": 15.0,
        "total": 1150.00,
        "createdAt": "2024-01-15T10:30:00Z",
        "updatedAt": "2024-01-15T10:30:00Z",
        "createdBy": null,
        "updatedBy": null,
        "batches": [
          {
            "id": 1,
            "transactionItemId": 1,
            "batchNumber": "BATCH-001",
            "quantity": 10,
            "unitPrice": 100.00,
            "costPrice": 80.00,
            "taxableAmount": 869.57,
            "taxAmount": 130.43,
            "total": 1000.00,
            "expirationDate": "2024-12-31T00:00:00Z",
            "allocatedFrom": "system",
            "createdAt": "2024-01-15T10:30:00Z",
            "updatedAt": "2024-01-15T10:30:00Z",
            "createdBy": null,
            "updatedBy": null
          }
        ]
      }
    ],
    "payment": {
      "id": 1,
      "companyId": 1,
      "branchId": 2,
      "transactionId": 789,
      "customerId": null,
      "supplierId": 123,
      "totalAmount": 1150.00,
      "paidAmount": 500.00,
      "paymentType": "payment",
      "originalPaymentId": null,
      "notes": null,
      "createdAt": "2024-01-15T10:30:00Z",
      "updatedAt": "2024-01-15T10:30:00Z",
      "createdBy": null,
      "updatedBy": null,
      "receivedBy": null,
      "paymentMethods": [
        {
          "id": 1,
          "paymentId": 1,
          "method": "cash",
          "amount": 500.00,
          "attachment": null,
          "referenceNumber": null,
          "bankId": null,
          "bankName": null,
          "createdAt": "2024-01-15T10:30:00Z",
          "updatedAt": "2024-01-15T10:30:00Z",
          "createdBy": null,
          "updatedBy": null
        }
      ]
    }
  }
}
```

**Error Responses:**
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Transaction not found
- `500 Internal Server Error` - Server error

---

## 4. REVERSE TRANSACTION

### POST /api/transactions/:transactionId/reverse

**Description:** Reverse a transaction (creates a reverse transaction)

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:**
```json
{
  "notes": "Optional notes" | null
}
```

**Field Descriptions:**

- `notes` (O) - Optional notes for the reversal

**Response:**
```json
{
  "success": true,
  "message": "Transaction reversed successfully",
  "data": {
    "id": 789,
    "companyId": 1,
    "branchId": 2,
    "transactionType": "purchase",
    "transactionNumber": "PUR-2401-0001-1234",
    "status": "reversed",
    "supplierId": 123,
    "customerId": null,
    "subtotal": 1000.00,
    "totalTax": 150.00,
    "totalAmount": 1150.00,
    "notes": "Optional notes",
    "attachments": [],
    "relatedId": null,
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:35:00Z",
    "createdBy": 1,
    "updatedBy": 1,
    "creatorName": "Creator Name",
    "supplierName": "Supplier Name",
    "customerName": null,
    "salesOrderNumber": null,
    "items": [],
    "payment": null
  }
}
```

**Error Responses:**
- `400 Bad Request` - Transaction cannot be reversed
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Transaction not found
- `500 Internal Server Error` - Server error

---

## 5. CREATE SHORTAGE TRANSACTION

### POST /api/transactions/:transactionId/shortage

**Description:** Create a shortage transaction for items that were missing

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
  "message": "Shortage transaction created successfully",
  "data": {
    "id": 790,
    "companyId": 1,
    "branchId": 2,
    "transactionType": "shortage",
    "transactionNumber": "SHO-2401-0001-1235",
    "status": "completed",
    "supplierId": null,
    "customerId": null,
    "subtotal": 500.00,
    "totalTax": 75.00,
    "totalAmount": 575.00,
    "notes": "Optional notes",
    "attachments": [],
    "relatedId": 789,
    "createdAt": "2024-01-15T10:40:00Z",
    "updatedAt": "2024-01-15T10:40:00Z",
    "createdBy": 1,
    "updatedBy": null,
    "creatorName": "Creator Name",
    "supplierName": null,
    "customerName": null,
    "salesOrderNumber": null,
    "items": [],
    "payment": null
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Original transaction not found
- `500 Internal Server Error` - Server error

---

## 6. CREATE EXCESS TRANSACTION

### POST /api/transactions/:transactionId/excess

**Description:** Create an excess transaction for items that were received in excess

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
  "message": "Excess transaction created successfully",
  "data": {
    "id": 791,
    "companyId": 1,
    "branchId": 2,
    "transactionType": "excess",
    "transactionNumber": "EXC-2401-0001-1236",
    "status": "completed",
    "supplierId": null,
    "customerId": null,
    "subtotal": 200.00,
    "totalTax": 30.00,
    "totalAmount": 230.00,
    "notes": "Optional notes",
    "attachments": [],
    "relatedId": 789,
    "createdAt": "2024-01-15T10:45:00Z",
    "updatedAt": "2024-01-15T10:45:00Z",
    "createdBy": 1,
    "updatedBy": null,
    "creatorName": "Creator Name",
    "supplierName": null,
    "customerName": null,
    "salesOrderNumber": null,
    "items": [],
    "payment": null
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Original transaction not found
- `500 Internal Server Error` - Server error

---

## Notes

1. **Transaction Number**: Automatically generated by backend in format: `{PREFIX}{YYMM}{SEQUENCE}-{RANDOM}` (e.g., `PUR-2401-0001-1234`)

2. **Stock Impact**: 
   - Transactions automatically update branch stock based on transaction type
   - Purchase/Imported: Increases stock
   - Sale/Waste/Damage: Decreases stock
   - Adjustment: Can increase or decrease based on quantity

3. **Tax Calculation**: Uses tax-inclusive pricing. Tax rate is retrieved from the Items table by backend if not provided

4. **Walking Customer**: When `customerId` is `null` for sale transactions, backend treats it as a walking customer (no specific customer record)

5. **Status Management**: 
   - Transactions: Backend sets status to `"completed"` automatically
   - Reversed transactions: Status changes to `"reversed"`

6. **Batch Allocation**: Backend automatically sets `allocatedFrom` to `"system"` for all batches

7. **Payment**: Only required for `purchase`, `imported`, and `sale` transactions. Other transaction types do not require payment

8. **Response Structure**: Frontend receives `items` (not `transactionItems`) and `batches` (not `transactionItemBatches`) in the response
