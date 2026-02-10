/// Simple route names constants
class RouteName {
  RouteName._();
  
  // Essential routes only
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String validateOtp = '/validate-otp';
  static const String resetPassword = '/reset-password';
  static const String verifyAccount = '/verify-account';
  static const String home = '/home';
  static const String sell = '/sell';
  static const String stock = '/stock';
  static const String transaction = '/transaction'; // Transaction list screen
  static const String transactionForm = '/transaction/create'; // Transaction form screen
  static const String transactionDetail = '/transaction/detail'; // Transaction detail screen
  static const String cartScreen = '/transaction/cart'; // Cart screen for selecting items
  static const String transfer = '/transfer'; // Transfer list screen
  static const String transferForm = '/transfer/create'; // Transfer form screen
  static const String transferDetail = '/transfer/detail'; // Transfer detail screen
  static const String companies = '/companies';
  static const String branches = '/branches';
  static const String settings = '/settings';
  static const String company = '/company';
  static const String customers = '/customers';
  static const String suppliers = '/suppliers';
  static const String supplierCustomerDetail = '/supplier-customer/detail/:id';
  
  /// Helper method to build supplier/customer detail path with ID
  static String supplierCustomerDetailPath(String id) => '/supplier-customer/detail/$id';
  static const String categories = '/categories';
  static const String subCategories = '/sub-categories';
  static const String units = '/units';
  static const String brands = '/brands';
  static const String models = '/models';
  static const String items = '/items';
  static const String itemDetail = '/item-detail';
  static const String batchItems = '/batch-items';
  /// Batches for a specific item. Pass [Item] via [extra] when pushing.
  static const String batchList = '/batch-list';
  /// Batch detail. Pass [BatchEntity] via [extra] when pushing.
  static const String batchDetail = '/batch-detail';
  /// Batch transfer form. Pass [Item] via [extra] when pushing.
  static const String batchTransferForm = '/batch-transfer';
  /// Batch consolidation form. Pass [Item] via [extra] when pushing.
  static const String batchConsolidationForm = '/batch-consolidation';
  /// Batch split form. Pass [Item] via [extra] when pushing.
  static const String batchSplitForm = '/batch-split';
  static const String banks = '/banks';
  static const String stocks = '/stocks';
  static const String stockDetail = '/stock-detail';
  static const String stockMovementDetail = '/stock-movement-detail';
  static const String roles = '/roles';
  static const String users = '/users';
  static const String employees = '/employees';
  static const String expenses = '/expenses';
  static const String expenseDetail = '/expenses/detail';
  static const String expenseForm = '/expenses/create';
  static const String expenseUpdate = '/expenses/update';
  static const String reports = '/reports';
  static const String salesReport = '/reports/sales';
  static const String annualReport = '/reports/annual';
  static const String bestSellerReport = '/reports/best-seller';
  static const String customerReport = '/reports/customer';
  static const String expenseReport = '/reports/expense';
  static const String profitLossReport = '/reports/profit-loss';
  static const String purchaseReport = '/reports/purchase';
  static const String help = '/help';
  static const String profile = '/profile';
}
