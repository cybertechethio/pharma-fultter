# Role Management API Documentation

## Overview

This document provides comprehensive API documentation for the Role Management system. It includes all CRUD operations for roles, permissions fetching, and branch role assignments. This documentation is intended for the Flutter mobile app development team.

## Base URL

All endpoints are relative to the base API URL. The base URL should be configured in your API client.

```
Base URL: /api/v1 (or your configured base path)
```

## Authentication

All endpoints require authentication. Include the JWT token in the Authorization header:

```
Authorization: Bearer <your_jwt_token>
```

**Required Middleware:**
- `authenticateToken` - Validates JWT token
- `requireActiveUser` - Ensures user is active
- `requireVerifiedUser` - Ensures user account is verified

---

## Table of Contents

1. [Permissions API](#permissions-api)
2. [Company Roles API](#company-roles-api)
3. [Branch Roles API](#branch-roles-api)
4. [Error Responses](#error-responses)
5. [Request/Response Format](#requestresponse-format)

---

## Permissions API

### 1. Get All Permissions

Fetch all available permissions grouped by category.

**Endpoint:** `GET /permissions`

**Query Parameters:**
- `page` (optional): Page number (default: 1)
- `limit` (optional): Items per page (default: 25)
- `search` (optional): Search term to filter permissions by name

**Request Example:**
```http
GET /permissions?page=1&limit=1000&search=user
Authorization: Bearer <token>
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Permissions fetched successfully",
  "data": {
    "user_management": [
      {
        "id": 1,
        "name": "users.read",
        "description": "View user information and profiles",
        "category": "user_management",
        "isActive": true,
        "createdAt": "2024-01-01T00:00:00.000Z",
        "createdBy": 1
      },
      {
        "id": 2,
        "name": "users.create",
        "description": "Create new user accounts",
        "category": "user_management",
        "isActive": true,
        "createdAt": "2024-01-01T00:00:00.000Z",
        "createdBy": 1
      }
    ],
    "company_management": [
      {
        "id": 5,
        "name": "companies.read",
        "description": "View company information",
        "category": "company_management",
        "isActive": true,
        "createdAt": "2024-01-01T00:00:00.000Z",
        "createdBy": 1
      }
    ]
  },
  "pagination": {
    "currentPage": 1,
    "itemsPerPage": 1000,
    "totalItems": 300,
    "totalPages": 1
  }
}
```

**Response Structure:**
- The response groups permissions by category (e.g., `user_management`, `company_management`)
- Each permission object contains:
  - `id`: Unique permission ID
  - `name`: Permission name (e.g., "users.read")
  - `description`: Human-readable description
  - `category`: Permission category
  - `isActive`: Whether the permission is active
  - `createdAt`: Creation timestamp
  - `createdBy`: User ID who created the permission

**Flutter Implementation Note:**
The API returns permissions grouped by category. You may need to flatten this structure:

```dart
// Example: Flatten grouped permissions
Map<String, List<Permission>> groupedPermissions = response.data;
List<Permission> allPermissions = groupedPermissions.values
    .expand((permissions) => permissions)
    .toList();
```

---

### 2. Get Permission by ID

Fetch a single permission by its ID.

**Endpoint:** `GET /permissions/:id`

**Path Parameters:**
- `id` (required): Permission ID

**Request Example:**
```http
GET /permissions/1
Authorization: Bearer <token>
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Permission retrieved successfully",
  "data": {
    "name": "users.read",
    "description": "View user information and profiles",
    "isActive": true,
    "metadata": {}
  }
}
```

---

## Company Roles API

Company roles are roles that belong to a specific company. Only company owners can manage these roles.

### 1. Get All Company Roles

Fetch all roles for the authenticated user's company.

**Endpoint:** `GET /roles/company`

**Query Parameters:**
- `page` (optional): Page number (default: 1)
- `limit` (optional): Items per page (default: 25)
- `search` (optional): Search term to filter roles by name
- `includePermissions` (optional): Include permission details (default: "true")

**Request Example:**
```http
GET /roles/company?page=1&limit=25&search=admin&includePermissions=true
Authorization: Bearer <token>
```

**Success Response (200 OK) - With Permissions:**
```json
{
  "success": true,
  "message": "Company roles fetched successfully",
  "data": [
    {
      "id": 1,
      "name": "Administrator",
      "description": "Full system access",
      "companyId": 1,
      "isActive": true,
      "createdAt": "2024-01-01T00:00:00.000Z",
      "updatedAt": "2024-01-01T00:00:00.000Z",
      "permissions": [
        {
          "id": 1,
          "description": "View user information and profiles"
        },
        {
          "id": 2,
          "description": "Create new user accounts"
        }
      ]
    },
    {
      "id": 2,
      "name": "Manager",
      "description": "Management role with limited access",
      "companyId": 1,
      "isActive": true,
      "createdAt": "2024-01-01T00:00:00.000Z",
      "updatedAt": "2024-01-01T00:00:00.000Z",
      "permissions": [
        {
          "id": 1,
          "description": "View user information and profiles"
        }
      ]
    }
  ],
  "pagination": {
    "currentPage": 1,
    "itemsPerPage": 25,
    "totalItems": 50,
    "totalPages": 2
  }
}
```

**Success Response (200 OK) - Without Permissions (`includePermissions=false`):**
```json
{
  "success": true,
  "message": "Company roles fetched successfully",
  "data": [
    {
      "id": 1,
      "name": "Administrator",
      "description": "Full system access",
      "companyId": 1,
      "isActive": true,
      "createdAt": "2024-01-01T00:00:00.000Z",
      "updatedAt": "2024-01-01T00:00:00.000Z"
    }
  ],
  "pagination": {
    "currentPage": 1,
    "itemsPerPage": 25,
    "totalItems": 50,
    "totalPages": 2
  }
}
```

**Response Fields:**
- `id`: Role ID
- `name`: Role name
- `description`: Role description (can be null)
- `companyId`: Company ID the role belongs to
- `isActive`: Whether the role is active
- `createdAt`: Creation timestamp
- `updatedAt`: Last update timestamp
- `permissions` (if `includePermissions=true`): Array of permission objects with `id` and `description`

---

### 2. Get Role by ID

Fetch a single role with its permissions.

**Endpoint:** `GET /roles/company/:id`

**Path Parameters:**
- `id` (required): Role ID

**Request Example:**
```http
GET /roles/company/1
Authorization: Bearer <token>
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Role fetched successfully",
  "data": {
    "id": 1,
    "name": "Administrator",
    "description": "Full system access",
    "companyId": 1,
    "isActive": true,
    "createdAt": "2024-01-01T00:00:00.000Z",
    "updatedAt": "2024-01-01T00:00:00.000Z",
    "permissions": [
      {
        "id": 1,
        "description": "View user information and profiles"
      },
      {
        "id": 2,
        "description": "Create new user accounts"
      },
      {
        "id": 3,
        "description": "Update user information and profiles"
      },
      {
        "id": 4,
        "description": "Delete user accounts"
      }
    ]
  }
}
```

---

### 3. Create Role

Create a new role for the company.

**Endpoint:** `POST /roles/company`

**Request Body:**
```json
{
  "metadata": {
    "requestId": "uuid-here",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    "name": "Sales Manager",
    "description": "Manages sales operations",
    "permissionIds": [1, 2, 5, 10],
    "isActive": true
  }
}
```

**Request Fields:**
- `metadata` (required): Request metadata
  - `requestId`: Unique request identifier (UUID recommended)
  - `type`: Request type (e.g., "mobile", "web")
  - `version`: API version
- `data` (required): Role data
  - `name` (required): Role name (1-100 characters)
  - `description` (optional): Role description
  - `permissionIds` (optional): Array of permission IDs (default: [])
  - `isActive` (optional): Whether role is active (default: true)

**Request Example:**
```http
POST /roles/company
Authorization: Bearer <token>
Content-Type: application/json

{
  "metadata": {
    "requestId": "550e8400-e29b-41d4-a716-446655440000",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    "name": "Sales Manager",
    "description": "Manages sales operations",
    "permissionIds": [1, 2, 5, 10],
    "isActive": true
  }
}
```

**Success Response (201 Created):**
```json
{
  "success": true,
  "message": "Role created successfully",
  "data": {
    "id": 3,
    "name": "Sales Manager",
    "description": "Manages sales operations",
    "companyId": 1,
    "isActive": true,
    "createdAt": "2024-01-15T10:30:00.000Z",
    "updatedAt": "2024-01-15T10:30:00.000Z"
  }
}
```

**Validation Rules:**
- `name`: Required, 1-100 characters, must be unique within the company
- `permissionIds`: Array of valid permission IDs (invalid IDs will cause validation error)
- `description`: Optional, can be null or empty string

**Error Responses:**
- `400 Bad Request`: Validation error (e.g., invalid name length, invalid permission IDs)
- `409 Conflict`: Role name already exists in the company
- `403 Forbidden`: User is not the company owner

---

### 4. Update Role

Update an existing role.

**Endpoint:** `PUT /roles/company/:id`

**Path Parameters:**
- `id` (required): Role ID

**Request Body:**
```json
{
  "metadata": {
    "requestId": "uuid-here",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    "name": "Senior Sales Manager",
    "description": "Updated description",
    "permissionIds": [1, 2, 5, 10, 15],
    "isActive": true
  }
}
```

**Request Fields:**
All fields in `data` are optional, but at least one field must be provided:
- `name` (optional): Role name (1-100 characters)
- `description` (optional): Role description (can be null)
- `permissionIds` (optional): Array of permission IDs
- `isActive` (optional): Whether role is active

**Request Example:**
```http
PUT /roles/company/3
Authorization: Bearer <token>
Content-Type: application/json

{
  "metadata": {
    "requestId": "550e8400-e29b-41d4-a716-446655440001",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    "name": "Senior Sales Manager",
    "permissionIds": [1, 2, 5, 10, 15]
  }
}
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Role updated successfully",
  "data": {
    "id": 3,
    "name": "Senior Sales Manager",
    "description": "Manages sales operations",
    "companyId": 1,
    "isActive": true,
    "createdAt": "2024-01-15T10:30:00.000Z",
    "updatedAt": "2024-01-15T11:45:00.000Z"
  }
}
```

**Error Responses:**
- `400 Bad Request`: Validation error
- `404 Not Found`: Role not found
- `409 Conflict`: Role name already exists (if updating name)
- `403 Forbidden`: Role does not belong to the company or user is not company owner

---

### 5. Delete Role

Delete a single role.

**Endpoint:** `DELETE /roles/company/:id`

**Path Parameters:**
- `id` (required): Role ID

**Request Example:**
```http
DELETE /roles/company/3
Authorization: Bearer <token>
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Role deleted successfully",
  "data": {
    "id": 3,
    "name": "Senior Sales Manager",
    "description": "Manages sales operations",
    "companyId": 1,
    "isActive": true,
    "createdAt": "2024-01-15T10:30:00.000Z",
    "updatedAt": "2024-01-15T11:45:00.000Z"
  }
}
```

**Error Responses:**
- `404 Not Found`: Role not found
- `403 Forbidden`: Role does not belong to the company or user is not company owner

---

### 6. Delete Multiple Roles (Bulk Delete)

Delete multiple roles at once.

**Endpoint:** `DELETE /roles/company/bulk`

**Request Body:**
```json
{
  "metadata": {
    "requestId": "uuid-here",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    "roleIds": [3, 4, 5]
  }
}
```

**Request Fields:**
- `metadata` (required): Request metadata
- `data` (required): Delete data
  - `roleIds` (required): Array of role IDs to delete (minimum 1 ID)

**Request Example:**
```http
DELETE /roles/company/bulk
Authorization: Bearer <token>
Content-Type: application/json

{
  "metadata": {
    "requestId": "550e8400-e29b-41d4-a716-446655440002",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    "roleIds": [3, 4, 5]
  }
}
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "3 roles deleted successfully",
  "data": {
    "data": [
      {
        "id": 3,
        "name": "Senior Sales Manager",
        "description": "Manages sales operations",
        "companyId": 1,
        "isActive": true,
        "createdAt": "2024-01-15T10:30:00.000Z",
        "updatedAt": "2024-01-15T11:45:00.000Z"
      },
      {
        "id": 4,
        "name": "Cashier",
        "description": "Handles transactions",
        "companyId": 1,
        "isActive": true,
        "createdAt": "2024-01-15T10:30:00.000Z",
        "updatedAt": "2024-01-15T10:30:00.000Z"
      },
      {
        "id": 5,
        "name": "Stock Keeper",
        "description": "Manages inventory",
        "companyId": 1,
        "isActive": true,
        "createdAt": "2024-01-15T10:30:00.000Z",
        "updatedAt": "2024-01-15T10:30:00.000Z"
      }
    ]
  }
}
```

**Error Responses:**
- `400 Bad Request`: Invalid role IDs or empty array
- `404 Not Found`: One or more roles not found
- `403 Forbidden`: One or more roles do not belong to the company

---

## Branch Roles API

Branch roles are role assignments for users in specific branches. These endpoints manage which roles a user has in which branches.

### 1. Assign Branch Roles to User

Assign roles to a user in one or more branches.

**Endpoint:** `POST /roles/company/branches/users/roles`

**Request Body:**
```json
{
  "metadata": {
    "requestId": "uuid-here",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    "userId": 10,
    "assignments": [
      {
        "branchId": 1,
        "roleIds": [1, 2]
      },
      {
        "branchId": 2,
        "roleIds": [1, 3]
      }
    ]
  }
}
```

**Request Fields:**
- `metadata` (required): Request metadata
- `data` (required): Assignment data
  - `userId` (required): User ID to assign roles to
  - `assignments` (required): Array of branch assignments
    - `branchId` (required): Branch ID
    - `roleIds` (required): Array of role IDs to assign to the user in this branch

**Request Example:**
```http
POST /roles/company/branches/users/roles
Authorization: Bearer <token>
Content-Type: application/json

{
  "metadata": {
    "requestId": "550e8400-e29b-41d4-a716-446655440003",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    "userId": 10,
    "assignments": [
      {
        "branchId": 1,
        "roleIds": [1, 2]
      },
      {
        "branchId": 2,
        "roleIds": [1, 3]
      }
    ]
  }
}
```

**Success Response (201 Created):**
```json
{
  "success": true,
  "message": "User roles saved successfully",
  "data": [
    {
      "branchId": 1,
      "branchName": "Main Branch",
      "roles": [
        {
          "id": 1,
          "name": "Administrator"
        },
        {
          "id": 2,
          "name": "Manager"
        }
      ]
    },
    {
      "branchId": 2,
      "branchName": "Secondary Branch",
      "roles": [
        {
          "id": 1,
          "name": "Administrator"
        },
        {
          "id": 3,
          "name": "Cashier"
        }
      ]
    }
  ],
  "totals": {
    "groups": 2,
    "roles": 4
  },
  "summary": {
    "processedGroups": 2,
    "rolesAssigned": 4,
    "rolesRemoved": 0,
    "failed": 0
  },
  "errors": []
}
```

**Partial Success Response (201 Created):**
If some assignments fail, the response includes errors:

```json
{
  "success": true,
  "message": "User roles saved with partial errors",
  "data": [
    {
      "branchId": 1,
      "branchName": "Main Branch",
      "roles": [
        {
          "id": 1,
          "name": "Administrator"
        }
      ]
    }
  ],
  "totals": {
    "groups": 1,
    "roles": 1
  },
  "summary": {
    "processedGroups": 1,
    "rolesAssigned": 1,
    "rolesRemoved": 0,
    "failed": 1
  },
  "errors": [
    {
      "branchId": 2,
      "error": "Branch not found or inactive"
    }
  ]
}
```

**Response Fields:**
- `data`: Array of branch groups with assigned roles
- `totals`: Summary totals
  - `groups`: Number of branch groups
  - `roles`: Total number of roles assigned
- `summary`: Operation summary
  - `processedGroups`: Number of branches processed
  - `rolesAssigned`: Number of roles assigned
  - `rolesRemoved`: Number of roles removed (if any)
  - `failed`: Number of failed assignments
- `errors`: Array of error objects for failed assignments

**Error Responses:**
- `400 Bad Request`: Missing userId or assignments
- `403 Forbidden`: User is not company owner or user doesn't have access to branch
- `404 Not Found`: User, branch, or role not found

---

### 2. Get User Roles (All Branches)

Get all roles assigned to a user across all branches.

**Endpoint:** `GET /roles/company/users/:userId/roles`

**Path Parameters:**
- `userId` (required): User ID

**Request Example:**
```http
GET /roles/company/users/10/roles
Authorization: Bearer <token>
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "User roles fetched successfully",
  "data": [
    {
      "branchId": 1,
      "branchName": "Main Branch",
      "roles": [
        {
          "id": 1,
          "name": "Administrator"
        },
        {
          "id": 2,
          "name": "Manager"
        }
      ]
    },
    {
      "branchId": 2,
      "branchName": "Secondary Branch",
      "roles": [
        {
          "id": 1,
          "name": "Administrator"
        },
        {
          "id": 3,
          "name": "Cashier"
        }
      ]
    }
  ]
}
```

---

### 3. Get User Roles in Specific Branch

Get roles assigned to a user in a specific branch.

**Endpoint:** `GET /roles/company/branches/:branchId/users/:userId/roles`

**Path Parameters:**
- `branchId` (required): Branch ID
- `userId` (required): User ID

**Request Example:**
```http
GET /roles/company/branches/1/users/10/roles
Authorization: Bearer <token>
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "User roles fetched successfully",
  "data": [
    {
      "branchId": 1,
      "branchName": "Main Branch",
      "roles": [
        {
          "id": 1,
          "name": "Administrator"
        },
        {
          "id": 2,
          "name": "Manager"
        }
      ]
    }
  ]
}
```

**Error Responses:**
- `404 Not Found`: User does not have any roles in this branch

---

### 4. Assign Single Role to User in Branch

Assign a single role to a user in a specific branch.

**Endpoint:** `POST /roles/company/branches/:branchId/users/:userId/roles`

**Path Parameters:**
- `branchId` (required): Branch ID
- `userId` (required): User ID

**Request Body:**
```json
{
  "metadata": {
    "requestId": "uuid-here",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    "roleId": 1
  }
}
```

**Request Fields:**
- `metadata` (required)`: Request metadata
- `data` (required)`: Assignment data
  - `roleId` (required): Role ID to assign

**Request Example:**
```http
POST /roles/company/branches/1/users/10/roles
Authorization: Bearer <token>
Content-Type: application/json

{
  "metadata": {
    "requestId": "550e8400-e29b-41d4-a716-446655440004",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    "roleId": 1
  }
}
```

**Success Response (201 Created):**
```json
{
  "success": true,
  "message": "Role assigned to user in branch successfully",
  "data": {
    "branchId": 1,
    "branchName": "Main Branch",
    "roles": [
      {
        "id": 1,
        "name": "Administrator"
      }
    ]
  }
}
```

---

### 5. Remove Role from User in Branch

Remove a specific role from a user in a branch.

**Endpoint:** `DELETE /roles/company/branches/:branchId/users/:userId/roles/:roleId`

**Path Parameters:**
- `branchId` (required): Branch ID
- `userId` (required): User ID
- `roleId` (required): Role ID to remove

**Request Example:**
```http
DELETE /roles/company/branches/1/users/10/roles/2
Authorization: Bearer <token>
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Role removed from user in branch successfully",
  "data": null
}
```

**Error Responses:**
- `404 Not Found`: User does not have this role in the specified branch

---

### 6. Get All Roles in a Branch

Get all users and their roles in a specific branch.

**Endpoint:** `GET /roles/company/branches/:branchId/roles`

**Path Parameters:**
- `branchId` (required): Branch ID

**Request Example:**
```http
GET /roles/company/branches/1/roles
Authorization: Bearer <token>
```

**Success Response (200 OK):**
```json
{
  "success": true,
  "message": "Roles fetched successfully",
  "data": [
    {
      "branchId": 1,
      "branchName": "Main Branch",
      "users": [
        {
          "userId": 10,
          "user": {
            "id": 10,
            "firstName": "John",
            "lastName": "Doe",
            "email": "john.doe@example.com"
          },
          "roles": [
            {
              "id": 1,
              "name": "Administrator"
            },
            {
              "id": 2,
              "name": "Manager"
            }
          ]
        },
        {
          "userId": 11,
          "user": {
            "id": 11,
            "firstName": "Jane",
            "lastName": "Smith",
            "email": "jane.smith@example.com"
          },
          "roles": [
            {
              "id": 3,
              "name": "Cashier"
            }
          ]
        }
      ]
    }
  ]
}
```

---

## Error Responses

All endpoints follow a consistent error response format:

### Standard Error Response

```json
{
  "success": false,
  "message": "Error message here",
  "error": {
    "code": "ERROR_CODE",
    "details": "Additional error details"
  }
}
```

### Common HTTP Status Codes

- **400 Bad Request**: Validation error or invalid input
- **401 Unauthorized**: Missing or invalid authentication token
- **403 Forbidden**: User doesn't have permission (e.g., not company owner)
- **404 Not Found**: Resource not found (role, user, branch, etc.)
- **409 Conflict**: Resource conflict (e.g., role name already exists)
- **500 Internal Server Error**: Server error

### Error Examples

**Validation Error (400):**
```json
{
  "success": false,
  "message": "Invalid role data",
  "error": {
    "code": "VALIDATION_ERROR",
    "details": "name is required"
  }
}
```

**Not Found Error (404):**
```json
{
  "success": false,
  "message": "Role not found",
  "error": {
    "code": "NOT_FOUND_ERROR",
    "details": "Role with ID 999 does not exist"
  }
}
```

**Forbidden Error (403):**
```json
{
  "success": false,
  "message": "Company not found or access denied",
  "error": {
    "code": "AUTHORIZATION_ERROR",
    "details": "User is not the owner of this company"
  }
}
```

**Conflict Error (409):**
```json
{
  "success": false,
  "message": "Role with this name already exists in this company",
  "error": {
    "code": "CONFLICT_ERROR",
    "details": "A role named 'Administrator' already exists"
  }
}
```

---

## Request/Response Format

### Request Format

All POST, PUT, and DELETE requests (except simple DELETE without body) should follow this structure:

```json
{
  "metadata": {
    "requestId": "unique-request-id",
    "type": "mobile",
    "version": "1.0.0"
  },
  "data": {
    // Request-specific data here
  }
}
```

**Metadata Fields:**
- `requestId` (required): Unique identifier for the request (UUID recommended)
- `type` (required): Request type (e.g., "mobile", "web")
- `version` (required): API version (e.g., "1.0.0")

### Response Format

**Success Response:**
```json
{
  "success": true,
  "message": "Operation successful message",
  "data": {
    // Response data here
  },
  "pagination": {
    // Pagination info (if applicable)
  }
}
```

**Error Response:**
```json
{
  "success": false,
  "message": "Error message",
  "error": {
    "code": "ERROR_CODE",
    "details": "Additional details"
  }
}
```

---

## Flutter Implementation Examples

### Example 1: Fetch All Permissions

```dart
Future<List<Permission>> fetchAllPermissions() async {
  final response = await http.get(
    Uri.parse('$baseUrl/permissions?limit=1000'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    final groupedPermissions = jsonData['data'] as Map<String, dynamic>;
    
    // Flatten grouped permissions
    List<Permission> allPermissions = [];
    groupedPermissions.forEach((category, permissions) {
      final permissionList = (permissions as List)
          .map((p) => Permission.fromJson(p))
          .toList();
      allPermissions.addAll(permissionList);
    });
    
    return allPermissions;
  } else {
    throw Exception('Failed to load permissions');
  }
}
```

### Example 2: Create Role

```dart
Future<Role> createRole({
  required String name,
  String? description,
  required List<int> permissionIds,
}) async {
  final requestBody = {
    'metadata': {
      'requestId': Uuid().v4(),
      'type': 'mobile',
      'version': '1.0.0',
    },
    'data': {
      'name': name,
      'description': description ?? null,
      'permissionIds': permissionIds,
      'isActive': true,
    },
  };

  final response = await http.post(
    Uri.parse('$baseUrl/roles/company'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: json.encode(requestBody),
  );

  if (response.statusCode == 201) {
    final jsonData = json.decode(response.body);
    return Role.fromJson(jsonData['data']);
  } else {
    final error = json.decode(response.body);
    throw Exception(error['message'] ?? 'Failed to create role');
  }
}
```

### Example 3: Update Role

```dart
Future<Role> updateRole({
  required int roleId,
  String? name,
  String? description,
  List<int>? permissionIds,
  bool? isActive,
}) async {
  final data = <String, dynamic>{};
  if (name != null) data['name'] = name;
  if (description != null) data['description'] = description;
  if (permissionIds != null) data['permissionIds'] = permissionIds;
  if (isActive != null) data['isActive'] = isActive;

  final requestBody = {
    'metadata': {
      'requestId': Uuid().v4(),
      'type': 'mobile',
      'version': '1.0.0',
    },
    'data': data,
  };

  final response = await http.put(
    Uri.parse('$baseUrl/roles/company/$roleId'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: json.encode(requestBody),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    return Role.fromJson(jsonData['data']);
  } else {
    final error = json.decode(response.body);
    throw Exception(error['message'] ?? 'Failed to update role');
  }
}
```

### Example 4: Delete Role

```dart
Future<void> deleteRole(int roleId) async {
  final response = await http.delete(
    Uri.parse('$baseUrl/roles/company/$roleId'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode != 200) {
    final error = json.decode(response.body);
    throw Exception(error['message'] ?? 'Failed to delete role');
  }
}
```

### Example 5: Assign Branch Roles

```dart
Future<BranchRoleAssignmentResult> assignBranchRoles({
  required int userId,
  required List<BranchRoleAssignment> assignments,
}) async {
  final requestBody = {
    'metadata': {
      'requestId': Uuid().v4(),
      'type': 'mobile',
      'version': '1.0.0',
    },
    'data': {
      'userId': userId,
      'assignments': assignments.map((a) => {
        'branchId': a.branchId,
        'roleIds': a.roleIds,
      }).toList(),
    },
  };

  final response = await http.post(
    Uri.parse('$baseUrl/roles/company/branches/users/roles'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: json.encode(requestBody),
  );

  if (response.statusCode == 201) {
    final jsonData = json.decode(response.body);
    return BranchRoleAssignmentResult.fromJson(jsonData);
  } else {
    final error = json.decode(response.body);
    throw Exception(error['message'] ?? 'Failed to assign roles');
  }
}
```

---

## Important Notes

1. **Company Ownership**: Only company owners can manage company roles. The system automatically validates company ownership.

2. **Permission Validation**: When creating or updating roles, all permission IDs are validated. Invalid permission IDs will result in a validation error.

3. **Role Name Uniqueness**: Role names must be unique within a company. Attempting to create a role with a duplicate name will result in a 409 Conflict error.

4. **Branch Role Assignments**: Users must have access to a branch before roles can be assigned to them in that branch. The system automatically updates UserAccess records when roles are assigned or removed.

5. **Pagination**: List endpoints support pagination. Use `page` and `limit` query parameters to control pagination.

6. **Search**: List endpoints support search functionality. Use the `search` query parameter to filter results by name.

7. **Date Formats**: All dates are returned in ISO 8601 format (e.g., "2024-01-15T10:30:00.000Z").

8. **Request IDs**: Always include a unique `requestId` in the metadata for tracking and debugging purposes.

---

## Support

For questions or issues, please contact the backend development team.

**Last Updated:** January 2024
**API Version:** 1.0.0
