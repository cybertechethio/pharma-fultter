# Company API Documentation

## Overview

This document describes the company API endpoints for managing company information and settings.

---

## 1. GET COMPANY BY ID

### GET /api/company/:companyId

**Description:** Get company information by ID

**Authentication Required:** ✅ Yes (Active User)

**Response:**
```json
{
  "success": true,
  "message": "Company retrieved successfully",
  "data": {
    "id": 1,
    "name": "Company Name",
    "ownerId": 100,
    "isActive": true,
    "createdAt": "2024-01-15T10:30:00Z",
    "createdBy": null,
    "updatedBy": null,
    "phone1": "+251912345678" | null,
    "phone2": "+251912345679" | null,
    "logoUrl": "https://example.com/logo.png" | null,
    "tinNumber": "TIN123456" | null,
    "tradeName": "Trade Name" | null,
    "city": "Addis Ababa" | null,
    "wereda": "Wereda Name" | null,
    "autoPrint": false,
    "defaultStartDate": "2024-01-01T00:00:00Z" | null
  }
}
```

**Error Responses:**
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive
- `404 Not Found` - Company not found or access denied
- `500 Internal Server Error` - Server error

---

## 2. UPDATE COMPANY

### PUT /api/company/:companyId

**Description:** Update company information

**Authentication Required:** ✅ Yes (Active User)

**Request:**
```json
{
  "name": "Updated Company Name" | undefined,
  "phone1": "+251912345680" | null | undefined,
  "phone2": "+251912345681" | null | undefined,
  "logoUrl": "https://example.com/new-logo.png" | null | undefined,
  "tinNumber": "TIN123457" | null | undefined,
  "tradeName": "Updated Trade Name" | null | undefined,
  "city": "Updated City" | null | undefined,
  "wereda": "Updated Wereda" | null | undefined,
  "autoPrint": true | undefined,
  "defaultStartDate": "2024-01-01T00:00:00Z" | null | undefined
}
```

**Field Descriptions:**

- `name` (O) - Company name (1-100 characters, must be unique for owner)
- `phone1` (O) - Primary phone number
- `phone2` (O) - Secondary phone number
- `logoUrl` (O) - Company logo URL
- `tinNumber` (O) - Tax Identification Number
- `tradeName` (O) - Trade name (max 100 characters)
- `city` (O) - City name (max 100 characters)
- `wereda` (O) - Wereda name (max 100 characters)
- `autoPrint` (O) - Auto print setting (boolean)
- `defaultStartDate` (O) - Default start date for reports (ISO format)

**Important Notes:**

1. **Name Uniqueness**: Company name must be unique for the owner
2. **All Fields Optional**: All fields are optional - only provided fields will be updated
3. **At Least One Field**: At least one field must be provided

**Validation Rules:**

- `name` must be unique for the company owner (if provided)
- All string fields have maximum length limits
- `defaultStartDate` must be a valid date if provided

**Response:**
```json
{
  "success": true,
  "message": "Company updated successfully",
  "data": {
    "id": 1,
    "name": "Updated Company Name",
    "ownerId": 100,
    "isActive": true,
    "createdAt": "2024-01-15T10:30:00Z",
    "createdBy": null,
    "updatedBy": 1,
    "phone1": "+251912345680",
    "phone2": "+251912345681",
    "logoUrl": "https://example.com/new-logo.png",
    "tinNumber": "TIN123457",
    "tradeName": "Updated Trade Name",
    "city": "Updated City",
    "wereda": "Updated Wereda",
    "autoPrint": true,
    "defaultStartDate": "2024-01-01T00:00:00Z"
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error or no fields provided
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive
- `404 Not Found` - Company not found or access denied
- `409 Conflict` - Company name already exists
- `500 Internal Server Error` - Server error

---

## 3. GET COMPANY SETTINGS

### GET /api/company/setting

**Description:** Get current company settings (uses user's current company)

**Authentication Required:** ✅ Yes (Active User)

**Response:**
```json
{
  "success": true,
  "message": "Company settings retrieved successfully",
  "data": {
    "id": 1,
    "name": "Company Name",
    "ownerId": 100,
    "isActive": true,
    "createdAt": "2024-01-15T10:30:00Z",
    "createdBy": null,
    "updatedBy": null,
    "phone1": "+251912345678" | null,
    "phone2": "+251912345679" | null,
    "logoUrl": "https://example.com/logo.png" | null,
    "tinNumber": "TIN123456" | null,
    "tradeName": "Trade Name" | null,
    "city": "Addis Ababa" | null,
    "wereda": "Wereda Name" | null,
    "autoPrint": false,
    "defaultStartDate": "2024-01-01T00:00:00Z" | null
  }
}
```

**Error Responses:**
- `400 Bad Request` - User must have an active company
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive
- `500 Internal Server Error` - Server error

---

## 4. UPDATE COMPANY SETTINGS

### PUT /api/company/setting

**Description:** Update current company settings (uses user's current company)

**Authentication Required:** ✅ Yes (Active User)

**Request:**
```json
{
  "name": "Updated Company Name" | undefined,
  "phone1": "+251912345680" | null | undefined,
  "phone2": "+251912345681" | null | undefined,
  "logoUrl": "https://example.com/new-logo.png" | null | undefined,
  "tinNumber": "TIN123457" | null | undefined,
  "tradeName": "Updated Trade Name" | null | undefined,
  "city": "Updated City" | null | undefined,
  "wereda": "Updated Wereda" | null | undefined,
  "autoPrint": true | undefined,
  "defaultStartDate": "2024-01-01T00:00:00Z" | null | undefined
}
```

**Field Descriptions:**

- Same as Update Company endpoint
- All fields are optional - only provided fields will be updated
- At least one field must be provided

**Response:**
```json
{
  "success": true,
  "message": "Company settings updated successfully",
  "data": {
    "id": 1,
    "name": "Updated Company Name",
    "ownerId": 100,
    "isActive": true,
    "createdAt": "2024-01-15T10:30:00Z",
    "createdBy": null,
    "updatedBy": 1,
    "phone1": "+251912345680",
    "phone2": "+251912345681",
    "logoUrl": "https://example.com/new-logo.png",
    "tinNumber": "TIN123457",
    "tradeName": "Updated Trade Name",
    "city": "Updated City",
    "wereda": "Updated Wereda",
    "autoPrint": true,
    "defaultStartDate": "2024-01-01T00:00:00Z"
  }
}
```

**Error Responses:**
- `400 Bad Request` - Validation error, no fields provided, or user must have an active company
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Account inactive
- `404 Not Found` - Company not found or access denied
- `409 Conflict` - Company name already exists
- `500 Internal Server Error` - Server error

---

## Notes

1. **Company Access**: Users can only access companies they have access to (via UserAccess)

2. **Settings Endpoints**: 
   - `/setting` endpoints automatically use the user's current company
   - No need to specify company ID

3. **Name Uniqueness**: Company name must be unique for the owner (not globally unique)

4. **Company Settings Fields**:
   - `autoPrint`: Controls automatic printing behavior
   - `defaultStartDate`: Default start date for reports and date filters

5. **Contact Information**:
   - `phone1`: Primary phone number
   - `phone2`: Secondary phone number (optional)
   - `logoUrl`: Company logo URL (optional)

6. **Business Information**:
   - `tinNumber`: Tax Identification Number (optional)
   - `tradeName`: Trade name (optional)
   - `city`: City name (optional)
   - `wereda`: Wereda name (optional)

7. **Update Behavior**: 
   - All fields are optional
   - Only provided fields are updated
   - Null values are allowed for optional fields

8. **Owner ID**: Company owner ID cannot be changed through update endpoints
