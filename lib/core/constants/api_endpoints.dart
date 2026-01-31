import '../../app/config/env_config.dart';

/// API endpoint constants
/// 
/// This class contains all API endpoint paths used throughout the application.
/// All endpoints are relative to the base URL defined in EnvConfig.
class ApiEndpoints {
  // Private constructor to prevent instantiation
  ApiEndpoints._();

  /// Base URL from environment configuration
  static String get baseUrl => EnvConfig.apiBaseUrl;

  // ==================== AUTHENTICATION ENDPOINTS ====================
  
  /// Authentication base path
  static const String auth = '/auth';
  
  /// User login endpoint
  static const String login = '$auth/login';
  
  /// User registration endpoint
  static const String register = '$auth/register';
  
  /// User registration with detailed info endpoint
  static const String registerUser = '$auth/register-user';
  
  /// User logout endpoint
  static const String logout = '$auth/logout';
  
  /// Refresh token endpoint
  static const String refreshToken = '$auth/refresh';
  
  /// Forgot password endpoint
  static const String forgotPassword = '$auth/forgot-password';
  
  /// Reset password endpoint
  static const String resetPassword = '$auth/reset-password';
  
  /// Verify email endpoint
  static const String verifyEmail = '$auth/verify-email';

  /// Verify phone endpoint
  static const String verifyPhone = '$auth/verify-phone';
  
  /// Verify account endpoint (email or phone)
  static const String verifyAccount = '$auth/verify-account';
  
  /// Resend verification email endpoint
  static const String resendVerification = '$auth/resend-verification';
  
  /// Resend OTP endpoint
  static const String resendOtp = '$auth/resend-otp';
  
  /// Validate OTP endpoint
  static const String validateOtp = '$auth/validate-otp';

  // ==================== USER ENDPOINTS ====================
  
  /// User profile base path
  static const String user = '/user';
  
  /// Get current user profile
  static const String profile = '$user/profile';
  
  /// Get current user (alias for profile)
  static const String getCurrentUser = '$user/profile';
  
  /// Update user profile
  static const String updateProfile = '$user/profile';
  
  /// Change password
  static const String changePassword = '$user/password-change';
  
  /// Delete user account
  static const String deleteAccount = '$user/account';
  
  /// Upload profile image
  static const String uploadProfileImage = '$user/profile-image';

  // ==================== CONTEXT SWITCHING ENDPOINTS ====================
  
  /// Switch company endpoint
  static const String switchCompany = '/company/switch-company';
  
  /// Switch branch endpoint
  static const String switchBranch = '/branch/switch-branch';

  // ==================== SETTINGS ENDPOINTS ====================
  
  /// Settings base path
  static const String settings = '/settings';
  
  /// Get user settings
  static const String getUserSettings = settings;
  
  /// Update user settings
  static const String updateUserSettings = settings;
  
  /// Get app preferences
  static const String preferences = '$settings/preferences';
  
  /// Update app preferences
  static const String updatePreferences = '$settings/preferences';

  // ==================== AUDIO ENDPOINTS ====================
  
  /// Audio base path
  static const String audio = '/audio';
  
  /// Upload audio file
  static const String uploadAudio = '$audio/upload';
  
  /// Get user audio files
  static const String getUserAudio = '$audio/user';
  
  /// Delete audio file
  static String deleteAudio(String audioId) => '$audio/$audioId';
  
  /// Get audio file details
  static String getAudioDetails(String audioId) => '$audio/$audioId';

  // ==================== COMPANY ENDPOINTS ====================
  
  /// Company base path
  static const String company = '/company';
  
  /// Get all user companies
  static const String getCompanies = company;
  
  /// Create new company
  static const String createCompany = company;
  
  /// Update company
  static String updateCompany(String companyId) => '$company/$companyId';
  
  /// Delete company
  static String deleteCompany(String companyId) => '$company/$companyId';
  
  /// Get company settings
  static const String getSetting = '$company/setting';
  
  /// Update company settings
  static const String updateSetting = '$company/setting';

  // ==================== BRANCH ENDPOINTS ====================
  
  /// Branch base path
  static const String branch = '/branch';
  
  /// Get all branches
  static const String getBranches = '/branch';
  
  /// Create new branch
  static const String createBranch = '/branch';
  
  /// Update branch
  static String updateBranch(String branchId) => '/branch/$branchId';
  
  /// Delete branch
  static String deleteBranch(String branchId) => '/branch/$branchId';

  // ==================== SUPPLIER_CUSTOMER ENDPOINTS ====================
  /// Supplier/Customer base path
  static const String supplierCustomers = '/customer-suppliers';

  /// Get all supplier/customers
  static const String getSupplierCustomers = supplierCustomers;

  /// Create supplier/customer
  static const String createSupplierCustomer = supplierCustomers;

  /// Update supplier/customer
  static String updateSupplierCustomer(String id) => '$supplierCustomers/$id';

  /// Delete supplier/customer
  static String deleteSupplierCustomer(String id) => '$supplierCustomers/$id';

  // ==================== CATEGORY ENDPOINTS ====================
  /// Category base path
  static const String categories = '/categories';

  /// Get all categories
  static const String getCategories = categories;

  /// Create category
  static const String createCategory = categories;

  /// Update category
  static String updateCategory(String id) => '$categories/$id';

  /// Delete category
  static String deleteCategory(String id) => '$categories/$id';

  // ==================== EXPENSE CATEGORY ENDPOINTS ====================

  /// Expense Category base path
  static const String expenseCategories = '/expenses/categories';

  /// Get all expense categories
  static const String getExpenseCategories = expenseCategories;

  /// Create expense category
  static const String createExpenseCategory = expenseCategories;

  /// Update expense category
  static String updateExpenseCategory(String id) => '$expenseCategories/$id';

  /// Delete expense category
  static String deleteExpenseCategory(String id) => '$expenseCategories/$id';

  // ==================== EXPENSE ENDPOINTS ====================

  /// Expense base path
  static const String expenses = '/expenses';

  /// Get all expenses
  static const String getExpenses = expenses;

  /// Get expense by ID
  static String getExpenseById(String id) => '$expenses/$id';

  /// Create expense
  static const String createExpense = expenses;

  /// Update expense
  static String updateExpense(String id) => '$expenses/$id';

  /// Delete expense
  static String deleteExpense(String id) => '$expenses/$id';

  // ==================== EXPENSE PAYMENT METHODS ENDPOINTS ====================

  /// Update expense payment method
  static String updateExpensePaymentMethod(String expenseId, String paymentMethodId) =>
      '$expenses/$expenseId/payment-methods/$paymentMethodId';

  /// Create expense payment method
  static String createExpensePaymentMethod(String expenseId) =>
      '$expenses/$expenseId/payment-methods';



  /// Delete expense payment method
  static String deleteExpensePaymentMethod(String expenseId, String paymentMethodId) =>
      '$expenses/$expenseId/payment-methods/$paymentMethodId';

  // ==================== SUB-CATEGORY ENDPOINTS ====================
  /// Sub-Category base path
  static const String subCategories = '/sub-categories';

  /// Get all sub-categories
  static const String getSubCategories = subCategories;

  /// Create sub-category
  static const String createSubCategory = subCategories;

  /// Update sub-category
  static String updateSubCategory(String id) => '$subCategories/$id';

  /// Delete sub-category
  static String deleteSubCategory(String id) => '$subCategories/$id';

  // ==================== UNIT ENDPOINTS ====================
  /// Unit base path
  static const String units = '/units';

  /// Get all units
  static const String getUnits = units;

  /// Create unit
  static const String createUnit = units;

  /// Update unit
  static String updateUnit(String id) => '$units/$id';

  /// Delete unit
  static String deleteUnit(String id) => '$units/$id';

  // ==================== BRAND ENDPOINTS ====================
  /// Brand base path
  static const String brands = '/brands';

  /// Get all brands
  static const String getBrands = brands;

  /// Create brand
  static const String createBrand = brands;

  /// Update brand
  static String updateBrand(String id) => '$brands/$id';

  /// Delete brand
  static String deleteBrand(String id) => '$brands/$id';

  // ==================== MODEL ENDPOINTS ====================
  /// Model base path
  static const String models = '/models';

  /// Get all models
  static const String getModels = models;

  /// Create model
  static const String createModel = models;

  /// Update model
  static String updateModel(String id) => '$models/$id';

  /// Delete model
  static String deleteModel(String id) => '$models/$id';

  // ==================== ITEM ENDPOINTS ====================
  /// Item base path
  static const String items = '/items';

  /// Get all items
  static const String getItems = items;

  /// Create item
  static const String createItem = items;

  /// Update item
  static String updateItem(String id) => '$items/$id';

  /// Delete item
  static String deleteItem(String id) => '$items/$id';

  // ==================== BATCH ENDPOINTS ====================
  /// Batch base path
  static const String batches = '/batches';

  /// Get all batches
  static const String getBatches = batches;

  /// Create batch
  static const String createBatch = batches;

  /// Update batch
  static String updateBatch(String id) => '$batches/$id';

  // ==================== STOCK ENDPOINTS ====================
  /// Stock base path
  static const String branchStocks = '/branch-stocks';

  /// Get all stocks
  static const String getStocks = branchStocks;

  // ==================== TRANSACTION ENDPOINTS ====================
  /// Transaction base path
  static const String transactions = '/transactions';

  /// Get all transactions
  static const String getTransactions = transactions;

  /// Get transaction detail by ID
  static String getTransactionDetail(int id) => '$transactions/$id';

  /// Create transaction
  static const String createTransaction = transactions;

  // ==================== TRANSFER ENDPOINTS ====================
  /// Transfer base path
  static const String transfers = '/transfers';

  /// Get all transfers
  static const String getTransfers = transfers;

  /// Get transfer detail by ID
  static String getTransferDetail(int id) => '$transfers/$id';

  /// Create transfer
  static const String createTransfer = transfers;

  // ==================== BANK ENDPOINTS ====================
  /// Bank base path
  static const String banks = '/banks';

  /// Get all banks
  static const String getBanks = banks;

  /// Create bank
  static const String createBank = banks;

  /// Update bank
  static String updateBank(int id) => '$banks/$id';

  /// Delete bank
  static String deleteBank(int id) => '$banks/$id';

  // ==================== ROLE ENDPOINTS ====================
  /// Role base path
  static const String roles = '/roles/company';

  /// Get all roles
  static const String getRoles = roles;

  /// Create role
  static const String createRole = roles;

  /// Update role
  static String updateRole(int id) => '$roles/$id';

  /// Delete role
  static String deleteRole(int id) => '$roles/$id';

  // ==================== PERMISSION ENDPOINTS ====================
  /// Permission base path
  static const String permissions = '/permissions';

  /// Get all permissions
  static const String getPermissions = permissions;

  // ==================== USER ENDPOINTS ====================
  /// User base path
  static const String users = '/company/user';

  /// Get all users
  static const String getUsers = users;

  /// Create user
  static const String createUser = users;

  /// Update user
  static String updateUser(int id) => '$users/$id';

  /// Delete user
  static String deleteUser(int id) => '$users/$id';

  // ==================== USER ROLE ENDPOINTS ====================
  /// User role base path
  static const String userRoles = '/users/roles';

  /// Get user role assignments
  static String getUserRoleAssignments(int userId) => '$userRoles/$userId';

  /// Assign user roles to branches
  static const String assignUserRoles = userRoles;

  // ==================== CALENDAR ENDPOINTS ====================
  
  /// Calendar base path
  static const String calendar = '/calendar';
  
  /// Get calendar events
  static const String events = '$calendar/events';
  
  /// Create calendar event
  static const String createEvent = '$calendar/events';
  
  /// Update calendar event
  static String updateEvent(String eventId) => '$calendar/events/$eventId';
  
  /// Delete calendar event
  static String deleteEvent(String eventId) => '$calendar/events/$eventId';
  
  /// Get calendar settings
  static const String calendarSettings = '$calendar/settings';
  
  /// Update calendar settings
  static const String updateCalendarSettings = '$calendar/settings';

  // ==================== UTILITY ENDPOINTS ====================
  
  /// Health check endpoint
  static const String health = '/health';
  
  /// App version check
  static const String version = '/version';
  
  /// Server status
  static const String status = '/status';
  
  /// File upload endpoint (generic)
  static const String upload = '/upload';
  
  /// File uploads endpoint (dedicated upload endpoint)
  static const String uploads = '/uploads';
  
  /// File download endpoint (generic)
  static String download(String fileId) => '/download/$fileId';

  // ==================== HELPER METHODS ====================
  
  /// Build full URL for an endpoint
  static String buildUrl(String endpoint) {
    return '$baseUrl$endpoint';
  }
  
  /// Build URL with query parameters
  static String buildUrlWithParams(String endpoint, Map<String, dynamic> params) {
    final uri = Uri.parse('$baseUrl$endpoint');
    return uri.replace(queryParameters: params.map((k, v) => MapEntry(k, v.toString()))).toString();
  }
  
  /// Build URL with path parameters
  static String buildUrlWithPath(String endpoint, Map<String, String> pathParams) {
    String url = '$baseUrl$endpoint';
    pathParams.forEach((key, value) {
      url = url.replaceAll('{$key}', value);
    });
    return url;
  }
}