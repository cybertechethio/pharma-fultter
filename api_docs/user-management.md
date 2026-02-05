# User Management API

**Base:** All endpoints require authentication. Request/response use **camelCase**. Prefer body as `{ "data": { ... } }`.  
**Errors:** `400` validation, `401` unauthorized, `403` forbidden, `404` not found, `409` conflict, `500` server error.

**Success envelope:** `success: boolean`, `message: string`, `data: object | array`, `pagination?: object` (list only), `metadata?: object`.

---

## Data types & enums

### Enums

| Enum | Values | Usage |
|------|--------|--------|
| **UserType** (staff) | `ADMIN`, `MANAGER`, `CASHIER`, `STOREKEEPER`, `SUPERVISOR`, `STANDARD` | Request body (create/update company user), response `userType` |
| **Status** (filter) | `active`, `inactive` | Query param `status` on list endpoints |
| **SortOrder** | `asc`, `desc` | Query param `sortOrder` on GET /api/users |

### User object (response only)

Single shape for get / create / update / delete and for each element in list. All fields always present in response (nullable where noted).

| Field | Type | Required in response | Notes |
|-------|------|----------------------|--------|
| id | number | M | |
| firstName | string | M | |
| lastName | string | M | |
| email | string \| null | M | |
| phone | string \| null | M | |
| isActive | boolean | M | |
| isAccountVerified | boolean | M | |
| passwordVerified | boolean | M | |
| userType | string \| null | M | Enum: `ADMIN` \| `MANAGER` \| `CASHIER` \| `STOREKEEPER` \| `SUPERVISOR` \| `STANDARD` (DB also has `SYSTEM`, not settable via API) |
| createdAt | string | M | ISO date |
| updatedAt | string | M | ISO date |
| createdBy | number \| null | M | |
| updatedBy | number \| null | M | |
| avatar | string \| null | M | |
| fcmToken | string \| null | M | |
| resetToken | string \| null | M | |
| resetTokenExpiry | string \| null | M | ISO date or null |
| preferences | object \| null | M | |

### Pagination object (list responses only)

| Field | Type | Required |
|-------|------|----------|
| page | number | M |
| limit | number | M |
| total | number | M |
| totalPages | number | M |

---

## Index: all endpoints (request → response)

| # | Method | Endpoint | Request | Response |
|---|--------|----------|---------|----------|
| 1 | GET | `/api/users` | Query: page, limit, search, status, userType, sortBy, sortOrder, includeStats, fields | 200: `data: User[]`, `pagination` |
| 2 | GET | `/api/users/:id` | Path: id | 200: `data: User` |
| 3 | PUT | `/api/users/:id` | Path: id. Body: firstName?, lastName?, email?, phone?, isActive? | 200: `data: User` |
| 4 | DELETE | `/api/users/:id` | Path: id | 200: `data: User` |
| 5 | POST | `/api/users/roles` | Body: userId, assignments[] | 201: role snapshot (see below) |
| 6 | GET | `/api/users/:userId/roles` | Path: userId | 200: role snapshot (see below) |
| 7 | GET | `/api/company/user` | Query: page, limit, search, status, userType | 200: `data: User[]`, `pagination` |
| 8 | POST | `/api/company/user` | Body: firstName (M), phone (M), lastName?, email?, password?, isActive?, userType? | 201: `data: User` |
| 9 | GET | `/api/company/user/:userId` | Path: userId | 200: `data: User` |
| 10 | PUT | `/api/company/user/:userId` | Path: userId. Body: firstName?, lastName?, email?, phone?, isActive?, userType? | 200: `data: User` |
| 11 | DELETE | `/api/company/user/:userId` | Path: userId | 200: `data: User` |

---

# Part 1: `/api/users`

## 1. GET /api/users — List

**Query** (all optional)

| Param | Type | Required | Default | Notes |
|-------|------|----------|---------|--------|
| page | number | O | 1 | ≥ 1 |
| limit | number | O | — | Items per page |
| search | string | O | — | Search firstName, lastName, email, phone |
| status | string | O | — | Enum: `active` \| `inactive` |
| userType | string | O | — | Enum: `ADMIN` \| `MANAGER` \| `CASHIER` \| `STOREKEEPER` \| `SUPERVISOR` \| `STANDARD` |
| sortBy | string | O | createdAt | Sort field |
| sortOrder | string | O | desc | Enum: `asc` \| `desc` |
| includeStats | string | O | — | If `true`, response may include stats |
| fields | string | O | — | Comma-separated field list |

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "..." (string (M)),
  "data": [
    {
      "id": 1 (number (M)),
      "firstName": "..." (string (M)),
      "lastName": "..." (string \| null (M)),
      "email": null (string \| null (M)),
      "phone": null (string \| null (M)),
      "isActive": true (boolean (M)),
      "isAccountVerified": true (boolean (M)),
      "passwordVerified": false (boolean (M)),
      "userType": "CASHIER" (UserType: ADMIN | MANAGER | CASHIER | STOREKEEPER | SUPERVISOR | STANDARD (M)),
      "createdAt": "..." (string (M)),
      "updatedAt": "..." (string (M)),
      "createdBy": null (number \| null (M)),
      "updatedBy": null (number \| null (M)),
      "avatar": null (string \| null (M)),
      "fcmToken": null (string \| null (M)),
      "resetToken": null (string \| null (M)),
      "resetTokenExpiry": null (string \| null (M)),
      "preferences": null (object \| null (M))
    }
  ],
  "pagination": {
    "page": 1 (number (M)),
    "limit": 25 (number (M)),
    "total": 100 (number (M)),
    "totalPages": 4 (number (M))
  }
}
```

---

## 2. GET /api/users/:id — Get one

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "..." (string (M)),
  "data": {
    "id": 1 (number (M)),
    "firstName": "..." (string (M)),
    "lastName": "..." (string \| null (M)),
    "email": null (string \| null (M)),
    "phone": null (string \| null (M)),
    "isActive": true (boolean (M)),
    "isAccountVerified": true (boolean (M)),
    "passwordVerified": false (boolean (M)),
    "userType": "CASHIER" (UserType: ADMIN | MANAGER | CASHIER | STOREKEEPER | SUPERVISOR | STANDARD (M)),
    "createdAt": "..." (string (M)),
    "updatedAt": "..." (string (M)),
    "createdBy": null (number \| null (M)),
    "updatedBy": null (number \| null (M)),
    "avatar": null (string \| null (M)),
    "fcmToken": null (string \| null (M)),
    "resetToken": null (string \| null (M)),
    "resetTokenExpiry": null (string \| null (M)),
    "preferences": null (object \| null (M))
  }
}
```

---

## 3. PUT /api/users/:id — Update

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Request (body)** — All optional; at least one required.

```json
{
  "data": {
    "firstName": "John" (string (O)),
    "lastName": "Doe" (string (O)),
    "email": "john@example.com" (string \| null (O)),
    "phone": "+251911234567" (string \| null (O)),
    "isActive": true (boolean (O))
  }
}
```

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "..." (string (M)),
  "data": {
    "id": 1 (number (M)),
    "firstName": "..." (string (M)),
    "lastName": "..." (string \| null (M)),
    "email": null (string \| null (M)),
    "phone": null (string \| null (M)),
    "isActive": true (boolean (M)),
    "isAccountVerified": true (boolean (M)),
    "passwordVerified": false (boolean (M)),
    "userType": "CASHIER" (UserType: ADMIN | MANAGER | CASHIER | STOREKEEPER | SUPERVISOR | STANDARD (M)),
    "createdAt": "..." (string (M)),
    "updatedAt": "..." (string (M)),
    "createdBy": null (number \| null (M)),
    "updatedBy": null (number \| null (M)),
    "avatar": null (string \| null (M)),
    "fcmToken": null (string \| null (M)),
    "resetToken": null (string \| null (M)),
    "resetTokenExpiry": null (string \| null (M)),
    "preferences": null (object \| null (M))
  }
}
```

---

## 4. DELETE /api/users/:id — Delete (soft)

**Path**

| Param | Type | Required |
|-------|------|----------|
| id | number | M |

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "..." (string (M)),
  "data": {
    "id": 1 (number (M)),
    "firstName": "..." (string (M)),
    "lastName": "..." (string \| null (M)),
    "email": null (string \| null (M)),
    "phone": null (string \| null (M)),
    "isActive": false (boolean (M)),
    "isAccountVerified": true (boolean (M)),
    "passwordVerified": false (boolean (M)),
    "userType": "CASHIER" (UserType: ADMIN | MANAGER | CASHIER | STOREKEEPER | SUPERVISOR | STANDARD (M)),
    "createdAt": "..." (string (M)),
    "updatedAt": "..." (string (M)),
    "createdBy": null (number \| null (M)),
    "updatedBy": null (number \| null (M)),
    "avatar": null (string \| null (M)),
    "fcmToken": null (string \| null (M)),
    "resetToken": null (string \| null (M)),
    "resetTokenExpiry": null (string \| null (M)),
    "preferences": null (object \| null (M))
  }
}
```

---

## 5. POST /api/users/roles — Assign branch roles

**Request (body)**

```json
{
  "data": {
    "userId": 5 (number (M)),
    "assignments": [
      {
        "branchId": 1 (number (O)),
        "roleIds": [2, 3] (number[] (O))
      }
    ]
  }
}
```

**Response 201**

```json
{
  "success": true (boolean (M)),
  "message": "..." (string (M)),
  "data": {
    "items": [] (array (M)),
    "totals": {} (object (M)),
    "summary": {
      "processedGroups": 0 (number (M)),
      "rolesAssigned": 0 (number (M)),
      "rolesRemoved": 0 (number (M)),
      "failed": 0 (number (M)),
      "errors": [] (array (M))
    }
  }
}
```

---

## 6. GET /api/users/:userId/roles — Get user roles

**Path**

| Param | Type | Required |
|-------|------|----------|
| userId | number | M |

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "..." (string (M)),
  "data": {
    "groups": [] (array (M)),
    "totals": {} (object (M))
  }
}
```

---

# Part 2: `/api/company/user`

Scoped to current company. Same **User** shape for get/create/update/delete; list = array of **User** + pagination.

## 7. GET /api/company/user — List

**Query** (all optional)

| Param | Type | Required | Default | Notes |
|-------|------|----------|---------|--------|
| page | number | O | 1 | ≥ 1 |
| limit | number | O | — | Items per page |
| search | string | O | — | Search firstName, lastName, email, phone |
| status | string | O | — | Enum: `active` \| `inactive` |
| userType | string | O | — | Enum: `ADMIN` \| `MANAGER` \| `CASHIER` \| `STOREKEEPER` \| `SUPERVISOR` \| `STANDARD` |

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "..." (string (M)),
  "data": [
    {
      "id": 1 (number (M)),
      "firstName": "..." (string (M)),
      "lastName": "..." (string \| null (M)),
      "email": null (string \| null (M)),
      "phone": null (string \| null (M)),
      "isActive": true (boolean (M)),
      "isAccountVerified": true (boolean (M)),
      "passwordVerified": false (boolean (M)),
      "userType": "CASHIER" (UserType: ADMIN | MANAGER | CASHIER | STOREKEEPER | SUPERVISOR | STANDARD (M)),
      "createdAt": "..." (string (M)),
      "updatedAt": "..." (string (M)),
      "createdBy": null (number \| null (M)),
      "updatedBy": null (number \| null (M)),
      "avatar": null (string \| null (M)),
      "fcmToken": null (string \| null (M)),
      "resetToken": null (string \| null (M)),
      "resetTokenExpiry": null (string \| null (M)),
      "preferences": null (object \| null (M))
    }
  ],
  "pagination": {
    "page": 1 (number (M)),
    "limit": 25 (number (M)),
    "total": 100 (number (M)),
    "totalPages": 4 (number (M))
  }
}
```

---

## 8. POST /api/company/user — Create

**Mandatory:** `firstName`, `phone`. All other fields optional.

**Request (body)**

```json
{
  "data": {
    "firstName": "Jane" (string (M)),
    "phone": "+251922334455" (string (M)),
    "lastName": "Doe" (string (O)),
    "email": "jane@example.com" (string \| null (O)),
    "password": "secret123" (string (O)),
    "isActive": true (boolean (O)),
    "userType": "CASHIER" (UserType: ADMIN | MANAGER | CASHIER | STOREKEEPER | SUPERVISOR | STANDARD (O))
  }
}
```

**Response 201**

```json
{
  "success": true (boolean (M)),
  "message": "..." (string (M)),
  "data": {
    "id": 1 (number (M)),
    "firstName": "..." (string (M)),
    "lastName": "..." (string \| null (M)),
    "email": null (string \| null (M)),
    "phone": null (string \| null (M)),
    "isActive": true (boolean (M)),
    "isAccountVerified": true (boolean (M)),
    "passwordVerified": false (boolean (M)),
    "userType": "CASHIER" (UserType: ADMIN | MANAGER | CASHIER | STOREKEEPER | SUPERVISOR | STANDARD (M)),
    "createdAt": "..." (string (M)),
    "updatedAt": "..." (string (M)),
    "createdBy": 1 (number \| null (M)),
    "updatedBy": null (number \| null (M)),
    "avatar": null (string \| null (M)),
    "fcmToken": null (string \| null (M)),
    "resetToken": null (string \| null (M)),
    "resetTokenExpiry": null (string \| null (M)),
    "preferences": null (object \| null (M))
  }
}
```

---

## 9. GET /api/company/user/:userId — Get one

**Path**

| Param | Type | Required |
|-------|------|----------|
| userId | number | M |

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "..." (string (M)),
  "data": {
    "id": 1 (number (M)),
    "firstName": "..." (string (M)),
    "lastName": "..." (string \| null (M)),
    "email": null (string \| null (M)),
    "phone": null (string \| null (M)),
    "isActive": true (boolean (M)),
    "isAccountVerified": true (boolean (M)),
    "passwordVerified": false (boolean (M)),
    "userType": "CASHIER" (UserType: ADMIN | MANAGER | CASHIER | STOREKEEPER | SUPERVISOR | STANDARD (M)),
    "createdAt": "..." (string (M)),
    "updatedAt": "..." (string (M)),
    "createdBy": null (number \| null (M)),
    "updatedBy": null (number \| null (M)),
    "avatar": null (string \| null (M)),
    "fcmToken": null (string \| null (M)),
    "resetToken": null (string \| null (M)),
    "resetTokenExpiry": null (string \| null (M)),
    "preferences": null (object \| null (M))
  }
}
```

---

## 10. PUT /api/company/user/:userId — Update

**Path**

| Param | Type | Required |
|-------|------|----------|
| userId | number | M |

**Request (body)** — All optional; at least one required.

```json
{
  "data": {
    "firstName": "Jane" (string (O)),
    "lastName": "Smith" (string (O)),
    "email": "jane.smith@example.com" (string \| null (O)),
    "phone": "+251922334455" (string \| null (O)),
    "isActive": true (boolean (O)),
    "userType": "MANAGER" (UserType: ADMIN | MANAGER | CASHIER | STOREKEEPER | SUPERVISOR | STANDARD (O))
  }
}
```

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "..." (string (M)),
  "data": {
    "id": 1 (number (M)),
    "firstName": "..." (string (M)),
    "lastName": "..." (string \| null (M)),
    "email": null (string \| null (M)),
    "phone": null (string \| null (M)),
    "isActive": true (boolean (M)),
    "isAccountVerified": true (boolean (M)),
    "passwordVerified": false (boolean (M)),
    "userType": "MANAGER" (UserType: ADMIN | MANAGER | CASHIER | STOREKEEPER | SUPERVISOR | STANDARD (M)),
    "createdAt": "..." (string (M)),
    "updatedAt": "..." (string (M)),
    "createdBy": null (number \| null (M)),
    "updatedBy": null (number \| null (M)),
    "avatar": null (string \| null (M)),
    "fcmToken": null (string \| null (M)),
    "resetToken": null (string \| null (M)),
    "resetTokenExpiry": null (string \| null (M)),
    "preferences": null (object \| null (M))
  }
}
```

---

## 11. DELETE /api/company/user/:userId — Delete

**Path**

| Param | Type | Required |
|-------|------|----------|
| userId | number | M |

**Response 200**

```json
{
  "success": true (boolean (M)),
  "message": "..." (string (M)),
  "data": {
    "id": 1 (number (M)),
    "firstName": "..." (string (M)),
    "lastName": "..." (string \| null (M)),
    "email": null (string \| null (M)),
    "phone": null (string \| null (M)),
    "isActive": false (boolean (M)),
    "isAccountVerified": true (boolean (M)),
    "passwordVerified": false (boolean (M)),
    "userType": "CASHIER" (UserType: ADMIN | MANAGER | CASHIER | STOREKEEPER | SUPERVISOR | STANDARD (M)),
    "createdAt": "..." (string (M)),
    "updatedAt": "..." (string (M)),
    "createdBy": null (number \| null (M)),
    "updatedBy": null (number \| null (M)),
    "avatar": null (string \| null (M)),
    "fcmToken": null (string \| null (M)),
    "resetToken": null (string \| null (M)),
    "resetTokenExpiry": null (string \| null (M)),
    "preferences": null (object \| null (M))
  }
}
```

---

## Summary

| # | Method | Endpoint |
|---|--------|----------|
| 1 | GET | `/api/users` |
| 2 | GET | `/api/users/:id` |
| 3 | PUT | `/api/users/:id` |
| 4 | DELETE | `/api/users/:id` |
| 5 | POST | `/api/users/roles` |
| 6 | GET | `/api/users/:userId/roles` |
| 7 | GET | `/api/company/user` |
| 8 | POST | `/api/company/user` |
| 9 | GET | `/api/company/user/:userId` |
| 10 | PUT | `/api/company/user/:userId` |
| 11 | DELETE | `/api/company/user/:userId` |
