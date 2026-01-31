# Image Upload Architecture Documentation

## Overview

This document describes the new image upload architecture implemented in the POS system. The system now uses a **dedicated upload endpoint** that handles all file uploads separately from business logic operations.

**Key Principle:** Upload files first → Get URLs → Send URLs in JSON payload

---

## Architecture Changes

### Before (Old Architecture)
- Files were sent as `multipart/form-data` along with business data
- Each endpoint had its own upload middleware
- Mixed concerns: file handling + business logic

### After (New Architecture)
- **Single dedicated upload endpoint:** `POST /api/uploads`
- Files are uploaded separately and return URLs
- Business endpoints accept URLs in JSON payloads
- Clean separation: upload logic isolated from business logic

---

## Upload Endpoint

### Endpoint
```
POST /api/uploads
```

### Authentication
- Requires: `Authorization: Bearer <token>`
- Requires: Active and verified user

### Request Format

**Content-Type:** `multipart/form-data`

**Field Name:** `files` (supports single or multiple files)

**Example (Single File):**
```http
POST /api/uploads
Content-Type: multipart/form-data
Authorization: Bearer <token>

files: <file>
```

**Example (Multiple Files):**
```http
POST /api/uploads
Content-Type: multipart/form-data
Authorization: Bearer <token>

files: <file1>
files: <file2>
files: <file3>
```

### Response Format

**Single File Response:**
```json
{
  "success": true,
  "data": {
    "url": "/uploads/images/img_photo_1234567890.jpg",
    "filename": "img_photo_1234567890.jpg",
    "size": 1024000,
    "mimetype": "image/jpeg",
    "type": "image"
  },
  "message": "File uploaded successfully"
}
```

**Multiple Files Response:**
```json
{
  "success": true,
  "data": {
    "files": [
      {
        "url": "/uploads/images/img_photo_1234567890.jpg",
        "filename": "img_photo_1234567890.jpg",
        "size": 1024000,
        "mimetype": "image/jpeg",
        "type": "image"
      },
      {
        "url": "/uploads/documents/doc_receipt_1234567891.pdf",
        "filename": "doc_receipt_1234567891.pdf",
        "size": 2048000,
        "mimetype": "application/pdf",
        "type": "document"
      }
    ]
  },
  "message": "Files uploaded successfully"
}
```

### File Type Detection

The system **automatically detects** file type from MIME type:

- **Images** (`image/*`):
  - Saved to: `uploads/images/`
  - Filename prefix: `img_`
  - Max size: **10MB**

- **Documents** (everything else):
  - Saved to: `uploads/documents/`
  - Filename prefix: `doc_`
  - Max size: **20MB**

### File Limits
- **Max file size:** 20MB per file
- **Max files per request:** 100 files
- **Supported formats:** All image and document types

---

## Feature-Specific Implementation

### 1. Profile Image Upload

#### Special Case: Direct Upload
Profile image upload is a **special case** that handles upload internally.

**Endpoint:**
```
PUT /api/user/profile-image
```

**Request Format:**
```http
PUT /api/user/profile-image
Content-Type: multipart/form-data
Authorization: Bearer <token>

image: <file>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "id": 1,
    "email": "user@example.com",
    "firstName": "John",
    "lastName": "Doe",
    "avatar": "/uploads/images/img_profile_1234567890.jpg",
    ...
  },
  "message": "Profile image updated successfully"
}
```

**Mobile App Implementation:**
```javascript
// Single API call - backend handles upload internally
const formData = new FormData();
formData.append('image', imageFile);

const response = await fetch('/api/user/profile-image', {
  method: 'PUT',
  headers: {
    'Authorization': `Bearer ${token}`
  },
  body: formData
});

const result = await response.json();
// result.data.avatar contains the URL
```

**Note:** This is the only endpoint that accepts files directly. All other features use the upload endpoint first.

---

### 2. Items Image Upload

#### Flow: Upload First, Then Create/Update

**Step 1: Upload Image**
```http
POST /api/uploads
Content-Type: multipart/form-data
Authorization: Bearer <token>

files: <imageFile>
```

**Response:**
```json
{
  "success": true,
  "data": {
    "url": "/uploads/images/img_item_1234567890.jpg",
    ...
  }
}
```

**Step 2: Create/Update Item with URL**
```http
POST /api/items
Content-Type: application/json
Authorization: Bearer <token>

{
  "metadata": {
    "requestId": "req_1234567890",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    "name": "Product Name",
    "description": "Product description",
    "categoryId": 1,
    "imageUrl": "/uploads/images/img_item_1234567890.jpg",
    ...
  }
}
```

**Mobile App Implementation:**
```javascript
// Step 1: Upload image
const uploadFormData = new FormData();
uploadFormData.append('files', imageFile);

const uploadResponse = await fetch('/api/uploads', {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${token}`
  },
  body: uploadFormData
});

const uploadResult = await uploadResponse.json();
const imageUrl = uploadResult.data.url; // or uploadResult.data.files[0].url for array

// Step 2: Create item with image URL
const itemPayload = {
  metadata: {
    requestId: generateRequestId(),
    type: 'mobile',
    version: '1.0.0'
  },
  data: {
    name: 'Product Name',
    description: 'Product description',
    categoryId: 1,
    imageUrl: imageUrl, // Use the URL from upload
    // ... other fields
  }
};

const itemResponse = await fetch('/api/items', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${token}`
  },
  body: JSON.stringify(itemPayload)
});
```

**Update Item:**
```javascript
// Same flow - upload first, then update with URL
const uploadResult = await uploadImage(imageFile);
const imageUrl = uploadResult.data.url;

const updatePayload = {
  metadata: { ... },
  data: {
    name: 'Updated Name',
    imageUrl: imageUrl, // Include URL in update payload
    // ... other fields to update
  }
};

await fetch(`/api/items/${itemId}`, {
  method: 'PUT',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${token}`
  },
  body: JSON.stringify(updatePayload)
});
```

**Important Notes:**
- `imageUrl` field accepts: `string`, `array of strings`, or can be omitted
- If no image, simply don't include `imageUrl` in the payload
- Multiple images: upload each file, collect URLs, send as array: `imageUrl: ["/uploads/...", "/uploads/..."]`

---

### 3. Transaction File Upload

#### Flow: Upload Files First, Then Create Transaction

Transactions can have:
1. **Transaction attachments** (images) - multiple files
2. **Payment method attachments** (documents) - one per payment method

**Step 1: Upload All Files**

```javascript
// Upload transaction attachments (images)
const attachmentUrls = [];
for (const file of transactionAttachments) {
  const formData = new FormData();
  formData.append('files', file);
  
  const response = await fetch('/api/uploads', {
    method: 'POST',
    headers: { 'Authorization': `Bearer ${token}` },
    body: formData
  });
  
  const result = await response.json();
  attachmentUrls.push(result.data.url);
}

// Upload payment method attachments (documents)
const paymentMethodAttachments = {};
for (const [method, file] of Object.entries(paymentMethodFiles)) {
  const formData = new FormData();
  formData.append('files', file);
  
  const response = await fetch('/api/uploads', {
    method: 'POST',
    headers: { 'Authorization': `Bearer ${token}` },
    body: formData
  });
  
  const result = await response.json();
  paymentMethodAttachments[method] = result.data.url;
}
```

**Step 2: Create Transaction with URLs**

```http
POST /api/transactions
Content-Type: application/json
Authorization: Bearer <token>

{
  "data": {
    "transactionType": "purchase",
    "supplierId": 1,
    "items": [...],
    "attachments": [
      "/uploads/images/img_attachment1_1234567890.jpg",
      "/uploads/images/img_attachment2_1234567891.jpg"
    ],
    "paymentMethods": [
      {
        "method": "bank_transfer",
        "amount": 1000.00,
        "attachment": "/uploads/documents/doc_bank_receipt_1234567892.pdf"
      },
      {
        "method": "cash",
        "amount": 500.00
      }
    ]
  }
}
```

**Mobile App Implementation:**
```javascript
// Step 1: Upload all files
const uploadPromises = [];

// Upload transaction attachments
transactionAttachments.forEach(file => {
  const formData = new FormData();
  formData.append('files', file);
  uploadPromises.push(
    fetch('/api/uploads', {
      method: 'POST',
      headers: { 'Authorization': `Bearer ${token}` },
      body: formData
    }).then(r => r.json())
  );
});

// Upload payment method files
Object.entries(paymentMethodFiles).forEach(([method, file]) => {
  const formData = new FormData();
  formData.append('files', file);
  uploadPromises.push(
    fetch('/api/uploads', {
      method: 'POST',
      headers: { 'Authorization': `Bearer ${token}` },
      body: formData
    }).then(r => r.json().then(result => ({ method, url: result.data.url })))
  );
});

const uploadResults = await Promise.all(uploadPromises);

// Extract URLs
const attachmentUrls = uploadResults
  .filter(r => !r.method) // Transaction attachments
  .map(r => r.data.url);

const paymentMethodUrls = uploadResults
  .filter(r => r.method) // Payment method attachments
  .reduce((acc, r) => {
    acc[r.method] = r.url;
    return acc;
  }, {});

// Step 2: Create transaction
const transactionPayload = {
  data: {
    transactionType: 'purchase',
    supplierId: 1,
    items: [...],
    attachments: attachmentUrls,
    paymentMethods: paymentMethods.map(pm => ({
      ...pm,
      attachment: paymentMethodUrls[pm.method] || undefined
    }))
  }
};

await fetch('/api/transactions', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${token}`
  },
  body: JSON.stringify(transactionPayload)
});
```

**Payment Method Field Names:**
- Use **camelCase** in JSON: `bankTransfer`, `mPesa`, `telebirr`, `check`, `cash`, `other`
- Backend will normalize to snake_case internally

---

## Migration Guide for Mobile App

### What Changed

#### ❌ OLD WAY (No Longer Supported)
```javascript
// ❌ DON'T DO THIS ANYMORE
const formData = new FormData();
formData.append('image', imageFile);
formData.append('data', JSON.stringify(itemData));

await fetch('/api/items', {
  method: 'POST',
  body: formData
});
```

#### ✅ NEW WAY (Current Implementation)
```javascript
// ✅ DO THIS
// 1. Upload file first
const uploadFormData = new FormData();
uploadFormData.append('files', imageFile);

const uploadResponse = await fetch('/api/uploads', {
  method: 'POST',
  headers: { 'Authorization': `Bearer ${token}` },
  body: uploadFormData
});

const { data } = await uploadResponse.json();
const imageUrl = data.url; // or data.files[0].url for multiple

// 2. Send JSON with URL
await fetch('/api/items', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${token}`
  },
  body: JSON.stringify({
    metadata: { requestId: '...', type: 'mobile', version: '1.0.0' },
    data: {
      ...itemData,
      imageUrl: imageUrl
    }
  })
});
```

### Request Data Format Changes

#### Items (Create/Update)

**Before:**
- Mixed `multipart/form-data` with file and data

**After:**
- **Upload endpoint:** `multipart/form-data` with `files` field
- **Item endpoint:** `application/json` with `imageUrl` field (string or array)

**Payload Structure:**
```json
{
  "metadata": {
    "requestId": "unique-request-id",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    "name": "Item Name",
    "imageUrl": "/uploads/images/img_123.jpg"  // or ["/uploads/...", "/uploads/..."]
  }
}
```

#### Transactions (Create)

**Before:**
- Mixed `multipart/form-data` with files and JSON data

**After:**
- **Upload endpoint:** `multipart/form-data` with `files` field (multiple calls if needed)
- **Transaction endpoint:** `application/json` with URL arrays

**Payload Structure:**
```json
{
  "data": {
    "transactionType": "purchase",
    "attachments": ["/uploads/images/img1.jpg", "/uploads/images/img2.jpg"],
    "paymentMethods": [
      {
        "method": "bank_transfer",
        "amount": 1000.00,
        "attachment": "/uploads/documents/doc_receipt.pdf"
      }
    ]
  }
}
```

#### Profile Image (Update)

**No Change Required:**
- Still uses `PUT /api/user/profile-image` with `multipart/form-data`
- Field name: `image`
- Backend handles upload internally

---

## Error Handling

### Upload Endpoint Errors

**File Too Large:**
```json
{
  "success": false,
  "error": {
    "message": "File too large. Maximum size allowed is 10MB",
    "statusCode": 400,
    "type": "VALIDATION_ERROR"
  }
}
```

**No Files Provided:**
```json
{
  "success": false,
  "error": {
    "message": "No files provided",
    "statusCode": 400,
    "type": "VALIDATION_ERROR"
  }
}
```

### Business Endpoint Errors

**Invalid Image URL:**
```json
{
  "success": false,
  "error": {
    "message": "\"imageUrl\" must be one of [string, array]",
    "statusCode": 400,
    "type": "VALIDATION_ERROR"
  }
}
```

---

## Best Practices for Mobile App

### 1. Upload Files in Parallel
```javascript
// Upload multiple files concurrently
const uploadPromises = files.map(file => {
  const formData = new FormData();
  formData.append('files', file);
  return fetch('/api/uploads', { ... });
});

const results = await Promise.all(uploadPromises);
```

### 2. Handle Upload Errors Gracefully
```javascript
try {
  const uploadResponse = await uploadFile(file);
  const imageUrl = uploadResponse.data.url;
  // Proceed with business operation
} catch (error) {
  // Handle upload error - don't proceed with business operation
  showError('Failed to upload image');
}
```

### 3. Show Upload Progress
```javascript
// Use XMLHttpRequest for progress tracking
const xhr = new XMLHttpRequest();
xhr.upload.addEventListener('progress', (e) => {
  const percent = (e.loaded / e.total) * 100;
  updateProgressBar(percent);
});

xhr.open('POST', '/api/uploads');
xhr.setRequestHeader('Authorization', `Bearer ${token}`);
xhr.send(formData);
```

### 4. Cache Uploaded URLs
```javascript
// If user cancels after upload, you may want to clean up
// Store uploaded URLs temporarily until business operation succeeds
let uploadedUrls = [];

try {
  const url = await uploadFile(file);
  uploadedUrls.push(url);
  
  await createItem({ ...itemData, imageUrl: url });
  uploadedUrls = []; // Clear on success
} catch (error) {
  // Optionally: Implement cleanup endpoint to delete unused files
  // For now, files remain on server (can be cleaned up later)
}
```

---

## Summary

### Key Points
1. **Single upload endpoint:** `POST /api/uploads` for all file types
2. **Auto-detection:** System detects image vs document from MIME type
3. **Two-step process:** Upload → Get URL → Send URL in JSON
4. **Profile exception:** Profile image endpoint handles upload internally
5. **Clean separation:** Upload logic separate from business logic

### Request Format Summary

| Feature | Upload Endpoint | Business Endpoint | Image Field |
|---------|----------------|-------------------|-------------|
| **Profile** | N/A (internal) | `PUT /api/user/profile-image` | `image` (multipart) |
| **Items** | `POST /api/uploads` | `POST/PUT /api/items` | `imageUrl` (JSON) |
| **Transactions** | `POST /api/uploads` | `POST /api/transactions` | `attachments` + `paymentMethods[].attachment` (JSON) |

### Migration Checklist
- [ ] Update item create/update to use upload endpoint first
- [ ] Update transaction create to upload files separately
- [ ] Change request format from `multipart/form-data` to `application/json` for business endpoints
- [ ] Include `imageUrl` / `attachments` / `attachment` fields in JSON payloads
- [ ] Handle upload errors before proceeding with business operations
- [ ] Test with single and multiple file uploads

---

## Support

For questions or issues, contact the backend team or refer to:
- API Documentation: `http://localhost:5001/api-docs`
- Health Check: `http://localhost:5001/api/health`





