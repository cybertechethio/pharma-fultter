# Authentication System Implementation Guide for Web Team

This document provides a comprehensive guide to how authentication works in the Flutter mobile app, designed to help the web development team implement a similar system.

## Table of Contents

1. [Overview](#overview)
2. [Authentication Flow](#authentication-flow)
3. [Data Storage](#data-storage)
4. [Navigation System](#navigation-system)
5. [Token Management](#token-management)
6. [API Integration](#api-integration)
7. [State Management](#state-management)
8. [Error Handling](#error-handling)
9. [Key Implementation Details](#key-implementation-details)

---

## Overview

The authentication system follows a **Clean Architecture** pattern with clear separation between:
- **Presentation Layer**: UI screens and state management
- **Domain Layer**: Business logic and use cases
- **Data Layer**: API calls and local storage

### Key Components

1. **AuthNotifier**: Manages authentication state (Riverpod provider)
2. **AuthRepository**: Handles authentication operations
3. **AuthLocalDataSource**: Manages local storage (tokens, user data)
4. **AuthRemoteDataSource**: Handles API communication
5. **AuthInterceptor**: Automatically adds tokens to API requests
6. **AuthSessionService**: Handles session expiration

---

## Authentication Flow

### 1. Login Flow

```
User Input (Phone/Email + Password)
    ↓
LoginScreen validates form
    ↓
AuthNotifier.login() called
    ↓
LoginUseCase.execute()
    ↓
AuthRepository.loginUser()
    ↓
AuthRemoteDataSource.loginUser() → API Call
    ↓
API Response (GenericResponseModel)
    ↓
Repository saves to local storage:
    - Tokens (access_token, refresh_token)
    - User data
    - Current context (company_id, branch_id)
    - Companies list
    - Branches list
    ↓
AuthNotifier updates state to "authenticated"
    ↓
LoginScreen listens to state change
    ↓
Navigation: context.go(RouteName.home)
```

#### Login API Request

**Endpoint**: `POST /auth/login`

**Request Body**:
```json
{
  "identifier": "user@example.com" or "+1234567890",
  "password": "userpassword"
}
```

**Response Structure**:
```json
{
  "success": true,
  "message": "Login successful",
  "data": {
    "user": {
      "id": "user_id",
      "email": "user@example.com",
      "phone": "+1234567890",
      "first_name": "John",
      "last_name": "Doe",
      "profile_picture": "url_or_null"
    },
    "tokens": {
      "access_token": "jwt_access_token",
      "refresh_token": "jwt_refresh_token"
    },
    "current_context": {
      "current_company_id": "company_id",
      "current_branch_id": "branch_id"
    },
    "companies": [...],
    "branches": [...]
  },
  "metadata": {...}
}
```

### 2. Registration Flow

```
User Input (Email, Phone, Password, First Name, Last Name)
    ↓
RegistrationScreen validates form
    ↓
AuthNotifier.register() called
    ↓
RegisterUseCase.execute()
    ↓
AuthRepository.register()
    ↓
AuthRemoteDataSource.registerUser() → API Call
    ↓
API Response (UserModel)
    ↓
AuthNotifier updates state to "registered"
    ↓
Navigation: context.push(RouteName.verifyAccount, extra: identifier)
```

#### Registration API Request

**Endpoint**: `POST /auth/register`

**Request Body**:
```json
{
  "email": "user@example.com",
  "phone": "+1234567890",
  "password": "userpassword",
  "first_name": "John",
  "last_name": "Doe"
}
```

**Response Structure**:
```json
{
  "success": true,
  "message": "Registration successful",
  "data": {
    "user": {
      "id": "user_id",
      "email": "user@example.com",
      "phone": "+1234567890",
      "first_name": "John",
      "last_name": "Doe"
    }
  },
  "metadata": {...}
}
```

### 3. Account Verification Flow

After registration, users must verify their account with OTP:

```
User enters OTP
    ↓
VerifyAccountScreen submits OTP
    ↓
AuthNotifier.verifyAccount() called
    ↓
VerifyAccountUseCase.execute()
    ↓
AuthRepository.verifyAccount()
    ↓
API Call → Success
    ↓
Repository saves tokens, user, context, companies, branches
    ↓
AuthNotifier updates state to "accountVerified"
    ↓
Navigation: context.go(RouteName.home)
```

#### Verify Account API Request

**Endpoint**: `POST /auth/verify-account`

**Request Body**:
```json
{
  "identifier": "user@example.com" or "+1234567890",
  "otp": "123456"
}
```

**Response**: Same structure as login response (includes tokens)

### 4. Logout Flow

```
User clicks logout
    ↓
AuthNotifier.logout() called
    ↓
LogoutUseCase.execute()
    ↓
AuthRepository.logoutUser()
    ↓
API Call to logout endpoint
    ↓
Repository clears local storage:
    - Tokens
    - User data
    - Current context
    - Companies
    - Branches
    ↓
AuthNotifier updates state to "unauthenticated"
    ↓
Navigation: context.go(RouteName.login)
```

#### Logout API Request

**Endpoint**: `POST /auth/logout`

**Request**: Empty body (uses Bearer token from header)

**Response**: UserModel

---

## Data Storage

### Storage Technologies

1. **FlutterSecureStorage**: For sensitive data (tokens)
   - Uses platform-specific secure storage
   - iOS: Keychain
   - Android: EncryptedSharedPreferences

2. **SharedPreferences**: For non-sensitive data (user, context, companies, branches)
   - Simple key-value storage
   - JSON serialization for complex objects

### Stored Data Structure

#### 1. Tokens (FlutterSecureStorage)

**Keys**:
- `access_token`: JWT access token
- `refresh_token`: JWT refresh token

**Storage**:
```dart
await storage.write(key: 'access_token', value: tokens.accessToken);
await storage.write(key: 'refresh_token', value: tokens.refreshToken);
```

**Retrieval**:
```dart
final accessToken = await storage.read(key: 'access_token');
final refreshToken = await storage.read(key: 'refresh_token');
```

#### 2. User Data (SharedPreferences)

**Key**: `user_data`

**Storage Format** (JSON):
```json
{
  "id": "user_id",
  "email": "user@example.com",
  "phone": "+1234567890",
  "first_name": "John",
  "last_name": "Doe",
  "profile_picture": "url_or_null"
}
```

**Storage**:
```dart
final userJson = jsonEncode(userModel.toJson());
await prefs.setString('user_data', userJson);
```

**Retrieval**:
```dart
final userJson = prefs.getString('user_data');
final userMap = jsonDecode(userJson) as Map<String, dynamic>;
final user = UserModel.fromJson(userMap);
```

#### 3. Current Context (SharedPreferences)

**Key**: `current_context`

**Storage Format** (JSON):
```json
{
  "current_company_id": "company_id",
  "current_branch_id": "branch_id"
}
```

**Storage**:
```dart
final contextJson = jsonEncode(contextModel.toJson());
await prefs.setString('current_context', contextJson);
```

#### 4. Companies List (SharedPreferences)

**Key**: `companies`

**Storage Format** (JSON Array):
```json
[
  {
    "id": "company_id",
    "name": "Company Name",
    ...
  }
]
```

#### 5. Branches List (SharedPreferences)

**Key**: `branches`

**Storage Format** (JSON Array):
```json
[
  {
    "id": "branch_id",
    "name": "Branch Name",
    "company_id": "company_id",
    ...
  }
]
```

### Data Clearing on Logout

When user logs out, all stored data is cleared:

```dart
await storage.delete(key: 'access_token');
await storage.delete(key: 'refresh_token');
await prefs.remove('user_data');
await prefs.remove('current_context');
await prefs.remove('companies');
await prefs.remove('branches');
```

---

## Navigation System

### Router Configuration

The app uses **GoRouter** for navigation. Routes are defined in `app_router.dart`.

### Auth Routes

```dart
// Login
RouteName.login → '/login' → LoginScreen

// Registration
RouteName.register → '/register' → RegistrationScreen

// Forgot Password
RouteName.forgotPassword → '/forgot-password' → ForgotPasswordScreen

// Validate OTP (for password reset)
RouteName.validateOtp → '/validate-otp' → ValidateOtpScreen(phoneNumber)

// Reset Password
RouteName.resetPassword → '/reset-password' → ResetPasswordScreen(identifier, resetToken)

// Verify Account (after registration)
RouteName.verifyAccount → '/verify-account' → VerifyAccountScreen(identifier)

// Home (authenticated)
RouteName.home → '/home' → HomeScreen
```

### Navigation Methods

1. **context.go()**: Replaces current route (used for auth redirects)
   ```dart
   context.go(RouteName.home);  // Navigate to home, replace login
   ```

2. **context.push()**: Pushes new route (used for drill-in navigation)
   ```dart
   context.push(RouteName.register);  // Push registration, can go back
   ```

3. **context.pop()**: Returns to previous route
   ```dart
   context.pop();  // Go back
   ```

### Navigation Flow Examples

#### Login Success Navigation

```dart
// In LoginScreen
ref.listen<AsyncValue<AuthState>>(authProvider, (previous, next) {
  next.whenOrNull(
    data: (state) {
      state.whenOrNull(
        authenticated: (message, user, tokens) {
          snackbar.showSuccess(message);
          context.go(RouteName.home);  // Navigate to home
        },
      );
    },
  );
});
```

#### Registration → Verification Navigation

```dart
// In RegistrationScreen
ref.listen<AsyncValue<AuthState>>(authProvider, (previous, next) {
  next.whenOrNull(
    data: (state) {
      state.whenOrNull(
        registered: (message, user) {
          snackbar.showSuccess(message);
          context.push(
            RouteName.verifyAccount,
            extra: user.email,  // Pass identifier
          );
        },
      );
    },
  );
});
```

#### Logout Navigation

```dart
// In any authenticated screen
ref.listen<AsyncValue<AuthState>>(authProvider, (previous, next) {
  next.whenOrNull(
    data: (state) {
      state.whenOrNull(
        unauthenticated: (message) {
          snackbar.showSuccess(message);
          context.go(RouteName.login);  // Navigate to login
        },
      );
    },
  );
});
```

### Route Constants

All route paths are defined as constants in `route_name.dart`:

```dart
class RouteName {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  // ... etc
}
```

**Important**: Never hardcode route strings. Always use `RouteName` constants.

---

## Token Management

### Automatic Token Injection

The `AuthInterceptor` automatically adds the access token to all API requests:

```dart
// In AuthInterceptor.onRequest()
final token = await _authLocalDataSource.getAccessToken();
if (token != null && token.isNotEmpty) {
  options.headers['Authorization'] = 'Bearer $token';
}
```

### Context Headers

The interceptor also adds current context headers to all requests:

```dart
final currentContext = await _authLocalDataSource.getCurrentContext();
if (currentContext != null) {
  options.headers['current_company_id'] = currentContext.currentCompanyId;
  options.headers['current_branch_id'] = currentContext.currentBranchId;
}
```

### Token Refresh Flow

When an API request returns **401 Unauthorized**, the interceptor automatically attempts to refresh the token:

```
API Request → 401 Unauthorized
    ↓
AuthInterceptor.onError() triggered
    ↓
Check if refresh token exists
    ↓
Call refresh token API
    ↓
Save new tokens to storage
    ↓
Retry original request with new token
    ↓
If refresh fails:
    - Clear all tokens
    - Trigger logout
    - Navigate to login
```

#### Refresh Token API Request

**Endpoint**: `POST /auth/refresh`

**Request Body**:
```json
{
  "refresh_token": "jwt_refresh_token"
}
```

**Response**:
```json
{
  "access_token": "new_jwt_access_token",
  "refresh_token": "new_jwt_refresh_token"
}
```

### Auth Endpoints (No Token Required)

These endpoints skip authentication:

- `/auth/login`
- `/auth/register`
- `/auth/register-user`
- `/auth/forgot-password`
- `/auth/reset-password`
- `/auth/verify-account`
- `/auth/resend-otp`
- `/auth/validate-otp`
- `/auth/refresh`

All other endpoints require authentication.

---

## API Integration

### API Response Structure

All API responses follow a consistent structure:

```json
{
  "success": true/false,
  "message": "Response message",
  "data": { ... },  // Actual data (type varies)
  "metadata": {
    "timestamp": "...",
    "version": "..."
  }
}
```

**Error Response**:
```json
{
  "success": false,
  "error": {
    "message": "Error message",
    "statusCode": 400,
    "code": "ERROR_CODE"
  },
  "metadata": { ... }
}
```

### Request Wrapping

All API requests are automatically wrapped with `RequestWrapper`:

```dart
// Request data
{
  "identifier": "user@example.com",
  "password": "password"
}

// Automatically wrapped to:
{
  "data": {
    "identifier": "user@example.com",
    "password": "password"
  }
}
```

### API Service Methods

1. **POST**: `ApiService.post(endpoint, data: {...})`
2. **GET**: `ApiService.get(endpoint)`
3. **PUT**: `ApiService.put(endpoint, data: {...})`
4. **DELETE**: `ApiService.delete(endpoint, data: {...})`
5. **File Upload**: `ApiService.uploadFile(endpoint, filePath, fieldName)`

### Error Handling

API errors are mapped to `Failure` types:

```dart
// Network errors
Failure.networkError(message)

// Server errors
Failure.serverError(message)

// Storage errors
Failure.storageError(message)

// Unexpected errors
Failure.unexpectedError(message)
```

---

## State Management

### Auth State Structure

The authentication state is managed using **Riverpod** with a sealed class pattern:

```dart
sealed class AuthState {
  // Initial state
  initial()
  
  // Loading state
  loading(message: "Loading...")
  
  // Authenticated state
  authenticated(message, user, tokens)
  
  // Unauthenticated state
  unauthenticated(message)
  
  // Registered state
  registered(message, user)
  
  // Account verified state
  accountVerified(message, user, tokens)
  
  // Error state
  error(failure)
  
  // ... other states
}
```

### State Provider

```dart
@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<AuthState> build() async {
    return const AuthState.initial();
  }
  
  Future<void> login({required String identifier, required String password}) async {
    state = const AsyncValue.data(AuthState.loading(message: 'Logging in...'));
    
    final useCase = ref.read(loginUseCaseProvider);
    final result = await useCase.call(identifier: identifier, password: password);
    
    result.fold(
      (failure) => state = AsyncValue.data(AuthState.error(failure: failure)),
      (data) => state = AsyncValue.data(AuthState.authenticated(
        message: 'Login successful!',
        user: data.user,
        tokens: data.tokens,
      )),
    );
  }
}
```

### Listening to State Changes

Screens listen to auth state changes and react accordingly:

```dart
// In LoginScreen
ref.listen<AsyncValue<AuthState>>(authProvider, (previous, next) {
  next.whenOrNull(
    data: (state) {
      state.whenOrNull(
        authenticated: (message, user, tokens) {
          // Show success message
          snackbar.showSuccess(message);
          // Navigate to home
          context.go(RouteName.home);
        },
        error: (failure) {
          // Show error message
          snackbar.showError(failure);
        },
      );
    },
  );
});
```

### Loading States

Screens can check loading state:

```dart
final authState = ref.watch(authProvider).value;

// Check if loading
if (authState is AuthLoading) {
  // Show loading indicator
  isLoading = true;
  loadingMessage = authState.message;
}
```

---

## Error Handling

### Error Types

1. **Network Errors**: Connection issues, timeouts
2. **Server Errors**: 4xx, 5xx status codes
3. **Storage Errors**: Local storage failures
4. **Validation Errors**: Form validation failures
5. **Unexpected Errors**: Unknown errors

### Error Display

Errors are displayed using `SnackbarService`:

```dart
final snackbar = ref.read(snackbarServiceProvider);

// Show error
snackbar.showError(failure);

// Show success
snackbar.showSuccess(message);

// Show warning
snackbar.showWarning(message);

// Show info
snackbar.showInfo(message);
```

### Error Handling in Use Cases

Use cases return `Either<Failure, Success>`:

```dart
Future<Either<Failure, User>> loginUser(...) async {
  try {
    // API call
    final response = await _repository.loginUser(...);
    return Right(user);
  } on ApiException catch (e) {
    return Left(Failure.serverError(e.message));
  } catch (e) {
    return Left(Failure.unexpectedError(e.toString()));
  }
}
```

### Error Handling in UI

```dart
final result = await useCase.call(...);

result.fold(
  (failure) {
    // Handle error
    snackbar.showError(failure);
  },
  (success) {
    // Handle success
    snackbar.showSuccess('Success!');
  },
);
```

---

## Key Implementation Details

### 1. Clean Architecture Flow

```
UI Screen
    ↓
AuthNotifier (State Management)
    ↓
UseCase (Business Logic)
    ↓
Repository (Data Access)
    ↓
DataSource (API/Storage)
    ↓
API Service / Local Storage
```

### 2. Data Persistence

- **Tokens**: Stored in secure storage (encrypted)
- **User Data**: Stored in SharedPreferences (JSON)
- **Context**: Stored in SharedPreferences (JSON)
- **Companies/Branches**: Stored in SharedPreferences (JSON Array)

### 3. Token Refresh Strategy

- Automatic refresh on 401 errors
- Retry original request after refresh
- Logout if refresh fails
- No manual refresh needed

### 4. Session Management

- Session expiration handled by `AuthSessionService`
- Automatic logout on token refresh failure
- Navigation to login on session expiration

### 5. Context Management

- Current company and branch stored locally
- Sent as headers in every API request
- Updated when user switches company/branch
- Cleared on logout

### 6. Form Validation

- Client-side validation before API calls
- Phone number validation
- Email validation
- Password validation
- Error messages displayed inline

### 7. Loading States

- Loading indicators during API calls
- Disabled buttons during operations
- Loading messages for user feedback

### 8. Success/Error Feedback

- Success messages via snackbar
- Error messages via snackbar
- Inline form validation errors
- Toast notifications for important actions

---

## Web Implementation Recommendations

### 1. Storage Equivalents

**Flutter → Web**:
- `FlutterSecureStorage` → `localStorage` or `sessionStorage` (for tokens)
- `SharedPreferences` → `localStorage` (for user data, context)

**Security Note**: For web, consider using `httpOnly` cookies for tokens instead of localStorage to prevent XSS attacks.

### 2. State Management

**Flutter (Riverpod) → Web**:
- React: Use Context API, Redux, or Zustand
- Vue: Use Pinia or Vuex
- Angular: Use Services with RxJS

### 3. HTTP Interceptors

**Flutter (Dio Interceptor) → Web**:
- React: Use Axios interceptors
- Vue: Use Axios interceptors
- Angular: Use HTTP Interceptors

### 4. Navigation

**Flutter (GoRouter) → Web**:
- React: Use React Router
- Vue: Use Vue Router
- Angular: Use Angular Router

### 5. API Response Handling

Use the same response structure:
```typescript
interface ApiResponse<T> {
  success: boolean;
  message: string;
  data: T;
  metadata: {
    timestamp: string;
    version: string;
  };
}
```

### 6. Token Management

- Store tokens securely (httpOnly cookies recommended for web)
- Implement automatic token refresh
- Handle 401 errors with token refresh
- Clear tokens on logout

### 7. Context Headers

Always include context headers in authenticated requests:
```typescript
headers: {
  'Authorization': `Bearer ${accessToken}`,
  'current_company_id': currentCompanyId,
  'current_branch_id': currentBranchId
}
```

---

## API Endpoints Summary

### Authentication Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/auth/login` | User login | No |
| POST | `/auth/register` | User registration | No |
| POST | `/auth/logout` | User logout | Yes |
| POST | `/auth/refresh` | Refresh token | No |
| POST | `/auth/forgot-password` | Request password reset | No |
| POST | `/auth/reset-password` | Reset password | No |
| POST | `/auth/verify-account` | Verify account with OTP | No |
| POST | `/auth/resend-otp` | Resend OTP | No |
| POST | `/auth/validate-otp` | Validate OTP | No |

### User Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/user/profile` | Get current user | Yes |
| PUT | `/user/profile` | Update profile | Yes |
| POST | `/user/password-change` | Change password | Yes |
| DELETE | `/user/account` | Delete account | Yes |
| POST | `/user/profile-image` | Upload profile picture | Yes |

### Context Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/company/switch-company` | Switch company | Yes |
| POST | `/branch/switch-branch` | Switch branch | Yes |

---

## Testing Recommendations

### Test Cases to Implement

1. **Login Flow**
   - Valid credentials → Success
   - Invalid credentials → Error
   - Network error → Error handling
   - Token storage verification

2. **Registration Flow**
   - Valid data → Success
   - Invalid data → Validation errors
   - Duplicate email/phone → Error

3. **Token Refresh**
   - 401 error → Automatic refresh
   - Refresh success → Retry request
   - Refresh failure → Logout

4. **Session Management**
   - Token expiration → Logout
   - Session expiration → Redirect to login

5. **Data Persistence**
   - Login → Data saved
   - Logout → Data cleared
   - App restart → Data restored

---

## Conclusion

This authentication system provides:

- ✅ Secure token storage
- ✅ Automatic token refresh
- ✅ Persistent user sessions
- ✅ Context management (company/branch)
- ✅ Comprehensive error handling
- ✅ Clean architecture separation
- ✅ Type-safe state management

For web implementation, adapt the storage mechanisms and state management to your framework while maintaining the same logical flow and API integration patterns.

