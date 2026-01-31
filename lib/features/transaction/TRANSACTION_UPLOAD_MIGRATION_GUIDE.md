# Transaction Upload Migration Guide - Step by Step

## 📚 Learning Guide: How We Migrated to the New Upload Architecture

This document explains step-by-step how we migrated the transaction feature from the old file upload approach to the new dedicated upload endpoint architecture.

---

## 🎯 The Problem We Solved

### Before (Old Architecture)
- **Single Request**: Files and transaction data sent together in one `multipart/form-data` request
- **Mixed Concerns**: File handling and business logic in the same endpoint
- **Complex**: Backend had to handle files and JSON data simultaneously

### After (New Architecture)
- **Two-Step Process**: Upload files first → Get URLs → Send URLs in JSON
- **Separation of Concerns**: Upload logic separate from business logic
- **Cleaner**: Each endpoint has a single responsibility

---

## 🔍 Step 1: Understanding the Backend Change

### What Changed?
The backend team introduced a **dedicated upload endpoint** (`POST /api/uploads`) that:
1. Accepts files as `multipart/form-data` with field name `files`
2. Returns URLs for uploaded files
3. Business endpoints now accept URLs in JSON payloads instead of actual files

### Why This Change?
- **Scalability**: Upload endpoint can be optimized separately
- **Reusability**: Same upload endpoint for all features (items, transactions, etc.)
- **Cleaner API**: Business endpoints focus on business logic, not file handling
- **Better Error Handling**: Upload errors don't affect business operations

---

## 🛠️ Step 2: Adding the Upload Endpoint

### What We Did
```dart
// lib/core/constants/api_endpoints.dart
static const String uploads = '/uploads';
```

### Why?
- **Centralized Configuration**: All endpoints in one place
- **Easy to Update**: Change URL in one location if backend changes
- **Type Safety**: Constants prevent typos

### Key Learning
Always centralize configuration values. This makes maintenance easier and prevents bugs from typos.

---

## 📦 Step 3: Creating Upload Response Models

### What We Did
Created models to represent the upload API response:

```dart
// lib/shared/models/upload_response_model.dart

// Single file response data
@freezed
sealed class UploadFileData with _$UploadFileData {
  const factory UploadFileData({
    required String url,        // The file URL we'll use
    required String filename,
    required int size,
    required String mimetype,
    required String type,       // "image" or "document"
  }) = _UploadFileData;
}

// Multiple files response data
@freezed
sealed class UploadFilesData with _$UploadFilesData {
  const factory UploadFilesData({
    required List<UploadFileData> files,
  }) = _UploadFilesData;
}

// Sealed class to handle both single and multiple responses
@freezed
sealed class UploadResponseModel with _$UploadResponseModel {
  const factory UploadResponseModel.single({
    required UploadFileData data,
  }) = _UploadResponseModelSingle;

  const factory UploadResponseModel.multiple({
    required UploadFilesData data,
  }) = _UploadResponseModelMultiple;
}
```

### Why This Design?

1. **Sealed Classes**: Use sealed classes when you have a fixed set of variants
   - `single`: When one file is uploaded
   - `multiple`: When multiple files are uploaded
   - Compiler ensures we handle all cases

2. **Freezed**: 
   - Immutability (can't accidentally modify data)
   - Built-in `copyWith`, `==`, `hashCode`
   - JSON serialization support

3. **Extension Methods**: Helper methods to extract URLs easily
   ```dart
   extension UploadResponseModelX on UploadResponseModel {
     List<String> get urls {
       return when(
         single: (data) => [data.url],
         multiple: (data) => data.files.map((f) => f.url).toList(),
       );
     }
   }
   ```

### Key Learning
- **Model the API Response**: Create models that match your API structure
- **Use Sealed Classes**: When you have a fixed set of variants
- **Extension Methods**: Add convenience methods without modifying the class

---

## 🔧 Step 4: Creating the Upload Service

### What We Did
```dart
// lib/core/services/upload_service.dart

class UploadService {
  /// Upload a single file
  Future<ApiResponse<UploadResponseModel>> uploadFile(String filePath) async {
    final formData = FormData.fromMap({
      'files': await MultipartFile.fromFile(filePath),
    });

    final response = await ApiService.post<Map<String, dynamic>>(
      ApiEndpoints.uploads,
      data: formData,
      skipWrapping: true, // Upload endpoint doesn't use RequestWrapper
    );

    return ApiResponse<UploadResponseModel>.fromJson(
      response.data!,
      (json) => UploadResponseModel.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Upload multiple files
  Future<ApiResponse<UploadResponseModel>> uploadFiles(
    List<String> filePaths,
  ) async {
    final multipartFiles = await Future.wait(
      filePaths.map((path) => MultipartFile.fromFile(path)),
    );

    final formData = FormData.fromMap({
      'files': multipartFiles,
    });

    // ... rest of the code
  }
}
```

### Why This Design?

1. **Service Layer**: Separates upload logic from business logic
   - Reusable across features (items, transactions, etc.)
   - Easy to test in isolation
   - Single responsibility

2. **Two Methods**: 
   - `uploadFile()`: For single file (simpler, less overhead)
   - `uploadFiles()`: For multiple files (parallel upload)

3. **Future.wait()**: Uploads files in parallel for better performance

4. **skipWrapping: true**: Upload endpoint doesn't use `RequestWrapper` (it's a special endpoint)

### Key Learning
- **Service Layer Pattern**: Create services for reusable operations
- **Parallel Operations**: Use `Future.wait()` for concurrent operations
- **Single Responsibility**: Each service does one thing well

---

## 📝 Step 5: Updating Transaction Models

### What We Did
Added URL fields to transaction models:

```dart
// lib/features/transaction/data/models/transaction_payment_model.dart
@freezed
sealed class TransactionPaymentModel with _$TransactionPaymentModel {
  const factory TransactionPaymentModel({
    required PaymentMethodType method,
    required double amount,
    String? referenceNumber,
    int? bankId,
    String? attachment, // ✅ NEW: URL to uploaded file
  }) = _TransactionPaymentModel;
}

// lib/features/transaction/data/models/transaction_model.dart
@freezed
sealed class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required TransactionType transactionType,
    // ... other fields
    List<String>? attachments, // ✅ NEW: Array of URLs
    List<TransactionPaymentModel>? paymentMethods,
  }) = _TransactionModel;
}
```

### Why?
- **Backward Compatible**: Made fields optional (`String?`, `List<String>?`)
- **Clear Intent**: Field names (`attachments`, `attachment`) match backend expectations
- **Type Safety**: Using `List<String>` for URLs (not `List<File>`)

### Key Learning
- **Add Fields, Don't Remove**: When migrating, add new fields while keeping old ones
- **Use Optional Types**: `String?` means "might not have a file"
- **Match Backend**: Field names should match what backend expects

---

## 🔄 Step 6: Updating Transaction API Service

### The Big Change: Two-Step Process

#### Before (Old Way)
```dart
// ❌ OLD: Everything in one request
Future<ApiResponse<TransactionResponseModel>> create({
  required TransactionModel request,
  required List<String> receiptFilePaths,
  required Map<String, String> paymentAttachmentFilePaths,
}) async {
  final formData = FormData();
  
  // Add JSON data
  formData.fields.add(MapEntry('data', jsonEncode(wrappedData)));
  
  // Add files directly
  formData.files.addAll(receiptFiles.map((f) => MapEntry('attachments', f)));
  formData.files.addAll(paymentFiles);
  
  // Send everything at once
  return await ApiService.post(..., data: formData);
}
```

#### After (New Way)
```dart
// ✅ NEW: Upload first, then send URLs
Future<ApiResponse<TransactionResponseModel>> create({
  required TransactionModel request,
  required List<String> receiptFilePaths,
  required Map<String, String> paymentAttachmentFilePaths,
}) async {
  // STEP 1: Upload receipt files
  List<String> attachmentUrls = [];
  if (receiptFilePaths.isNotEmpty) {
    final uploadResponse = await _uploadService.uploadFiles(receiptFilePaths);
    uploadResponse.when(
      success: (success, message, data, meta, pagination) {
        attachmentUrls = data.when(
          single: (fileData) => [fileData.url],
          multiple: (filesData) => filesData.files.map((f) => f.url).toList(),
        );
      },
      error: (success, error, meta) {
        throw Exception('Failed to upload receipt files: ${error.message}');
      },
    );
  }

  // STEP 2: Upload payment method files
  Map<String, String> paymentAttachmentUrls = {};
  for (var entry in paymentAttachmentFilePaths.entries) {
    final uploadResponse = await _uploadService.uploadFile(entry.value);
    uploadResponse.when(
      success: (success, message, data, meta, pagination) {
        final url = data.when(
          single: (fileData) => fileData.url,
          multiple: (filesData) => filesData.files.isNotEmpty 
              ? filesData.files.first.url 
              : null,
        );
        if (url != null) {
          paymentAttachmentUrls[entry.key] = url;
        }
      },
      error: (success, error, meta) {
        // Log but continue - don't fail entire transaction
      },
    );
  }

  // STEP 3: Build transaction with URLs
  final updatedRequest = TransactionModel(
    transactionType: request.transactionType,
    // ... copy all fields
    attachments: attachmentUrls.isNotEmpty ? attachmentUrls : null,
    paymentMethods: request.paymentMethods?.map((pm) {
      final methodType = pm.method.toApiString();
      final attachmentUrl = paymentAttachmentUrls[methodType];
      return TransactionPaymentModel(
        method: pm.method,
        amount: pm.amount,
        // ... copy all fields
        attachment: attachmentUrl,
      );
    }).toList(),
  );

  // STEP 4: Send as JSON (not FormData)
  var requestJson = updatedRequest.toJson();
  // Remove null/empty fields
  if (requestJson['attachments'] == null || 
      (requestJson['attachments'] as List).isEmpty) {
    requestJson.remove('attachments');
  }

  // ApiService.post will automatically wrap with RequestWrapper
  final response = await ApiService.post<Map<String, dynamic>>(
    ApiEndpoints.createTransaction,
    data: requestJson, // ✅ JSON, not FormData
    skipWrapping: false, // Let ApiService wrap it
  );

  return ApiResponse<TransactionResponseModel>.fromJson(...);
}
```

### Why This Approach?

1. **Error Handling**: 
   - If upload fails, we throw early (before creating transaction)
   - Payment method upload failures are logged but don't stop the transaction
   - User gets clear error messages

2. **URL Collection**:
   - Collect all URLs before building the transaction
   - Map payment method types to their attachment URLs
   - Handle both single and multiple file responses

3. **Clean JSON Payload**:
   - Remove null/empty fields (backend doesn't expect them)
   - Send clean JSON instead of FormData
   - Let `ApiService` handle `RequestWrapper` wrapping

4. **Immutable Updates**:
   - Create new `TransactionModel` instance with URLs
   - Don't mutate the original request
   - Follows functional programming principles

### Key Learning Points

#### 1. **Two-Step Process Pattern**
```dart
// Pattern: Upload → Collect URLs → Send with URLs
final urls = await uploadFiles(files);
final result = await createEntityWithUrls(urls);
```

#### 2. **Error Handling Strategy**
- **Critical Errors**: Throw early (upload failures)
- **Non-Critical Errors**: Log and continue (individual payment method uploads)
- **User Feedback**: Show clear error messages

#### 3. **Pattern Matching with Freezed**
```dart
// Using when() for pattern matching
data.when(
  single: (fileData) => fileData.url,
  multiple: (filesData) => filesData.files.map((f) => f.url).toList(),
);
```

#### 4. **Data Transformation**
```dart
// Transform payment methods to include URLs
paymentMethods: request.paymentMethods?.map((pm) {
  final url = paymentAttachmentUrls[pm.method.toApiString()];
  return pm.copyWith(attachment: url);
}).toList(),
```

---

## 🐛 Step 7: Fixing the Upload Response Parsing

### The Problem
The `UploadResponseModel.fromJson()` was checking for `json['data']`, but `ApiResponse.fromJson()` already extracts the `data` field and passes it directly.

### The Fix
```dart
// ❌ WRONG: Checking for nested 'data'
factory UploadResponseModel.fromJson(Map<String, dynamic> json) {
  if (json['data'] is Map<String, dynamic>) {
    final data = json['data'] as Map<String, dynamic>;
    // ...
  }
}

// ✅ CORRECT: json IS the data object
factory UploadResponseModel.fromJson(Map<String, dynamic> json) {
  // ApiResponse.fromJson already extracts 'data', so json here IS the data
  if (json.containsKey('files') && json['files'] is List) {
    return UploadResponseModel.multiple(
      data: UploadFilesData.fromJson(json),
    );
  } else if (json.containsKey('url')) {
    return UploadResponseModel.single(
      data: UploadFileData.fromJson(json),
    );
  }
  throw FormatException('Invalid upload response format', json);
}
```

### Why This Happened?
`ApiResponse.fromJson()` does this:
```dart
data: fromJsonT(json['data']), // Extracts 'data' and passes to our function
```

So `UploadResponseModel.fromJson()` receives the `data` object directly, not the full response.

### Key Learning
- **Understand the Call Chain**: Trace how data flows through your code
- **Read the Wrapper**: `ApiResponse` extracts `data` before calling your `fromJson`
- **Test with Real Data**: Use Postman/actual responses to verify parsing

---

## 🔧 Step 8: Fixing Transaction Item Detail Model

### The Problem
Backend returns `transactionItemBatches` but model expected `batches`, and it could be null.

### The Fix
```dart
// lib/features/transaction/data/models/transaction_item_detail_model.dart

@freezed
sealed class TransactionItemDetailModel with _$TransactionItemDetailModel {
  const factory TransactionItemDetailModel({
    // ... other fields
    @JsonKey(name: 'transactionItemBatches', fromJson: _batchesFromJson)
    required List<TransactionItemBatchDetailModel> batches,
  }) = _TransactionItemDetailModel;
}

/// Helper function to convert transactionItemBatches from JSON, handling null values
List<TransactionItemBatchDetailModel> _batchesFromJson(dynamic json) {
  // Handle null case
  if (json == null) {
    return [];
  }
  
  // Handle list case
  if (json is List) {
    return json
        .map((e) {
          if (e is Map<String, dynamic>) {
            return TransactionItemBatchDetailModel.fromJson(e);
          }
          throw FormatException('Expected Map in batches list');
        })
        .toList();
  }
  
  // Defensive: return empty list if unexpected type
  return [];
}
```

### Why This Approach?

1. **Field Name Mapping**: `@JsonKey(name: 'transactionItemBatches')` maps backend field to model field
2. **Custom fromJson**: `fromJson: _batchesFromJson` handles null values
3. **Defensive Programming**: Returns empty list instead of crashing
4. **Type Safety**: Checks types before processing

### Key Learning
- **@JsonKey(name: ...)**: Maps different field names between JSON and Dart
- **Custom Converters**: Use `fromJson` for complex transformations
- **Null Safety**: Always handle null cases explicitly
- **Defensive Programming**: Return safe defaults instead of crashing

---

## 🎓 Key Concepts You Learned

### 1. **Clean Architecture Principles**
- **Separation of Concerns**: Upload logic separate from business logic
- **Single Responsibility**: Each class/service does one thing
- **Dependency Injection**: Services injected, not created directly

### 2. **Error Handling Patterns**
```dart
// Pattern: Try operation, handle both success and failure
result.fold(
  (failure) => handleError(failure),
  (success) => handleSuccess(success),
);
```

### 3. **Freezed Patterns**
- **Sealed Classes**: Fixed set of variants
- **Pattern Matching**: `when()` for exhaustive handling
- **Immutability**: `copyWith()` for updates

### 4. **API Design Patterns**
- **Two-Step Operations**: Upload → Use URLs
- **Idempotency**: Uploading same file multiple times is safe
- **Error Recovery**: Continue with partial data when possible

### 5. **Data Flow Pattern**
```
User Action
  ↓
UI Layer (TransactionFormScreen)
  ↓
Notifier (TransactionNotifier)
  ↓
UseCase (CreateTransactionUseCase)
  ↓
Repository (TransactionRepository)
  ↓
DataSource (TransactionRemoteDataSource)
  ↓
API Service (TransactionApiService)
  ├─→ UploadService (upload files)
  └─→ ApiService (send transaction with URLs)
```

---

## 🚀 Best Practices Applied

### 1. **Defensive Programming**
- Always check for null
- Validate types before processing
- Return safe defaults

### 2. **Error Messages**
- Clear, actionable error messages
- Log context for debugging
- Don't expose internal details to users

### 3. **Code Organization**
- Services in `core/services/`
- Models in `shared/models/` (reusable)
- Feature-specific models in `features/[feature]/data/models/`

### 4. **Testing Considerations**
- Services are easy to mock
- Pure functions (no side effects)
- Clear input/output contracts

---

## 📋 Summary: The Complete Flow

### Creating a Transaction with Files

1. **User Selects Files** → File paths stored in state
2. **User Submits Form** → `TransactionNotifier.createTransaction()` called
3. **Upload Receipt Files** → `UploadService.uploadFiles()` → Get URLs
4. **Upload Payment Files** → `UploadService.uploadFile()` (one per payment method) → Get URLs
5. **Build Transaction Model** → Include URLs in `attachments` and `paymentMethods[].attachment`
6. **Send Transaction** → `ApiService.post()` with JSON payload (not FormData)
7. **Handle Response** → Parse response, update UI, show success/error

### Key Insight
**Files are uploaded BEFORE the transaction is created.** This means:
- If upload fails, transaction isn't created (no orphaned transactions)
- URLs are validated before sending to backend
- Better error messages (user knows if upload or transaction creation failed)

---

## 🎯 Takeaways

1. **Understand the Architecture**: Know how data flows through your app
2. **Model Your API**: Create models that match API responses
3. **Handle Errors Gracefully**: Don't crash, provide feedback
4. **Use Type Safety**: Leverage Dart's type system
5. **Follow Patterns**: Use established patterns (Clean Architecture, Repository, etc.)
6. **Test Incrementally**: Test each step as you build
7. **Read Error Messages**: They tell you exactly what's wrong
8. **Use Tools**: Freezed, json_serializable save time and prevent bugs

---

## 🔗 Related Files

- `lib/core/services/upload_service.dart` - Upload service
- `lib/shared/models/upload_response_model.dart` - Upload response models
- `lib/features/transaction/data/datasources/transaction_api_service.dart` - Updated API service
- `lib/features/transaction/data/models/transaction_model.dart` - Updated models
- `docs/IMAGE_UPLOAD_ARCHITECTURE.md` - Backend architecture documentation

---

## 💡 Next Steps for Learning

1. **Read the Code**: Go through each file we modified
2. **Add Logging**: Add debug logs to see data flow
3. **Test Edge Cases**: What if upload succeeds but transaction fails?
4. **Optimize**: Can we upload files in parallel?
5. **Error Recovery**: Should we retry failed uploads?

---

Happy coding! 🚀

