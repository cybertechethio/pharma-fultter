# Reports API — Response only

Base path: `/api/reports`. All endpoints: GET. Auth required. Branch required.

---

## GET /api/reports/sales

```json
{
  "success": true,
  "message": "Sales report fetched successfully",
  "data": {
    "items": [
      {
        "id": 1,
        "transactionNumber": "TXN-001",
        "date": "2024-01-15T10:30:00.000Z",
        "customerId": 5,
        "customerName": "Customer X",
        "itemId": 1,
        "itemName": "Paracetamol 500mg",
        "itemCode": "ITEM-001",
        "quantity": 10,
        "unitPrice": 100,
        "costPrice": 80,
        "subtotal": 1000,
        "taxAmount": 80,
        "totalAmount": 1080,
        "paymentMethod": "cash",
        "branchId": 2,
        "branchName": "Main Branch",
        "sku": "SKU-001",
        "category": "Medication",
        "brand": "Brand A",
        "imageUrl": null,
        "instockQty": 50
      }
    ],
    "summary": {
      "totalSales": 10800,
      "totalQuantity": 100,
      "totalTax": 800,
      "totalDiscount": 0,
      "transactionCount": 10,
      "averageTransactionValue": 1080
    }
  },
  "pagination": {
    "currentPage": 1,
    "totalPages": 1,
    "totalItems": 10,
    "itemsPerPage": 25,
    "hasNextPage": false,
    "hasPreviousPage": false,
    "nextPage": null,
    "prevPage": null
  },
  "metadata": {
    "requestId": "uuid",
    "timestamp": "2024-01-15T10:30:00.000Z"
  }
}
```

---

## GET /api/reports/best-seller

```json
{
  "success": true,
  "message": "Best seller report fetched successfully",
  "data": [
    {
      "id": 1,
      "itemId": 1,
      "itemName": "Paracetamol 500mg",
      "itemCode": "ITEM-001",
      "sku": "SKU-001",
      "category": "Medication",
      "brand": "Brand A",
      "imageUrl": null,
      "soldQty": 150,
      "soldAmount": 15000,
      "instockQty": 50
    }
  ],
  "metadata": {
    "requestId": "uuid",
    "timestamp": "2024-01-15T10:30:00.000Z"
  }
}
```

---

## GET /api/reports/purchase

```json
{
  "success": true,
  "message": "Purchase report fetched successfully",
  "data": {
    "items": [
      {
        "id": 1,
        "transactionNumber": "TXN-P-001",
        "date": "2024-01-15T10:30:00.000Z",
        "supplierId": 3,
        "supplierName": "Supplier Y",
        "itemId": 1,
        "itemName": "Paracetamol 500mg",
        "itemCode": "ITEM-001",
        "quantity": 100,
        "unitPrice": 80,
        "costPrice": 75,
        "subtotal": 8000,
        "taxAmount": 0,
        "totalAmount": 8000,
        "paymentMethod": "bankTransfer",
        "branchId": 2,
        "branchName": "Main Branch",
        "sku": "SKU-001",
        "category": "Medication",
        "brand": "Brand A",
        "imageUrl": null,
        "instockQty": 150
      }
    ],
    "summary": {
      "totalPurchases": 80000,
      "totalQuantity": 1000,
      "totalAmount": 80000,
      "totalPaid": 75000,
      "totalUnpaid": 5000,
      "overdue": 0
    }
  },
  "pagination": {
    "currentPage": 1,
    "totalPages": 1,
    "totalItems": 10,
    "itemsPerPage": 25,
    "hasNextPage": false,
    "hasPreviousPage": false,
    "nextPage": null,
    "prevPage": null
  },
  "metadata": {
    "requestId": "uuid",
    "timestamp": "2024-01-15T10:30:00.000Z"
  }
}
```

---

## GET /api/reports/customer

```json
{
  "success": true,
  "message": "Customer report fetched successfully",
  "data": {
    "items": [
      {
        "id": 1,
        "reference": "CUST-001",
        "code": "CUST-001",
        "customerId": 5,
        "customerName": "Customer X",
        "customerImageUrl": null,
        "totalOrders": 20,
        "totalAmount": 20000,
        "paidAmount": 18000,
        "dueAmount": 2000
      }
    ],
    "summary": {
      "totalCustomers": 50,
      "totalOrders": 500,
      "totalAmount": 500000,
      "totalPaid": 480000,
      "totalUnpaid": 20000,
      "totalToPayCustomers": 5000,
      "totalCustomersOweUs": 25000,
      "netBalance": -20000
    }
  },
  "pagination": {
    "currentPage": 1,
    "totalPages": 2,
    "totalItems": 50,
    "itemsPerPage": 25,
    "hasNextPage": true,
    "hasPreviousPage": false,
    "nextPage": 2,
    "prevPage": null
  },
  "metadata": {
    "requestId": "uuid",
    "timestamp": "2024-01-15T10:30:00.000Z"
  }
}
```

---

## GET /api/reports/customer-due

```json
{
  "success": true,
  "message": "Customer due report fetched successfully",
  "data": [
    {
      "id": 1,
      "reference": "CUST-001",
      "code": "CUST-001",
      "customerId": 5,
      "customerName": "Customer X",
      "customerImageUrl": null,
      "totalOrders": 10,
      "totalAmount": 10000,
      "paidAmount": 8000,
      "dueAmount": 2000
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 30,
    "total": 10,
    "totalPages": 1
  },
  "summary": {
    "totalCustomers": 10,
    "totalOrders": 100,
    "totalAmount": 100000,
    "totalDue": 20000,
    "totalPaid": 80000,
    "totalToPayCustomers": 0,
    "totalCustomersOweUs": 20000,
    "netBalance": -20000
  },
  "metadata": {
    "timestamp": "2024-01-15T10:30:00.000Z"
  }
}
```

---

## GET /api/reports/expense

```json
{
  "success": true,
  "message": "Expense report fetched successfully",
  "data": {
    "items": [
      {
        "id": 1,
        "expenseName": "Office supplies",
        "description": "Monthly restock",
        "date": "2024-01-15",
        "amount": 1500,
        "paymentMethod": "cash"
      }
    ],
    "summary": {
      "totalExpenses": 50,
      "totalAmount": 75000,
      "averageExpense": 1500,
      "largestExpense": 5000
    }
  },
  "pagination": {
    "currentPage": 1,
    "totalPages": 1,
    "totalItems": 50,
    "itemsPerPage": 25,
    "hasNextPage": false,
    "hasPreviousPage": false,
    "nextPage": null,
    "prevPage": null
  },
  "metadata": {
    "requestId": "uuid",
    "timestamp": "2024-01-15T10:30:00.000Z"
  }
}
```

---

## GET /api/reports/annual

```json
{
  "success": true,
  "message": "Annual report fetched successfully",
  "data": {
    "report": {
      "startDate": "2024-01-01",
      "endDate": "2024-12-31",
      "items": [
        {
          "sales": 1200000,
          "cost": 800000,
          "vat": 80000,
          "grossProfit": 320000
        }
      ],
      "totals": {
        "sales": 1200000,
        "cost": 800000,
        "vat": 80000,
        "grossProfit": 320000
      },
      "expenses": 50000,
      "netProfit": 270000
    },
    "charts": {
      "salesProfitTrend": {
        "months": [
          {
            "month": "2024-01",
            "sales": 100000,
            "profit": 25000
          }
        ]
      },
      "itemTypesBreakdown": {
        "direct": {
          "sales": 1200000,
          "cost": 800000,
          "grossProfit": 320000
        },
        "processed": {
          "sales": 0,
          "cost": 0,
          "grossProfit": 0
        }
      }
    }
  },
  "metadata": {
    "requestId": "uuid",
    "timestamp": "2024-01-15T10:30:00.000Z"
  }
}
```

---

## GET /api/reports/profit-loss

```json
{
  "success": true,
  "message": "Profit-loss report fetched successfully",
  "data": {
    "report": {
      "date": "2024-01-15",
      "items": [
        {
          "sales": 10800,
          "cost": 8000,
          "vat": 800,
          "grossProfit": 2000
        }
      ],
      "totals": {
        "sales": 10800,
        "cost": 8000,
        "vat": 800,
        "grossProfit": 2000
      }
    },
    "graph": {
      "granularity": "days",
      "days": [
        {
          "date": "2024-01-15",
          "sales": 10800,
          "profit": 2000
        }
      ]
    },
    "graph10Days": {
      "granularity": "days",
      "days": [
        {
          "date": "2024-01-06",
          "sales": 5000,
          "profit": 1000
        }
      ]
    },
    "graphDateRange": {
      "granularity": "days",
      "days": [
        {
          "date": "2024-01-15",
          "sales": 10800,
          "profit": 2000
        }
      ]
    }
  },
  "metadata": {
    "requestId": "uuid",
    "timestamp": "2024-01-15T10:30:00.000Z"
  }
}
```

---

## GET /api/reports/daily-sales

```json
{
  "success": true,
  "message": "Daily sales report fetched successfully",
  "data": {
    "data": [
      {
        "date": "2024-01-15",
        "sales": 50000,
        "purchases": 20000,
        "expenses": 5000,
        "cash": 25000,
        "paymentMethods": {
          "sales": {
            "cash": 30000,
            "telebirr": 10000,
            "mPesa": 5000,
            "bankTransfer": [
              { "bankName": "Bank A", "amount": 5000 }
            ],
            "check": 0,
            "other": 0
          },
          "purchases": {
            "cash": 5000,
            "telebirr": 0,
            "mPesa": 0,
            "bankTransfer": [
              { "bankName": "Bank A", "amount": 15000 }
            ],
            "check": 0,
            "other": 0
          },
          "expenses": {
            "cash": 5000,
            "telebirr": 0,
            "mPesa": 0,
            "bankTransfer": [],
            "check": 0,
            "other": 0
          }
        }
      }
    ],
    "summary": {
      "totalSales": 500000,
      "totalPurchases": 200000,
      "totalExpenses": 50000,
      "totalCash": 250000
    }
  },
  "metadata": {
    "requestId": "uuid",
    "timestamp": "2024-01-15T10:30:00.000Z"
  }
}
```
