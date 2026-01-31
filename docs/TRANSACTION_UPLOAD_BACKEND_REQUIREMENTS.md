# Transaction Upload - Backend Requirements & Implementation Guide

## Overview

This document details the exact request format expected by the backend for creating transactions with file uploads. The backend accepts `multipart/form-data` requests containing JSON payload and multiple file attachments.

---

## Request Format

### HTTP Method & Endpoint
- **Method**: `POST`
- **Endpoint**: `/api/transactions`
- **Content-Type**: `multipart/form-data` (automatically set by Dio when FormData is used)

### Important Notes
- ✅ **DO NOT** manually set `Content-Type: application/json` when sending FormData
- ✅ **DO NOT** set `Content-Type` header at all - let Dio handle it automatically
- ✅ The backend will automatically set `Content-Type: multipart/form-data` with boundary

---

## Request Body Structure

The request body must contain three types of data:

### 1. JSON Data Field (Required)

**Field Name**: `data` (exact, case-sensitive)

**Type**: Text/JSON String

**Content**: JSON string containing the transaction payload, wrapped with metadata

**Format**:
```json
{
  "metadata": {
    "request_id": "auto-generated-uuid",
    "timestamp": "2025-11-20T08:00:00.000Z"
  },
  "data": {
    "transaction_type": "sale",
    "customer_id": 123,
    "supplier_id": null,
    "branch_id": null,
    "notes": "Optional notes",
    "items": [
      {
        "item_id": 1,
        "tax_rate": 15,
        "batches": [
          {
            "batch_number": "BATCH001",
            "quantity": 10,
            "unit_price": 100.00,
            "cost_price": 80.00,
            "expiration_date": "2025-12-31"
          }
        ]
      }
    ],
    "payment_methods": [
      {
        "method": "bank_transfer",
        "amount": 500.00,
        "reference_number": "TXN123456",
        "bank_id": 1,
        "attachment": null
      }
    ]
  }
}
```

**Implementation Note**: The JSON is automatically wrapped with metadata using `RequestWrapper.wrap()` before being stringified and added to FormData.

---

### 2. Transaction Attachments (Optional)

**Field Name**: `attachments` (exact, plural, case-sensitive)

**Type**: Multiple Image Files

**Requirements**:
- ✅ Field name must be exactly `attachments` (plural)
- ✅ Multiple files allowed (up to 10)
- ✅ Images only (JPEG, PNG, GIF, WebP, etc.)
- ✅ Max size: 10MB per file
- ✅ Order doesn't matter - backend processes all files regardless of order
- ✅ All files use the same field name `attachments`

**Format**: Each file is added as a separate entry with the same field name:
```
attachments: <file1.jpg>
attachments: <file2.png>
attachments: <file3.jpg>
```

**Implementation**:
```dart
formData.files.addAll(
  receiptFiles.map((file) => MapEntry('attachments', file)),
);
```

**Common Mistakes**:
- ❌ Using `attachment` (singular) - backend expects plural
- ❌ Using `attachments[]` (array notation) - backend expects exact name `attachments`
- ❌ Using different field names for different files
- ❌ Uploading non-image files (PDF, DOC, etc.) - backend validates mimetype

---

### 3. Payment Method Attachments (Optional)

**Field Names**: Payment method type names (exact match required)

**Type**: Single File per Payment Method

**Requirements**:
- ✅ Field name must match payment method type exactly
- ✅ One file per payment method
- ✅ Documents accepted (PDF, images, etc.)
- ✅ Max size: 20MB per file
- ✅ Field name must match the `method` value in JSON payload

**Payment Method Types** (field names):
- `bank_transfer` - Bank transfer payment method
- `telebirr` - Telebirr payment method
- `m_pesa` - M-Pesa payment method
- `check` - Check payment method
- `cash` - Cash payment method
- `other` - Other payment method

**Format**: Each payment method gets its own field name:
```
bank_transfer: <bank_receipt.pdf>
telebirr: <telebirr_screenshot.png>
m_pesa: <mpesa_receipt.jpg>
```

**Implementation**:
```dart
// paymentAttachmentFilePaths is Map<String, String>
// Key = payment method type (e.g., "bank_transfer")
// Value = file path
for (var entry in paymentAttachmentFilePaths.entries) {
  final paymentMethodType = entry.key; // e.g., "bank_transfer"
  final file = await MultipartFile.fromFile(entry.value);
  formData.files.add(MapEntry(paymentMethodType, file));
}
```

**Important**: The field name must match exactly the payment method type in the JSON payload:
```json
{
  "payment_methods": [
    {
      "method": "bank_transfer",  // ← This must match the FormData field name
      "amount": 500.00
    }
  ]
}
```

**Common Mistakes**:
- ❌ Using camelCase (`bankTransfer`) instead of snake_case (`bank_transfer`)
- ❌ Using different field name than the payment method type in JSON
- ❌ Uploading multiple files with the same payment method key (only first is used)
- ❌ Using index-based field names (`payment_attachments[0]`) instead of method type

---

## Complete Request Example

### FormData Structure

```
Content-Type: multipart/form-data; boundary=----WebKitFormBoundary...

------WebKitFormBoundary...
Content-Disposition: form-data; name="data"

{"metadata":{...},"data":{"transaction_type":"sale",...}}
------WebKitFormBoundary...
Content-Disposition: form-data; name="attachments"; filename="receipt1.jpg"
Content-Type: image/jpeg

[binary data]
------WebKitFormBoundary...
Content-Disposition: form-data; name="attachments"; filename="receipt2.png"
Content-Type: image/png

[binary data]
------WebKitFormBoundary...
Content-Disposition: form-data; name="bank_transfer"; filename="bank_receipt.pdf"
Content-Type: application/pdf

[binary data]
------WebKitFormBoundary...
Content-Disposition: form-data; name="telebirr"; filename="telebirr_screenshot.png"
Content-Type: image/png

[binary data]
------WebKitFormBoundary...--
```

### cURL Example

```bash
curl -X POST http://localhost:3000/api/transactions \
  -H "Authorization: Bearer YOUR_ACCESS_TOKEN" \
  -F "data={\"metadata\":{...},\"data\":{\"transaction_type\":\"sale\",\"customer_id\":123,\"items\":[{\"item_id\":1,\"batches\":[{\"batch_number\":\"BATCH001\",\"quantity\":10}]}],\"payment_methods\":[{\"method\":\"bank_transfer\",\"amount\":500.00}]}}" \
  -F "attachments=@/path/to/receipt1.jpg" \
  -F "attachments=@/path/to/receipt2.png" \
  -F "bank_transfer=@/path/to/bank_receipt.pdf" \
  -F "telebirr=@/path/to/telebirr_screenshot.png"
```

---

## Implementation Details

### Content-Type Header Handling

**CRITICAL**: The `Content-Type` header must be handled correctly:

1. **DO NOT** set `Content-Type: application/json` when sending FormData
2. **DO NOT** manually set `Content-Type: multipart/form-data`
3. **DO** let Dio automatically set the Content-Type with boundary

**Implementation in ApiService**:
```dart
// When FormData is detected, remove Content-Type header
// to let Dio set it automatically
if (wrappedData is FormData) {
  final existingHeaders = <String, dynamic>{};
  if (options?.headers != null) {
    for (var entry in options!.headers!.entries) {
      if (entry.key.toLowerCase() != 'content-type') {
        existingHeaders[entry.key] = entry.value;
      }
    }
  }
  finalOptions = (options ?? Options()).copyWith(
    headers: existingHeaders.isEmpty ? null : existingHeaders,
  );
}
```

**Why**: Dio automatically sets `Content-Type: multipart/form-data; boundary=...` when FormData is used. If we manually set `Content-Type: application/json`, it conflicts with FormData's contentType property.

---

### Field Name Mapping

| Purpose | Field Name | Count | File Type | Notes |
|---------|------------|-------|-----------|-------|
| JSON Payload | `data` | 1 | N/A | JSON string, wrapped with metadata |
| Transaction Attachments | `attachments` | 0-10 | Images only | Multiple files, same field name |
| Bank Transfer Attachment | `bank_transfer` | 0-1 | Documents | Matches payment method type |
| Telebirr Attachment | `telebirr` | 0-1 | Documents | Matches payment method type |
| M-Pesa Attachment | `m_pesa` | 0-1 | Documents | Matches payment method type |
| Check Attachment | `check` | 0-1 | Documents | Matches payment method type |
| Cash Attachment | `cash` | 0-1 | Documents | Matches payment method type |
| Other Attachment | `other` | 0-1 | Documents | Matches payment method type |

---

## Backend Processing

### 1. Transaction Attachments Processing
- All files with field name `attachments` are collected
- Each file is validated to be an image (mimetype starts with `image/`)
- Files are saved to `uploads/images/` directory
- File URLs are extracted and added to the `attachments` array in the response

### 2. Payment Method Attachments Processing
- Backend looks for files with field names matching payment method types
- For each payment method in JSON payload, if a file exists with matching field name:
  - File is processed and saved to `uploads/documents/` directory
  - File URL is automatically added to that payment method's `attachment` field
- **One file per payment method** - if multiple files are sent with the same key, only the first is used

### 3. Automatic Mapping
The backend automatically maps uploaded files to payment methods:

**Request**:
```json
{
  "payment_methods": [
    { "method": "bank_transfer", "amount": 500.00 }
  ]
}
```
**FormData**: `bank_transfer=@receipt.pdf`

**Response**:
```json
{
  "payment_methods": [
    {
      "method": "bank_transfer",
      "amount": 500.00,
      "attachment": "/uploads/documents/doc_bank_receipt_1234567890.pdf"
    }
  ]
}
```

---

## Validation Rules

### Transaction Attachments
- ✅ Must be images (JPEG, PNG, GIF, WebP, etc.)
- ✅ Max 10 files
- ✅ Max 10MB per file
- ✅ Field name must be exactly `attachments` (plural)

### Payment Method Attachments
- ✅ Any file type accepted (PDF, images, etc.)
- ✅ Max 20MB per file
- ✅ One file per payment method
- ✅ Field name must match payment method type exactly

### JSON Payload
- ✅ Must be valid JSON
- ✅ Must be wrapped with metadata
- ✅ Payment method types must match field names for attachments

---

## Common Errors & Solutions

### Error: "Invalid field name for transaction attachments"
**Cause**: Field name is not exactly `attachments` (plural)

**Solution**: Use exact field name `attachments` (not `attachment`, not `attachments[]`)

### Error: "Content-Type conflict"
**Cause**: Manually setting `Content-Type: application/json` when sending FormData

**Solution**: Remove Content-Type header and let Dio set it automatically

### Error: "Payment method attachment not found"
**Cause**: Field name doesn't match payment method type in JSON

**Solution**: Ensure field name matches exactly:
- JSON: `"method": "bank_transfer"` → FormData: `bank_transfer=@file.pdf`
- JSON: `"method": "m_pesa"` → FormData: `m_pesa=@file.jpg`

### Error: "Transaction attachments must be images"
**Cause**: Uploading non-image files (PDF, DOC, etc.) as transaction attachments

**Solution**: Only upload image files (JPEG, PNG, GIF, WebP) for transaction attachments

---

## Testing Checklist

- [ ] Content-Type is `multipart/form-data` (not `application/json`)
- [ ] JSON data field name is exactly `data`
- [ ] Transaction attachments use field name `attachments` (plural)
- [ ] Payment method attachments use payment method type as field name
- [ ] Payment method field names match JSON payload method values
- [ ] Transaction attachments are images only
- [ ] File sizes are within limits (10MB for attachments, 20MB for payment methods)
- [ ] Multiple transaction attachments use the same field name `attachments`
- [ ] Each payment method has at most one attachment file

---

## Response Format

On success, the backend returns:

```json
{
  "success": true,
  "data": {
    "id": 123,
    "transaction_number": "TXN-2025-001",
    "attachments": [
      "/uploads/images/img_receipt1_1234567890.jpg",
      "/uploads/images/img_receipt2_1234567890.png"
    ],
    "payment_methods": [
      {
        "id": 1,
        "method": "bank_transfer",
        "amount": 500.00,
        "attachment": "/uploads/documents/doc_bank_receipt_1234567890.pdf"
      },
      {
        "id": 2,
        "method": "telebirr",
        "amount": 300.00,
        "attachment": "/uploads/documents/doc_telebirr_screenshot_1234567890.png"
      }
    ]
  },
  "message": "Transaction created successfully"
}
```

---

## Summary

### Key Requirements
1. **Content-Type**: Let Dio set `multipart/form-data` automatically (don't set manually)
2. **JSON Field**: `data` (exact name, JSON string)
3. **Transaction Attachments**: `attachments` (plural, exact name, multiple files)
4. **Payment Attachments**: Payment method type as field name (e.g., `bank_transfer`, `telebirr`)
5. **Field Name Matching**: Payment method field names must match JSON payload method values

### Implementation Pattern
```dart
// 1. Create FormData
final formData = FormData();

// 2. Add JSON data
formData.fields.add(
  MapEntry('data', jsonEncode(wrappedData)),
);

// 3. Add transaction attachments (multiple files, same field name)
formData.files.addAll(
  receiptFiles.map((file) => MapEntry('attachments', file)),
);

// 4. Add payment method attachments (field name = payment method type)
for (var entry in paymentAttachmentFilePaths.entries) {
  final file = await MultipartFile.fromFile(entry.value);
  formData.files.add(MapEntry(entry.key, file)); // entry.key = payment method type
}

// 5. Send request (Content-Type handled automatically)
await ApiService.post(endpoint, data: formData, skipWrapping: true);
```

---

**Last Updated**: 2025-11-20
**Version**: 1.0


