# API GET Methods Documentation

This document provides comprehensive documentation for all GET endpoints across the POS Backend API. All endpoints require authentication and return data in a standardized format.

**Base URL**: Replace `{{baseURL}}` with your API base URL (e.g., `http://localhost:3000/api`)

**Authentication**: All endpoints require a valid JWT token in the Authorization header.

---

## Table of Contents

1. [Items](#items)
2. [Transactions](#transactions)
3. [Transfers](#transfers)
4. [Stock Movements](#stock-movements)
5. [Branch Stocks](#branch-stocks)
6. [Batches](#batches)

---

## Items

### Get All Items

**Endpoint**: `GET /api/items`

**Description**: Retrieve a paginated list of items with optional filtering and sorting.

#### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page` | number | No | Page number (default: 1) |
| `limit` | number | No | Items per page (default: 25) |
| `search` or `text` | string | No | Search in name, description, code, sku, barcode |
| `category_id` | number | No | Filter by category ID |
| `sub_category_id` | number | No | Filter by sub-category ID |
| `brand_id` | number | No | Filter by brand ID |
| `unit_id` | number | No | Filter by unit ID |
| `model_id` | number | No | Filter by model ID |
| `is_active` | boolean | No | Filter by active status (true/false) |
| `is_taxable` | boolean | No | Filter by taxable status (true/false) |
| `color` | string | No | Filter by color (contains search) |
| `size` | string | No | Filter by size (contains search) |
| `material` | string | No | Filter by material (contains search) |
| `unit_price_min` | number | No | Minimum unit price |
| `unit_price_max` | number | No | Maximum unit price |
| `cost_price_min` | number | No | Minimum cost price |
| `cost_price_max` | number | No | Maximum cost price |
| `tax_rate_min` | number | No | Minimum tax rate |
| `tax_rate_max` | number | No | Maximum tax rate |
| `sort_by` | string | No | Sort field: `created_at`, `name`, `unit_price`, `cost_price` (default: `created_at`) |
| `sort_order` | string | No | Sort order: `asc` or `desc` (default: `desc`) |

#### Example Requests

**Basic Pagination**
```
GET {{baseURL}}/api/items?page=1&limit=25
GET {{baseURL}}/api/items?page=2&limit=50
GET {{baseURL}}/api/items?page=1&limit=10
```

**Search**
```
GET {{baseURL}}/api/items?search=shirt&page=1&limit=25
GET {{baseURL}}/api/items?text=premium&page=1&limit=25
GET {{baseURL}}/api/items?search=TSH&page=1&limit=25
```

**Category Filters**
```
GET {{baseURL}}/api/items?category_id=1&page=1&limit=25
GET {{baseURL}}/api/items?sub_category_id=2&page=1&limit=25
GET {{baseURL}}/api/items?category_id=1&sub_category_id=2&page=1&limit=25
```

**Brand/Unit/Model Filters**
```
GET {{baseURL}}/api/items?brand_id=1&page=1&limit=25
GET {{baseURL}}/api/items?unit_id=3&page=1&limit=25
GET {{baseURL}}/api/items?model_id=2&page=1&limit=25
GET {{baseURL}}/api/items?brand_id=1&unit_id=3&model_id=2&page=1&limit=25
```

**Boolean Filters**
```
GET {{baseURL}}/api/items?is_active=true&page=1&limit=25
GET {{baseURL}}/api/items?is_active=false&page=1&limit=25
GET {{baseURL}}/api/items?is_taxable=true&page=1&limit=25
GET {{baseURL}}/api/items?is_active=true&is_taxable=true&page=1&limit=25
```

**String Filters**
```
GET {{baseURL}}/api/items?color=black&page=1&limit=25
GET {{baseURL}}/api/items?size=L&page=1&limit=25
GET {{baseURL}}/api/items?material=cotton&page=1&limit=25
GET {{baseURL}}/api/items?color=black&size=L&material=cotton&page=1&limit=25
```

**Price Range Filters**
```
GET {{baseURL}}/api/items?unit_price_min=50&page=1&limit=25
GET {{baseURL}}/api/items?unit_price_max=100&page=1&limit=25
GET {{baseURL}}/api/items?unit_price_min=50&unit_price_max=100&page=1&limit=25
GET {{baseURL}}/api/items?cost_price_min=30&cost_price_max=80&page=1&limit=25
```

**Tax Rate Range**
```
GET {{baseURL}}/api/items?tax_rate_min=5&page=1&limit=25
GET {{baseURL}}/api/items?tax_rate_max=10&page=1&limit=25
GET {{baseURL}}/api/items?tax_rate_min=5&tax_rate_max=10&page=1&limit=25
```

**Sorting**
```
GET {{baseURL}}/api/items?sort_by=name&sort_order=asc&page=1&limit=25
GET {{baseURL}}/api/items?sort_by=name&sort_order=desc&page=1&limit=25
GET {{baseURL}}/api/items?sort_by=unit_price&sort_order=asc&page=1&limit=25
GET {{baseURL}}/api/items?sort_by=cost_price&sort_order=desc&page=1&limit=25
GET {{baseURL}}/api/items?sort_by=created_at&sort_order=desc&page=1&limit=25
```

**Combined Filters**
```
GET {{baseURL}}/api/items?search=shirt&category_id=1&is_active=true&page=1&limit=25
GET {{baseURL}}/api/items?brand_id=1&color=black&unit_price_min=50&unit_price_max=100&page=1&limit=25
GET {{baseURL}}/api/items?is_taxable=true&tax_rate_min=8&tax_rate_max=10&sort_by=name&sort_order=asc&page=1&limit=25
```

#### Response Format

```json
{
  "success": true,
  "message": "Items fetched successfully",
  "data": [
    {
      "id": 15,
      "company_id": 7,
      "name": "Premium T-Shirt",
      "description": "100% cotton",
      "category_id": 1,
      "sub_category_id": 2,
      "brand_id": 1,
      "unit_id": 3,
      "model_id": 2,
      "sku": "TSH-PRM-001",
      "code": "PRMTSH001",
      "barcode": "012345678905",
      "color": "Black",
      "size": "L",
      "material": "Cotton",
      "weight": "0.25",
      "is_taxable": true,
      "tax_rate": 8,
      "is_active": true,
      "image_url": null,
      "created_at": "2025-11-14T05:59:54.672Z",
      "updated_at": "2025-11-15T07:16:07.072Z",
      "created_by": 2,
      "updated_by": 2,
      "categories": "Beverages",
      "sub_categories": "Juice",
      "brands": "BMW",
      "units": "M",
      "models": "M24"
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 1,
    "totalItems": 4,
    "itemsPerPage": 25,
    "hasNextPage": false,
    "hasPrevPage": false,
    "nextPage": null,
    "prevPage": null
  },
  "metadata": {
    "request_id": "c387f422-bf93-40cd-9377-0f4a9f0f29a4",
    "timestamp": "2025-11-15T08:12:08.792Z"
  }
}
```

### Get One Item

**Endpoint**: `GET /api/items/:id`

**Description**: Retrieve a single item by ID.

#### Example Request

```
GET {{baseURL}}/api/items/15
```

#### Response Format

```json
{
  "success": true,
  "message": "Item fetched successfully",
  "data": {
    "id": 15,
    "company_id": 7,
    "name": "Premium T-Shirt",
    // ... same structure as getAll response
  },
  "metadata": {
    "request_id": "c387f422-bf93-40cd-9377-0f4a9f0f29a4",
    "timestamp": "2025-11-15T08:12:08.792Z"
  }
}
```

---

## Transactions

### Get All Transactions

**Endpoint**: `GET /api/transactions`

**Description**: Retrieve a paginated list of transactions with optional filtering.

#### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page` | number | No | Page number (default: 1) |
| `limit` | number | No | Items per page (default: 25) |
| `branch_id` or `branchId` | number | No | Filter by branch ID |
| `status` | string | No | Filter by status: `pending`, `completed`, `cancelled` |
| `transaction_type` or `transactionType` | string | No | Filter by type: `purchase`, `purchase_return`, `sale`, `sale_return`, `using`, `adjustment`, `waste`, `damage`, `reversal`, `initial_stock`, `batch_transfer`, `batch_consolidation` |
| `supplier_id` or `supplierId` | number | No | Filter by supplier ID |
| `customer_id` or `customerId` | number | No | Filter by customer ID |
| `transaction_number` or `transactionNumber` | string | No | Search by transaction number (contains) |
| `min_total_amount` or `minTotalAmount` | number | No | Minimum total amount |
| `max_total_amount` or `maxTotalAmount` | number | No | Maximum total amount |
| `min_subtotal` or `minSubtotal` | number | No | Minimum subtotal |
| `max_subtotal` or `maxSubtotal` | number | No | Maximum subtotal |
| `search` | string | No | Search in transaction_number and notes |
| `from_date` or `fromDate` | string | No | Filter from date (ISO format) |
| `to_date` or `toDate` | string | No | Filter to date (ISO format) |

#### Example Requests

**Basic Pagination**
```
GET {{baseURL}}/api/transactions?page=1&limit=25
GET {{baseURL}}/api/transactions?page=2&limit=50
```

**Branch Filter**
```
GET {{baseURL}}/api/transactions?branch_id=7&page=1&limit=25
GET {{baseURL}}/api/transactions?branchId=7&page=1&limit=25
```

**Status Filter**
```
GET {{baseURL}}/api/transactions?status=pending&page=1&limit=25
GET {{baseURL}}/api/transactions?status=completed&page=1&limit=25
GET {{baseURL}}/api/transactions?status=cancelled&page=1&limit=25
```

**Transaction Type Filter**
```
GET {{baseURL}}/api/transactions?transaction_type=purchase&page=1&limit=25
GET {{baseURL}}/api/transactions?transactionType=sale&page=1&limit=25
GET {{baseURL}}/api/transactions?transaction_type=purchase_return&page=1&limit=25
GET {{baseURL}}/api/transactions?transaction_type=sale_return&page=1&limit=25
GET {{baseURL}}/api/transactions?transaction_type=adjustment&page=1&limit=25
GET {{baseURL}}/api/transactions?transaction_type=reversal&page=1&limit=25
```

**Customer/Supplier Filters**
```
GET {{baseURL}}/api/transactions?customer_id=1&page=1&limit=25
GET {{baseURL}}/api/transactions?customerId=1&page=1&limit=25
GET {{baseURL}}/api/transactions?supplier_id=1&page=1&limit=25
GET {{baseURL}}/api/transactions?supplierId=1&page=1&limit=25
```

**Transaction Number Search**
```
GET {{baseURL}}/api/transactions?transaction_number=PUR-2025&page=1&limit=25
GET {{baseURL}}/api/transactions?transactionNumber=SALE-001&page=1&limit=25
```

**Amount Range Filters**
```
GET {{baseURL}}/api/transactions?min_total_amount=100&page=1&limit=25
GET {{baseURL}}/api/transactions?max_total_amount=1000&page=1&limit=25
GET {{baseURL}}/api/transactions?min_total_amount=100&max_total_amount=1000&page=1&limit=25
GET {{baseURL}}/api/transactions?min_subtotal=50&max_subtotal=500&page=1&limit=25
```

**Date Range Filters**
```
GET {{baseURL}}/api/transactions?from_date=2025-11-01&page=1&limit=25
GET {{baseURL}}/api/transactions?to_date=2025-11-30&page=1&limit=25
GET {{baseURL}}/api/transactions?from_date=2025-11-01&to_date=2025-11-30&page=1&limit=25
GET {{baseURL}}/api/transactions?fromDate=2025-11-01&toDate=2025-11-30&page=1&limit=25
```

**Search**
```
GET {{baseURL}}/api/transactions?search=PUR-2025&page=1&limit=25
GET {{baseURL}}/api/transactions?search=payment&page=1&limit=25
```

**Combined Filters**
```
GET {{baseURL}}/api/transactions?branch_id=7&transaction_type=purchase&status=completed&page=1&limit=25
GET {{baseURL}}/api/transactions?customer_id=1&min_total_amount=100&from_date=2025-11-01&to_date=2025-11-30&page=1&limit=25
GET {{baseURL}}/api/transactions?transaction_type=sale&status=completed&min_total_amount=50&max_total_amount=500&page=1&limit=25
```

#### Response Format

```json
{
  "success": true,
  "message": "Transactions fetched successfully",
  "data": [
    {
      "id": 1,
      "company_id": 7,
      "branch_id": 7,
      "transaction_type": "purchase",
      "transaction_number": "PUR-2025-001",
      "status": "completed",
      "supplier_id": 1,
      "customer_id": null,
      "subtotal": "6500.00",
      "total_tax": "520.00",
      "total_amount": "7020.00",
      "notes": "Purchase from supplier",
      "attachments": [],
      "created_at": "2025-11-15T09:00:37.071Z",
      "updated_at": "2025-11-15T09:00:37.071Z",
      "created_by": 2,
      "updated_by": null
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 1,
    "totalItems": 10,
    "itemsPerPage": 25,
    "hasNextPage": false,
    "hasPrevPage": false,
    "nextPage": null,
    "prevPage": null
  },
  "metadata": {
    "request_id": "a175c1c4-bf27-4476-b30b-5299ce2c8939",
    "timestamp": "2025-11-15T08:11:28.904Z"
  }
}
```

### Get One Transaction

**Endpoint**: `GET /api/transactions/:id`

**Description**: Retrieve a single transaction by ID with all related items and batches.

#### Example Request

```
GET {{baseURL}}/api/transactions/1
```

#### Response Format

```json
{
  "success": true,
  "message": "Transaction fetched successfully",
  "data": {
    "id": 1,
    "company_id": 7,
    "branch_id": 7,
    "transaction_type": "purchase",
    // ... transaction fields
    "transaction_items": [
      {
        "id": 1,
        "transaction_id": 1,
        "item_id": 15,
        "quantity": "100.000",
        "tax_rate": 8,
        "total": "6500.00",
        "transaction_item_batches": [
          {
            "id": 1,
            "transaction_item_id": 1,
            "batch_number": "PURCHASE-BATCH-001",
            "quantity": "100.000",
            "cost_price": "50.00",
            "unit_price": "65.00"
          }
        ]
      }
    ]
  },
  "metadata": {
    "request_id": "a175c1c4-bf27-4476-b30b-5299ce2c8939",
    "timestamp": "2025-11-15T08:11:28.904Z"
  }
}
```

### Get Transaction Items

**Endpoint**: `GET /api/transactions/:transactionId/items`

**Description**: Get all items for a specific transaction.

#### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page` | number | No | Page number (default: 1) |
| `limit` | number | No | Items per page (default: 25) |
| `order_by` or `orderBy` | string | No | Sort field (default: `created_at`) |
| `sort_order` or `sortOrder` | string | No | Sort order: `asc` or `desc` (default: `desc`) |

#### Example Requests

```
GET {{baseURL}}/api/transactions/1/items?page=1&limit=25
GET {{baseURL}}/api/transactions/1/items?order_by=created_at&sort_order=asc
```

### Get One Transaction Item

**Endpoint**: `GET /api/transactions/items/:id`

**Description**: Get a single transaction item by ID.

#### Example Request

```
GET {{baseURL}}/api/transactions/items/1
```

### Get Transaction Item Batches

**Endpoint**: `GET /api/transactions/items/:transactionItemId/batches`

**Description**: Get all batches for a specific transaction item.

#### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page` | number | No | Page number (default: 1) |
| `limit` | number | No | Items per page (default: 25) |
| `order_by` or `orderBy` | string | No | Sort field (default: `created_at`) |
| `sort_order` or `sortOrder` | string | No | Sort order: `asc` or `desc` (default: `desc`) |

#### Example Requests

```
GET {{baseURL}}/api/transactions/items/1/batches?page=1&limit=25
GET {{baseURL}}/api/transactions/items/1/batches?order_by=batch_number&sort_order=asc
```

### Get One Transaction Item Batch

**Endpoint**: `GET /api/transactions/batches/:id`

**Description**: Get a single transaction item batch by ID.

#### Example Request

```
GET {{baseURL}}/api/transactions/batches/1
```

---

## Transfers

### Get All Transfers

**Endpoint**: `GET /api/transfers`

**Description**: Retrieve a paginated list of transfers with optional filtering.

#### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page` | number | No | Page number (default: 1) |
| `limit` | number | No | Items per page (default: 25) |
| `transfer_type` or `transferType` | string | No | Filter by type: `transfer_out`, `transfer_in`, `transfer_in_return`, `transfer_out_return` |
| `status` | string | No | Filter by status: `pending`, `completed`, `rejected`, `returned` |
| `source_branch_id` or `sourceBranchId` | number | No | Filter by source branch ID |
| `destination_branch_id` or `destinationBranchId` | number | No | Filter by destination branch ID |

#### Example Requests

**Basic Pagination**
```
GET {{baseURL}}/api/transfers?page=1&limit=25
GET {{baseURL}}/api/transfers?page=2&limit=50
```

**Transfer Type Filter**
```
GET {{baseURL}}/api/transfers?transfer_type=transfer_out&page=1&limit=25
GET {{baseURL}}/api/transfers?transfer_type=transfer_in&page=1&limit=25
GET {{baseURL}}/api/transfers?transfer_type=transfer_in_return&page=1&limit=25
GET {{baseURL}}/api/transfers?transfer_type=transfer_out_return&page=1&limit=25
```

**Status Filter**
```
GET {{baseURL}}/api/transfers?status=pending&page=1&limit=25
GET {{baseURL}}/api/transfers?status=completed&page=1&limit=25
GET {{baseURL}}/api/transfers?status=rejected&page=1&limit=25
GET {{baseURL}}/api/transfers?status=returned&page=1&limit=25
```

**Branch Filters**
```
GET {{baseURL}}/api/transfers?source_branch_id=7&page=1&limit=25
GET {{baseURL}}/api/transfers?destination_branch_id=8&page=1&limit=25
GET {{baseURL}}/api/transfers?source_branch_id=7&destination_branch_id=8&page=1&limit=25
```

**Combined Filters**
```
GET {{baseURL}}/api/transfers?transfer_type=transfer_out&status=completed&page=1&limit=25
GET {{baseURL}}/api/transfers?source_branch_id=7&destination_branch_id=8&status=completed&page=1&limit=25
GET {{baseURL}}/api/transfers?transfer_type=transfer_out&source_branch_id=7&status=completed&page=1&limit=25
```

#### Response Format

```json
{
  "success": true,
  "message": "Transfers fetched successfully",
  "data": [
    {
      "id": 9,
      "company_id": 7,
      "transfer_type": "transfer_out",
      "transfer_number": "TO25110002-6729",
      "source_branch_id": 7,
      "destination_branch_id": 8,
      "related_transfer_id": null,
      "status": "completed",
      "notes": "Transferring items to another branch",
      "attachments": [],
      "created_at": "2025-11-15T14:22:28.824Z",
      "updated_at": "2025-11-15T14:22:28.824Z",
      "created_by": 2,
      "updated_by": null,
      "source_branch": "Main Branch",
      "destination_branch": "Tokyo Branch",
      "related_transfer": null,
      "created_by_user": 2,
      "updated_by_user": null
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 1,
    "totalItems": 5,
    "itemsPerPage": 25,
    "hasNextPage": false,
    "hasPrevPage": false,
    "nextPage": null,
    "prevPage": null
  },
  "metadata": {
    "request_id": "550e8400-e29b-41d4-a716-446655440017",
    "timestamp": "2025-11-15T14:22:28.896Z"
  }
}
```

### Get One Transfer

**Endpoint**: `GET /api/transfers/:id`

**Description**: Retrieve a single transfer by ID.

#### Example Request

```
GET {{baseURL}}/api/transfers/9
```

#### Response Format

Same structure as getAll, but returns a single object instead of an array.

---

## Stock Movements

### Get All Stock Movements

**Endpoint**: `GET /api/stock-movements`

**Description**: Retrieve a paginated list of stock movements with optional filtering.

#### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page` | number | No | Page number (default: 1) |
| `limit` | number | No | Items per page (default: 25) |
| `branch_id` or `branchId` | number | No | Filter by branch ID |
| `type` | string | No | Filter by movement type: `purchase`, `purchase_return`, `sale`, `sale_return`, `transfer_in`, `transfer_in_return`, `transfer_out`, `transfer_out_return`, `using`, `adjustment`, `waste`, `damage`, `reversal`, `initial_stock`, `batch_transfer`, `batch_consolidation` |
| `status` | string | No | Filter by status: `completed`, `cancelled`, `reversed` |
| `item_id` or `itemId` | number | No | Filter by item ID |

#### Example Requests

**Basic Pagination**
```
GET {{baseURL}}/api/stock-movements?page=1&limit=25
GET {{baseURL}}/api/stock-movements?page=2&limit=50
```

**Branch Filter**
```
GET {{baseURL}}/api/stock-movements?branch_id=7&page=1&limit=25
GET {{baseURL}}/api/stock-movements?branchId=7&page=1&limit=25
```

**Type Filter**
```
GET {{baseURL}}/api/stock-movements?type=purchase&page=1&limit=25
GET {{baseURL}}/api/stock-movements?type=sale&page=1&limit=25
GET {{baseURL}}/api/stock-movements?type=transfer_out&page=1&limit=25
GET {{baseURL}}/api/stock-movements?type=transfer_in&page=1&limit=25
GET {{baseURL}}/api/stock-movements?type=adjustment&page=1&limit=25
GET {{baseURL}}/api/stock-movements?type=reversal&page=1&limit=25
```

**Status Filter**
```
GET {{baseURL}}/api/stock-movements?status=completed&page=1&limit=25
GET {{baseURL}}/api/stock-movements?status=cancelled&page=1&limit=25
GET {{baseURL}}/api/stock-movements?status=reversed&page=1&limit=25
```

**Item Filter**
```
GET {{baseURL}}/api/stock-movements?item_id=15&page=1&limit=25
GET {{baseURL}}/api/stock-movements?itemId=15&page=1&limit=25
```

**Combined Filters**
```
GET {{baseURL}}/api/stock-movements?branch_id=7&type=purchase&status=completed&page=1&limit=25
GET {{baseURL}}/api/stock-movements?item_id=15&type=sale&page=1&limit=25
GET {{baseURL}}/api/stock-movements?branch_id=7&item_id=15&type=adjustment&page=1&limit=25
```

#### Response Format

```json
{
  "success": true,
  "message": "Stock movements fetched successfully",
  "data": [
    {
      "id": 1,
      "company_id": 7,
      "branch_id": 7,
      "item_id": 15,
      "batch_id": 14,
      "batch_number": "PRMTHSH0SSSSA011-20251114-059",
      "transaction_id": 1,
      "transfer_id": null,
      "type": "purchase",
      "quantity": "100.000",
      "previous_stock": "0.000",
      "new_stock": "100.000",
      "status": "completed",
      "created_at": "2025-11-15T09:00:37.071Z"
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 1,
    "totalItems": 10,
    "itemsPerPage": 25,
    "hasNextPage": false,
    "hasPrevPage": false,
    "nextPage": null,
    "prevPage": null
  },
  "metadata": {
    "request_id": "a175c1c4-bf27-4476-b30b-5299ce2c8939",
    "timestamp": "2025-11-15T08:11:28.904Z"
  }
}
```

### Get One Stock Movement

**Endpoint**: `GET /api/stock-movements/:id`

**Description**: Retrieve a single stock movement by ID.

#### Example Request

```
GET {{baseURL}}/api/stock-movements/1
```

---

## Branch Stocks

### Get All Branch Stocks

**Endpoint**: `GET /api/branch-stocks`

**Description**: Retrieve a paginated list of branch stocks with optional filtering and sorting.

#### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page` | number | No | Page number (default: 1) |
| `limit` | number | No | Items per page (default: 25) |
| `branch_id` | number | No | Filter by branch ID |
| `item_id` | number | No | Filter by item ID |
| `status` | string | No | Filter by status |
| `low_stock_status` | string | No | Filter by low stock status: `inactive`, `critical`, `ignored`, `new` |
| `search` | string | No | Search in item name or branch name |
| `sort_by` | string | No | Sort field: `created_at`, `total_quantity`, `low_stock_threshold` (default: `created_at`) |
| `sort_order` | string | No | Sort order: `asc` or `desc` (default: `desc`) |

#### Example Requests

**Basic Pagination**
```
GET {{baseURL}}/api/branch-stocks?page=1&limit=25
GET {{baseURL}}/api/branch-stocks?page=2&limit=50
```

**Branch Filter**
```
GET {{baseURL}}/api/branch-stocks?branch_id=7&page=1&limit=25
```

**Item Filter**
```
GET {{baseURL}}/api/branch-stocks?item_id=15&page=1&limit=25
```

**Status Filter**
```
GET {{baseURL}}/api/branch-stocks?status=active&page=1&limit=25
```

**Low Stock Status Filter**
```
GET {{baseURL}}/api/branch-stocks?low_stock_status=critical&page=1&limit=25
GET {{baseURL}}/api/branch-stocks?low_stock_status=inactive&page=1&limit=25
GET {{baseURL}}/api/branch-stocks?low_stock_status=ignored&page=1&limit=25
GET {{baseURL}}/api/branch-stocks?low_stock_status=new&page=1&limit=25
```

**Search**
```
GET {{baseURL}}/api/branch-stocks?search=shirt&page=1&limit=25
GET {{baseURL}}/api/branch-stocks?search=Main Branch&page=1&limit=25
```

**Sorting**
```
GET {{baseURL}}/api/branch-stocks?sort_by=total_quantity&sort_order=asc&page=1&limit=25
GET {{baseURL}}/api/branch-stocks?sort_by=total_quantity&sort_order=desc&page=1&limit=25
GET {{baseURL}}/api/branch-stocks?sort_by=low_stock_threshold&sort_order=asc&page=1&limit=25
GET {{baseURL}}/api/branch-stocks?sort_by=created_at&sort_order=desc&page=1&limit=25
```

**Combined Filters**
```
GET {{baseURL}}/api/branch-stocks?branch_id=7&low_stock_status=critical&page=1&limit=25
GET {{baseURL}}/api/branch-stocks?item_id=15&search=shirt&sort_by=total_quantity&sort_order=desc&page=1&limit=25
GET {{baseURL}}/api/branch-stocks?branch_id=7&low_stock_status=critical&sort_by=total_quantity&sort_order=asc&page=1&limit=25
```

#### Response Format

```json
{
  "success": true,
  "message": "Branch stock fetched successfully",
  "data": [
    {
      "id": 34,
      "company_id": 7,
      "branch_id": 7,
      "item_id": 15,
      "total_quantity": "1654.000",
      "low_stock_threshold": "0.000",
      "low_stock_status": "new",
      "location": null,
      "created_at": "2025-11-14T05:59:54.704Z",
      "updated_at": "2025-11-15T08:01:52.759Z",
      "created_by": 2,
      "updated_by": 2,
      "branch_stock_batches": [
        {
          "id": 34,
          "batch_id": 14,
          "quantity": "980.000",
          "last_used_at": "2025-11-14T05:59:54.720Z",
          "batches": {
            "batch_number": "PRMTHSH0SSSSA011-20251114-059",
            "batch_name": "PRMTHSH0SSSSA011-20251114-059",
            "expiration_date": null
          }
        }
      ]
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 1,
    "totalItems": 4,
    "itemsPerPage": 25,
    "hasNextPage": false,
    "hasPrevPage": false,
    "nextPage": null,
    "prevPage": null
  },
  "metadata": {
    "request_id": "731c5f08-623a-4732-b571-442a7edf5673",
    "timestamp": "2025-11-15T08:11:47.938Z"
  }
}
```

### Get One Branch Stock

**Endpoint**: `GET /api/branch-stocks/:id`

**Description**: Retrieve a single branch stock by ID with all batches.

#### Example Request

```
GET {{baseURL}}/api/branch-stocks/34
```

---

## Batches

### Get All Batches

**Endpoint**: `GET /api/batches`

**Description**: Retrieve a paginated list of batches with optional filtering and sorting.

#### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page` | number | No | Page number (default: 1) |
| `limit` | number | No | Items per page (default: 25) |
| `item_id` | number | No | Filter by item ID |
| `search` | string | No | Search in batch_number or batch_name |
| `is_active` | boolean | No | Filter by active status (true/false) |
| `sort_by` | string | No | Sort field: `created_at`, `batch_number`, `batch_name` (default: `created_at`) |
| `sort_order` | string | No | Sort order: `asc` or `desc` (default: `desc`) |

#### Example Requests

**Basic Pagination**
```
GET {{baseURL}}/api/batches?page=1&limit=25
GET {{baseURL}}/api/batches?page=2&limit=50
```

**Item Filter**
```
GET {{baseURL}}/api/batches?item_id=15&page=1&limit=25
```

**Search**
```
GET {{baseURL}}/api/batches?search=PURCHASE-BATCH-001&page=1&limit=25
GET {{baseURL}}/api/batches?search=CONSOLIDATED&page=1&limit=25
```

**Active Status Filter**
```
GET {{baseURL}}/api/batches?is_active=true&page=1&limit=25
GET {{baseURL}}/api/batches?is_active=false&page=1&limit=25
```

**Sorting**
```
GET {{baseURL}}/api/batches?sort_by=batch_number&sort_order=asc&page=1&limit=25
GET {{baseURL}}/api/batches?sort_by=batch_number&sort_order=desc&page=1&limit=25
GET {{baseURL}}/api/batches?sort_by=batch_name&sort_order=asc&page=1&limit=25
GET {{baseURL}}/api/batches?sort_by=created_at&sort_order=desc&page=1&limit=25
```

**Combined Filters**
```
GET {{baseURL}}/api/batches?item_id=15&is_active=true&page=1&limit=25
GET {{baseURL}}/api/batches?search=BATCH&is_active=true&sort_by=batch_number&sort_order=asc&page=1&limit=25
GET {{baseURL}}/api/batches?item_id=15&search=CONSOLIDATED&sort_by=created_at&sort_order=desc&page=1&limit=25
```

#### Response Format

```json
{
  "success": true,
  "message": "Batches fetched successfully",
  "data": [
    {
      "id": 28,
      "company_id": 7,
      "item_id": 15,
      "batch_number": "PRMTHSH0SSSSA011-20251115-183",
      "batch_name": "new Batch Name11",
      "expiration_date": null,
      "manufacturing_date": null,
      "cost_price": null,
      "supplier_batch_number": null,
      "notes": null,
      "is_active": true,
      "created_at": "2025-11-15T08:01:52.756Z",
      "updated_at": "2025-11-15T08:01:52.756Z",
      "created_by": 2,
      "updated_by": null,
      "item_name": "Premium T-Shirt"
    }
  ],
  "pagination": {
    "currentPage": 1,
    "totalPages": 1,
    "totalItems": 13,
    "itemsPerPage": 25,
    "hasNextPage": false,
    "hasPrevPage": false,
    "nextPage": null,
    "prevPage": null
  },
  "metadata": {
    "request_id": "a175c1c4-bf27-4476-b30b-5299ce2c8939",
    "timestamp": "2025-11-15T08:11:28.904Z"
  }
}
```

### Get One Batch

**Endpoint**: `GET /api/batches/:id`

**Description**: Retrieve a single batch by ID.

#### Example Request

```
GET {{baseURL}}/api/batches/28
```

---

## Common Response Structure

All GET endpoints return responses in the following format:

### Success Response

```json
{
  "success": true,
  "message": "Resource fetched successfully",
  "data": [ /* array for getAll, object for getOne */ ],
  "pagination": { /* only for getAll endpoints */ },
  "metadata": {
    "request_id": "uuid",
    "timestamp": "ISO 8601 date string"
  }
}
```

### Error Response

```json
{
  "success": false,
  "error": {
    "message": "Error message",
    "statusCode": 400,
    "type": "VALIDATION_ERROR"
  },
  "metadata": {
    "request_id": "uuid",
    "timestamp": "ISO 8601 date string"
  }
}
```

## Pagination Object

The pagination object is included in all `getAll` responses:

```json
{
  "currentPage": 1,
  "totalPages": 5,
  "totalItems": 123,
  "itemsPerPage": 25,
  "hasNextPage": true,
  "hasPrevPage": false,
  "nextPage": 2,
  "prevPage": null
}
```

## Notes

1. **Authentication**: All endpoints require a valid JWT token in the `Authorization` header: `Bearer <token>`

2. **Company & Branch Context**: The API automatically uses the company and branch from the authenticated user's context. Some filters allow overriding the branch context.

3. **Query Parameter Format**: 
   - Use snake_case (e.g., `branch_id`) or camelCase (e.g., `branchId`) - both are supported
   - Boolean values: use `true` or `false` as strings
   - Date values: use ISO 8601 format (e.g., `2025-11-15` or `2025-11-15T00:00:00Z`)

4. **Default Values**:
   - `page`: defaults to 1
   - `limit`: defaults to 25
   - `sort_order`: defaults to `desc` (except where specified)
   - `sort_by`: defaults to `created_at` (except where specified)

5. **Search Behavior**: 
   - Text search is case-insensitive
   - Uses "contains" matching (partial matches)
   - Multiple fields are searched simultaneously (OR logic)

6. **Filter Combinations**: All filters can be combined. Multiple filters use AND logic.

7. **Response Fields**: 
   - All IDs are numbers
   - Decimal values are returned as strings (e.g., `"1654.000"`)
   - Dates are in ISO 8601 format
   - Nullable fields may be `null`


