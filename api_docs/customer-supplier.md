# Customer-Supplier API Documentation

## Overview

This document describes the customer-supplier API endpoints for managing customers and suppliers, their transactions, payments, and balance adjustments.

---

## 1. CREATE CUSTOMER/SUPPLIER

### POST /api/customer-supplier

**Description:** Create a new customer or supplier

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:**
```json
{
  "name": "Customer/Supplier Name",
  "phone": "+251912345678",
  "accountCode": "ACC-001",
  "tinNumber": "TIN123456" | null,
  "type": "CUSTOMER" | "SUPPLIER"
}
```

**Field Descriptions:**

- `name` (M) - Customer/Supplier name (1-100 characters)
- `phone` (M) - Phone number (will be normalized)
- `accountCode` (M) - Unique account code (1-100 characters)
- `tinNumber` (O) - Tax Identification Number (optional)
- `type` (M) - Type: `"CUSTOMER"` or `"SUPPLIER"`

**Validation Rules:**

- Phone number must be unique within the company
- Account code must be unique within the company
- TIN number must be unique within the company (if provided)

**Response:**
```json
{
  "success": true,
  "message": "Customer/Supplier created successfully",
  "data": {
    "id": 123,
    "companyId": 1,
    "name": "Customer/Supplier Name",
    "phone": "+251912345678",
    "accountCode": "ACC-001",
    "tinNumber": "TIN123456",
    "type": "CUSTOMER",
    "balance": 0.00,
    "isActive": true,
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:30:00Z",
    "createdBy": null,
    "updatedBy": null
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `409 Conflict` - Phone, account code, or TIN number already exists
- `500 Internal Server Error` - Server error

---

## 2. GET ALL CUSTOMERS/SUPPLIERS

### GET /api/customer-supplier

**Description:** Get all customers/suppliers with optional filtering and pagination

**Authentication Required:** ✅ Yes (Active & Verified User)

**Query Parameters:**
- `page` (O) - Page number (default: 1)
- `limit` (O) - Items per page (default: 10)
- `type` (O) - Filter by type: `"CUSTOMER"` or `"SUPPLIER"`
- `search` (O) - Search by name, phone, account code, or TIN number
- `text` (O) - Alias for `search`

**Response:**
```json
{
  "success": true,
  "message": "Customers/Suppliers retrieved successfully",
  "data": [
    {
      "id": 123,
      "companyId": 1,
      "name": "Customer/Supplier Name",
      "phone": "+251912345678",
      "accountCode": "ACC-001",
      "tinNumber": "TIN123456",
      "type": "CUSTOMER",
      "balance": 0.00,
      "isActive": true,
      "createdAt": "2024-01-15T10:30:00Z",
      "updatedAt": "2024-01-15T10:30:00Z",
      "createdBy": null,
      "updatedBy": null
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

## 3. GET CUSTOMER/SUPPLIER BY ID

### GET /api/customer-supplier/:id

**Description:** Get a single customer/supplier by ID

**Authentication Required:** ✅ Yes (Active & Verified User)

**Response:**
```json
{
  "success": true,
  "message": "Customer/Supplier retrieved successfully",
  "data": {
    "id": 123,
    "companyId": 1,
    "name": "Customer/Supplier Name",
    "phone": "+251912345678",
    "accountCode": "ACC-001",
    "tinNumber": "TIN123456",
    "type": "CUSTOMER",
    "balance": 0.00,
    "isActive": true,
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:30:00Z",
    "createdBy": null,
    "updatedBy": null
  }
}
```

**Error Responses:**
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Customer/Supplier not found
- `500 Internal Server Error` - Server error

---

## 4. UPDATE CUSTOMER/SUPPLIER

### PUT /api/customer-supplier/:id

**Description:** Update a customer/supplier

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:**
```json
{
  "name": "Updated Name" | undefined,
  "phone": "+251912345679" | undefined,
  "accountCode": "ACC-002" | undefined,
  "tinNumber": "TIN123457" | null | undefined,
  "type": "SUPPLIER" | undefined,
  "isActive": true | undefined
}
```

**Field Descriptions:**

- All fields are optional - only provided fields will be updated
- At least one field must be provided
- Phone, account code, and TIN number must be unique if changed

**Response:**
```json
{
  "success": true,
  "message": "Customer/Supplier updated successfully",
  "data": {
    "id": 123,
    "companyId": 1,
    "name": "Updated Name",
    "phone": "+251912345679",
    "accountCode": "ACC-002",
    "tinNumber": "TIN123457",
    "type": "SUPPLIER",
    "balance": 0.00,
    "isActive": true,
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:35:00Z",
    "createdBy": null,
    "updatedBy": 1
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error or no fields provided
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Customer/Supplier not found
- `409 Conflict` - Phone, account code, or TIN number already exists
- `500 Internal Server Error` - Server error

---

## 5. DELETE CUSTOMER/SUPPLIER

### DELETE /api/customer-supplier/:id

**Description:** Delete (soft delete) a customer/supplier

**Authentication Required:** ✅ Yes (Active & Verified User)

**Response:**
```json
{
  "success": true,
  "message": "Customer/Supplier deleted successfully",
  "data": {
    "id": 123,
    "companyId": 1,
    "name": "Customer/Supplier Name",
    "phone": "+251912345678",
    "accountCode": "ACC-001",
    "tinNumber": "TIN123456",
    "type": "CUSTOMER",
    "balance": 0.00,
    "isActive": false,
    "createdAt": "2024-01-15T10:30:00Z",
    "updatedAt": "2024-01-15T10:40:00Z",
    "createdBy": null,
    "updatedBy": 1
  }
}
```

**Error Responses:**
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Customer/Supplier not found
- `500 Internal Server Error` - Server error

---

## 6. GET TRANSACTIONS

### GET /api/customer-supplier/:id/transactions

**Description:** Get transactions for a customer or supplier (automatically determines type)

**Authentication Required:** ✅ Yes (Active & Verified User)

**Response:**
```json
{
  "success": true,
  "message": "Transactions retrieved successfully",
  "data": [
    {
      "id": 789,
      "companyId": 1,
      "branchId": 2,
      "transactionType": "sale",
      "transactionNumber": "SAL-2401-0001-1234",
      "status": "completed",
      "supplierId": null,
      "customerId": 123,
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
      "supplierName": null,
      "customerName": "Customer/Supplier Name",
      "salesOrderNumber": null,
      "items": [],
      "payment": null
    }
  ]
}
```

**Error Responses:**
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Customer/Supplier not found
- `500 Internal Server Error` - Server error

---

## 7. GET PAYMENTS

### GET /api/customer-supplier/:id/payments

**Description:** Get payments for a customer or supplier (automatically determines type)

**Authentication Required:** ✅ Yes (Active & Verified User)

**Response:**
```json
{
  "success": true,
  "message": "Payments retrieved successfully",
  "data": [
    {
      "id": 1,
      "companyId": 1,
      "branchId": 2,
      "transactionId": 789,
      "customerId": 123,
      "supplierId": null,
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
      "paymentMethods": []
    }
  ]
}
```

**Error Responses:**
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Customer/Supplier not found
- `500 Internal Server Error` - Server error

---

## 8. GET TRANSACTION HISTORY

### GET /api/customer-supplier/:id/transaction-history

**Description:** Get transaction history (unified view of transactions and payments) for a customer or supplier

**Authentication Required:** ✅ Yes (Active & Verified User)

**Query Parameters:**
- `page` (O) - Page number (default: 1)
- `limit` (O) - Items per page (default: 10)

**Response:**
```json
{
  "success": true,
  "message": "Transaction history retrieved successfully",
  "data": [
    {
      "id": 789,
      "date": "2024-01-15T10:30:00Z",
      "type": "Sales",
      "debit": 1150.00,
      "credit": 500.00,
      "transactionId": 789,
      "salesOrderId": null
    },
    {
      "id": 1,
      "date": "2024-01-15T10:30:00Z",
      "type": "Payment",
      "debit": 1150.00,
      "credit": 500.00,
      "transactionId": 789,
      "salesOrderId": null
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

**Transaction History Types:**
- `"Sales Order"` - Sales order
- `"Sales"` - Sale transaction
- `"Sales Return"` - Sales return transaction
- `"Purchase"` - Purchase transaction
- `"Purchase Return"` - Purchase return transaction
- `"Payment Return"` - Refund payment
- `"Payment"` - Payment

**Error Responses:**
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `404 Not Found` - Customer/Supplier not found
- `500 Internal Server Error` - Server error

---

## 9. ADD BALANCE

### POST /api/customer-supplier/add-balance

**Description:** Add balance to a customer or supplier (balance adjustment payment)

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:**
```json
{
  "customerSupplierId": 123,
  "amount": 1000.00,
  "paymentMethods": [
    {
      "method": "cash" | "telebirr" | "m_pesa" | "bank_transfer" | "check" | "other",
      "amount": 1000.00,
      "bankId": 1 | null,
      "referenceNumber": "REF123" | null,
      "attachment": "url" | null
    }
  ],
  "notes": "Optional notes" | null
}
```

**Field Descriptions:**

- `customerSupplierId` (M) - Customer/Supplier ID
- `amount` (M) - Total amount (sum of all payment methods)
- `paymentMethods` (M) - Array of payment methods (min: 1)
  - `method` (M) - Payment method type
  - `amount` (M) - Amount for this payment method
  - `bankId` (O) - Bank ID (required for `bank_transfer`)
  - `referenceNumber` (O) - Reference number
  - `attachment` (O) - Attachment URL for payment receipt
- `notes` (O) - Optional notes

**Response:**
```json
{
  "success": true,
  "message": "Add balance payment created successfully",
  "data": {
    "id": 2,
    "companyId": 1,
    "branchId": 2,
    "transactionId": null,
    "customerId": 123,
    "supplierId": null,
    "totalAmount": 1000.00,
    "paidAmount": 1000.00,
    "paymentType": "balanceAdjustment",
    "originalPaymentId": null,
    "notes": "Optional notes",
    "createdAt": "2024-01-15T10:50:00Z",
    "updatedAt": "2024-01-15T10:50:00Z",
    "createdBy": null,
    "updatedBy": null,
    "receivedBy": null,
    "paymentMethods": [
      {
        "id": 2,
        "paymentId": 2,
        "method": "cash",
        "amount": 1000.00,
        "attachment": null,
        "referenceNumber": null,
        "bankId": null,
        "bankName": null,
        "createdAt": "2024-01-15T10:50:00Z",
        "updatedAt": "2024-01-15T10:50:00Z",
        "createdBy": null,
        "updatedBy": null
      }
    ]
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `500 Internal Server Error` - Server error

---

## 10. CREATE REFUND

### POST /api/customer-supplier/refund

**Description:** Create a refund payment for a customer or supplier

**Authentication Required:** ✅ Yes (Active & Verified User)

**Request:**
```json
{
  "customerSupplierId": 123,
  "amount": 500.00,
  "paymentMethods": [
    {
      "method": "cash" | "telebirr" | "m_pesa" | "bank_transfer" | "check" | "other",
      "amount": 500.00,
      "bankId": 1 | null,
      "referenceNumber": "REF123" | null,
      "attachment": "url" | null
    }
  ],
  "notes": "Optional notes" | null
}
```

**Field Descriptions:**

- `customerSupplierId` (M) - Customer/Supplier ID
- `amount` (M) - Total refund amount (sum of all payment methods)
- `paymentMethods` (M) - Array of payment methods (min: 1)
  - `method` (M) - Payment method type
  - `amount` (M) - Amount for this payment method
  - `bankId` (O) - Bank ID (required for `bank_transfer`)
  - `referenceNumber` (O) - Reference number
  - `attachment` (O) - Attachment URL for payment receipt
- `notes` (O) - Optional notes

**Response:**
```json
{
  "success": true,
  "message": "Refund payment created successfully",
  "data": {
    "id": 3,
    "companyId": 1,
    "branchId": 2,
    "transactionId": null,
    "customerId": 123,
    "supplierId": null,
    "totalAmount": 500.00,
    "paidAmount": 500.00,
    "paymentType": "refund",
    "originalPaymentId": null,
    "notes": "Optional notes",
    "createdAt": "2024-01-15T11:00:00Z",
    "updatedAt": "2024-01-15T11:00:00Z",
    "createdBy": null,
    "updatedBy": null,
    "receivedBy": null,
    "paymentMethods": [
      {
        "id": 3,
        "paymentId": 3,
        "method": "cash",
        "amount": 500.00,
        "attachment": null,
        "referenceNumber": null,
        "bankId": null,
        "bankName": null,
        "createdAt": "2024-01-15T11:00:00Z",
        "updatedAt": "2024-01-15T11:00:00Z",
        "createdBy": null,
        "updatedBy": null
      }
    ]
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive or unverified
- `500 Internal Server Error` - Server error

---

## Notes

1. **Phone Normalization**: Phone numbers are automatically normalized to a standard format

2. **Balance Management**: 
   - Balance is automatically updated based on transactions and payments
   - Add balance increases customer balance (credit) or decreases supplier balance (debit)
   - Refunds adjust balance accordingly

3. **Type Detection**: 
   - Transactions and payments endpoints automatically detect if the ID belongs to a customer or supplier
   - No need to specify type when fetching transactions/payments

4. **Transaction History**: 
   - Provides unified view of all transactions and payments
   - Debit/Credit logic differs for customers vs suppliers
   - For customers: Sales = Debit, Payments = Credit
   - For suppliers: Purchases = Credit, Payments = Debit

5. **Soft Delete**: Deleting a customer/supplier sets `isActive` to `false` but does not remove the record

6. **Unique Constraints**: Phone, account code, and TIN number must be unique within a company
