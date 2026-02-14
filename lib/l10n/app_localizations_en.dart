// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Cyber Tech';

  @override
  String get appTitleWithPos => 'Cyber Tech POS';

  @override
  String get welcome => 'Welcome';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get brandColor => 'Brand Color';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get loading => 'Loading...';

  @override
  String get retry => 'Retry';

  @override
  String get close => 'Close';

  @override
  String greetingMessage(String userName) {
    return 'Hello, $userName!';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'No items',
    );
    return '$_temp0';
  }

  @override
  String get logout => 'Logout';

  @override
  String get login => 'Login';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get noAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get createAccount => 'Create Account';

  @override
  String get joinUsToday => 'Join Us Today';

  @override
  String get createAccountToGetStarted => 'Create your account to get started';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get companyName => 'Company Name';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get phoneNumberHint => '+251012001708';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Confirm your password';

  @override
  String get acceptTerms => 'I agree to the Terms and Conditions';

  @override
  String get termsDescription =>
      'By checking this box, you agree to our terms of service and privacy policy.';

  @override
  String get passwordStrength => 'Password Strength';

  @override
  String get registrationSuccessful => 'Registration Successful';

  @override
  String welcomeUser(String name) {
    return 'Welcome, $name!';
  }

  @override
  String get verifyAccount => 'Please verify your account:';

  @override
  String get checkEmailForVerification =>
      '• Check your email for verification link';

  @override
  String get checkPhoneForVerification =>
      '• Check your phone for verification code';

  @override
  String get canLoginNow => 'You can now log in with your credentials.';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get signIn => 'Sign In';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get welcomeBack => 'Welcome Back!';

  @override
  String get loginToContinue => 'Login to continue';

  @override
  String get emailHint => 'Enter your email';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get loginButton => 'Login';

  @override
  String get loggingIn => 'Logging in...';

  @override
  String get emailRequired => 'Email is required';

  @override
  String get invalidEmail => 'Please enter a valid email';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordMinLength => 'Password must be at least 6 characters';

  @override
  String get loginSuccess => 'Login successful!';

  @override
  String get loginFailed => 'Login failed';

  @override
  String get invalidCredentials => 'Invalid email or password';

  @override
  String get orLoginWith => 'Or login with';

  @override
  String get googleLogin => 'Google';

  @override
  String get facebookLogin => 'Facebook';

  @override
  String get appleLogin => 'Apple';

  @override
  String get socialLoginComingSoon => 'Social login coming soon';

  @override
  String get languageToggle => 'Toggle Language';

  @override
  String get continueAsGuest => 'Continue as Guest';

  @override
  String get calendar => 'Calendar';

  @override
  String get selectDate => 'Select Date';

  @override
  String get select => 'Select';

  @override
  String get gregorianCalendar => 'Gregorian Calendar';

  @override
  String get ethiopianCalendar => 'Ethiopian Calendar';

  @override
  String get calendarType => 'Calendar Type';

  @override
  String get today => 'Today';

  @override
  String get selectedDate => 'Selected Date';

  @override
  String get ethiopianMonthMeskerem => 'Meskerem';

  @override
  String get ethiopianMonthTikimt => 'Tikimt';

  @override
  String get ethiopianMonthHidar => 'Hidar';

  @override
  String get ethiopianMonthTahsas => 'Tahsas';

  @override
  String get ethiopianMonthTir => 'Tir';

  @override
  String get ethiopianMonthYekatit => 'Yekatit';

  @override
  String get ethiopianMonthMegabit => 'Megabit';

  @override
  String get ethiopianMonthMiazia => 'Miazia';

  @override
  String get ethiopianMonthGenbot => 'Genbot';

  @override
  String get ethiopianMonthSene => 'Sene';

  @override
  String get ethiopianMonthHamle => 'Hamle';

  @override
  String get ethiopianMonthNehasse => 'Nehasse';

  @override
  String get ethiopianMonthPagumen => 'Pagumen';

  @override
  String get dateRange => 'Date Range';

  @override
  String get selectDateRange => 'Select Date Range';

  @override
  String get startDate => 'Start Date';

  @override
  String get endDate => 'End Date';

  @override
  String get selectingStart => 'Selecting Start Date';

  @override
  String get selectingEnd => 'Selecting End Date';

  @override
  String get duration => 'Duration';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
      zero: '0 days',
    );
    return '$_temp0';
  }

  @override
  String get clearSelection => 'Clear Selection';

  @override
  String get selectRange => 'Select Range';

  @override
  String get defaultDate => 'Default Date';

  @override
  String get defaultStartDate => 'Default Start Date';

  @override
  String get setDefaultDate => 'Set Default Date';

  @override
  String get defaultDateDescription =>
      'This date will be used for dashboard and data filtering';

  @override
  String get noDefaultDate => 'No default date set';

  @override
  String get themeSettings => 'Theme Settings';

  @override
  String get languageSettings => 'Language Settings';

  @override
  String get dateSettings => 'Date Settings';

  @override
  String get appearance => 'Appearance';

  @override
  String get general => 'General';

  @override
  String get calendarDisplayType => 'Calendar Display';

  @override
  String get calendarDisplayDescription =>
      'Choose how dates are displayed throughout the app';

  @override
  String get autoDetect => 'Auto (Based on Language)';

  @override
  String get displayInGregorian => 'Always Gregorian';

  @override
  String get displayInEthiopian => 'Always Ethiopian';

  @override
  String get getStarted => 'Get Started';

  @override
  String get addItem => 'Add Item';

  @override
  String get browseItems => 'Browse Items';

  @override
  String get startShopping => 'Start Shopping';

  @override
  String get clearSearch => 'Clear Search';

  @override
  String get completeProfile => 'Complete Profile';

  @override
  String get networkError =>
      'Network connection failed. Please check your internet connection and try again.';

  @override
  String get serverError => 'Server error occurred. Please try again later.';

  @override
  String get notFound => 'Not Found';

  @override
  String get notFoundMessage => 'The requested content was not found.';

  @override
  String get permissionError =>
      'Permission denied. Please grant the required permissions to continue.';

  @override
  String get noItemsFound => 'No items found. Start by adding your first item.';

  @override
  String get noResultsFound =>
      'No results found. Try adjusting your search terms.';

  @override
  String get noFavoritesYet =>
      'No favorites yet. Start by adding items you love.';

  @override
  String get noNotificationsYet =>
      'No notifications yet. We\'ll notify you when something important happens.';

  @override
  String get cartEmpty => 'Your cart is empty. Add some items to get started.';

  @override
  String get profileIncomplete =>
      'Complete your profile to get the most out of the app.';

  @override
  String get loadingData => 'Loading data...';

  @override
  String get pleaseWait => 'Please wait...';

  @override
  String get required => 'Required';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get enterPassword => 'Enter Password';

  @override
  String get searchHint => 'Search...';

  @override
  String get searchByItemName => 'Search by item name...';

  @override
  String get selectOption => 'Select an option';

  @override
  String get search => 'Search';

  @override
  String get menu => 'Menu';

  @override
  String get back => 'Back';

  @override
  String get done => 'Done';

  @override
  String get edit => 'Edit';

  @override
  String get delete => 'Delete';

  @override
  String get share => 'Share';

  @override
  String get copy => 'Copy';

  @override
  String get paste => 'Paste';

  @override
  String get cut => 'Cut';

  @override
  String get selectAll => 'Select All';

  @override
  String get more => 'More';

  @override
  String get less => 'Less';

  @override
  String get showMore => 'Show More';

  @override
  String get showLess => 'Show Less';

  @override
  String get expand => 'Expand';

  @override
  String get collapse => 'Collapse';

  @override
  String get refresh => 'Refresh';

  @override
  String get filter => 'Filter';

  @override
  String get sort => 'Sort';

  @override
  String get view => 'View';

  @override
  String get details => 'Details';

  @override
  String get summary => 'Summary';

  @override
  String get preview => 'Preview';

  @override
  String get fullScreen => 'Full Screen';

  @override
  String get exitFullScreen => 'Exit Full Screen';

  @override
  String get welcomeToApp => 'Welcome to Cyber Tech';

  @override
  String get appName => 'SecureAuth';

  @override
  String get signInToContinue => 'Sign in to your account to continue';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get enterYourEmail => 'Enter your email';

  @override
  String get enterYourPassword => 'Enter your password';

  @override
  String get pleaseEnterPassword => 'Please enter your password';

  @override
  String get signingIn => 'Signing In...';

  @override
  String get or => 'OR';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get fullName => 'Full Name';

  @override
  String get byCreatingAccount => 'By creating an account, you agree to our';

  @override
  String get termsOfUse => 'Terms of Use';

  @override
  String get and => 'and';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get goToHome => 'Go to Home';

  @override
  String get loginAccount => 'Login to Your Account';

  @override
  String get enterPhone => 'Enter Phone Number';

  @override
  String get enterValidPhone => 'Please enter a valid phone number';

  @override
  String get enterValidPassword => 'Enter a valid password';

  @override
  String get loginWithGoogle => 'Login with Google';

  @override
  String get verifyAccountTitle => 'Verify Your Account';

  @override
  String verifyAccountSubtitle(String identifier) {
    return 'Enter the verification code sent to your $identifier';
  }

  @override
  String get validateOtpTitle => 'Validate OTP';

  @override
  String validateOtpSubtitle(String identifier) {
    return 'Enter the verification code sent to $identifier';
  }

  @override
  String get enterVerificationCode => 'Enter Verification Code';

  @override
  String get verificationCodeHint => 'Enter the 6-digit code';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get resendOtp => 'Resend OTP';

  @override
  String resendOtpIn(int seconds) {
    return 'Resend OTP in ${seconds}s';
  }

  @override
  String get otpRequired => 'Verification code is required';

  @override
  String get otpInvalid => 'Invalid verification code';

  @override
  String get otpExpired => 'Verification code has expired';

  @override
  String get verifyingAccount => 'Verifying account...';

  @override
  String get resendingOtp => 'Resending OTP...';

  @override
  String get accountVerifiedSuccess => 'Account verified successfully!';

  @override
  String get otpResentSuccess => 'OTP resent successfully!';

  @override
  String get verificationFailed => 'Verification failed';

  @override
  String get didntReceiveCode => 'Didn\'t receive the code?';

  @override
  String get checkSpamFolder => 'Check your spam folder or try resending';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your phone number to receive a password reset code';

  @override
  String get sendResetCode => 'Send Reset Code';

  @override
  String get sendingResetCode => 'Sending reset code...';

  @override
  String get resetCodeSent => 'Password reset code sent successfully!';

  @override
  String get enterPhoneForReset => 'Enter your phone number';

  @override
  String get editPhone => 'Edit Phone';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get resetPasswordSubtitle => 'Enter your new password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmNewPassword => 'Confirm New Password';

  @override
  String get resetPasswordButton => 'Reset Password';

  @override
  String get resettingPassword => 'Resetting password...';

  @override
  String get passwordResetSuccess => 'Password reset successfully!';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get companies => 'Companies';

  @override
  String get customers => 'Customers';

  @override
  String get suppliers => 'Suppliers';

  @override
  String get supplier => 'Supplier';

  @override
  String get customer => 'Customer';

  @override
  String get editCustomer => 'Edit Customer';

  @override
  String get editSupplier => 'Edit Supplier';

  @override
  String get type => 'Type';

  @override
  String get name => 'Name';

  @override
  String get description => 'Description';

  @override
  String get accountCode => 'Account Code';

  @override
  String get tinNumber => 'TIN Number';

  @override
  String get customerDetails => 'Customer Details';

  @override
  String get supplierDetails => 'Supplier Details';

  @override
  String get businessInformation => 'Business Information';

  @override
  String get accountDetails => 'Account Details';

  @override
  String get balance => 'Balance';

  @override
  String get categories => 'Categories';

  @override
  String get subCategories => 'Sub-Categories';

  @override
  String get units => 'Units';

  @override
  String get brands => 'Brands';

  @override
  String get models => 'Models';

  @override
  String get items => 'Items';

  @override
  String get item => 'Item';

  @override
  String get roles => 'Roles';

  @override
  String get users => 'Users';

  @override
  String get user => 'User';

  @override
  String get banks => 'Banks';

  @override
  String get employees => 'Employees';

  @override
  String get reports => 'Reports';

  @override
  String get help => 'Help';

  @override
  String get noCompanies => 'No Companies';

  @override
  String get noCompaniesMessage =>
      'You haven\'t created any companies yet.\nTap the + button to create your first company.';

  @override
  String get createCompany => 'Create Company';

  @override
  String get editCompany => 'Edit Company';

  @override
  String get active => 'Active';

  @override
  String get inactive => 'Inactive';

  @override
  String get viewBranches => 'View Branches';

  @override
  String get editCompanyTooltip => 'Edit Company';

  @override
  String get deleteCompanyTooltip => 'Delete Company';

  @override
  String get update => 'Update';

  @override
  String get create => 'Create';

  @override
  String get branches => 'Branches';

  @override
  String get noBranches => 'No Branches';

  @override
  String get noBranchesMessage =>
      'This company doesn\'t have any branches yet.\nTap the + button to create the first branch.';

  @override
  String get createBranch => 'Create Branch';

  @override
  String get editBranch => 'Edit Branch';

  @override
  String get branchName => 'Branch Name';

  @override
  String get editBranchTooltip => 'Edit Branch';

  @override
  String get deleteBranchTooltip => 'Delete Branch';

  @override
  String get management => 'Management';

  @override
  String get addNew => 'Add New';

  @override
  String get noRoles => 'No roles';

  @override
  String get noRolesMessage => 'You don\'t have any roles yet.';

  @override
  String get createRole => 'Create Role';

  @override
  String get editRole => 'Edit Role';

  @override
  String get roleDetails => 'Role Details';

  @override
  String get activeStatus => 'Active Status';

  @override
  String get enableOrDisableRole => 'Enable or disable this role';

  @override
  String get permissions => 'Permissions';

  @override
  String selectedPermissions(int count) {
    return 'Selected: $count permissions';
  }

  @override
  String get selectAtLeastOnePermission =>
      'Please select at least one permission';

  @override
  String errorLoadingPermissions(String error) {
    return 'Error loading permissions: $error';
  }

  @override
  String get noPermissionsAvailable => 'No permissions available';

  @override
  String get updateRole => 'Update Role';

  @override
  String get creating => 'Creating...';

  @override
  String get updating => 'Updating...';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get descriptionRequired => 'Description is required';

  @override
  String get noPermissionsAssigned => 'No permissions assigned';

  @override
  String get deleteRole => 'Delete Role';

  @override
  String confirmDeleteRole(String roleName) {
    return 'Are you sure you want to delete $roleName? This action cannot be undone.';
  }

  @override
  String get noUsers => 'No Users';

  @override
  String get noUsersMessage =>
      'You haven\'t created any users yet.\nTap the + button to create your first user.';

  @override
  String get createUser => 'Create User';

  @override
  String get editUser => 'Edit User';

  @override
  String get updateUser => 'Update User';

  @override
  String get userDetails => 'User Details';

  @override
  String get deleteUser => 'Delete User';

  @override
  String confirmDeleteUser(String userName) {
    return 'Are you sure you want to delete $userName? This action cannot be undone.';
  }

  @override
  String errorLoadingUser(String error) {
    return 'Error loading user: $error';
  }

  @override
  String get enableOrDisableUser => 'Enable or disable this user';

  @override
  String get contactInformation => 'Contact Information';

  @override
  String get phone => 'Phone';

  @override
  String get createdAt => 'Created At';

  @override
  String get updatedAt => 'Updated At';

  @override
  String get goBack => 'Go Back';

  @override
  String totalPermissions(int count) {
    return 'Total Permissions: $count';
  }

  @override
  String get profile => 'Profile';

  @override
  String get noUserFound => 'No User Found';

  @override
  String get unableToLoadProfile =>
      'Unable to load user profile. Please try again.';

  @override
  String get accountInformation => 'Account Information';

  @override
  String get settingsAndActions => 'Settings & Actions';

  @override
  String get dangerZone => 'Danger Zone';

  @override
  String get confirmLogout => 'Are you sure you want to logout?';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get deleteAccountWarning =>
      'This action cannot be undone. Please enter your password to confirm.';

  @override
  String get chooseFromGallery => 'Choose from Gallery';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String errorPickingImage(String error) {
    return 'Error picking image: $error';
  }

  @override
  String get createBrand => 'Create Brand';

  @override
  String get brand => 'Brand';

  @override
  String get editBrand => 'Edit Brand';

  @override
  String get noBrands => 'No brands';

  @override
  String get noBrandsMessage => 'You don\'t have any brands yet.';

  @override
  String get createUnit => 'Create Unit';

  @override
  String get unit => 'Unit';

  @override
  String get editUnit => 'Edit Unit';

  @override
  String get noUnits => 'No units';

  @override
  String get noUnitsMessage => 'You don\'t have any units yet.';

  @override
  String get createBank => 'Create Bank';

  @override
  String get bank => 'Bank';

  @override
  String get editBank => 'Edit Bank';

  @override
  String get noBanks => 'No banks';

  @override
  String get noBanksMessage => 'You don\'t have any banks yet.';

  @override
  String get bankName => 'Bank Name';

  @override
  String get bankNameRequired => 'Bank name is required';

  @override
  String get createCategory => 'Create Category';

  @override
  String get noCategories => 'No categories';

  @override
  String get noCategoriesMessage => 'You don\'t have any categories yet.';

  @override
  String get createSubCategory => 'Create Sub-Category';

  @override
  String get subCategory => 'Sub Category';

  @override
  String get editSubCategory => 'Edit Sub-Category';

  @override
  String get noSubCategories => 'No sub-categories';

  @override
  String get noSubCategoriesMessage =>
      'You don\'t have any sub-categories yet.';

  @override
  String get createModel => 'Create Model';

  @override
  String get model => 'Model';

  @override
  String get editModel => 'Edit Model';

  @override
  String get noModels => 'No models';

  @override
  String get noModelsMessage => 'You don\'t have any models yet.';

  @override
  String get noCategoriesAvailable =>
      'No categories available. Please create a category first.';

  @override
  String errorLoadingCategories(String error) {
    return 'Error loading categories: $error';
  }

  @override
  String get category => 'Category';

  @override
  String get editCategory => 'Edit Category';

  @override
  String get categoryRequired => 'Category is required';

  @override
  String get expenseCategories => 'Expense Categories';

  @override
  String get createExpenseCategory => 'Create Expense Category';

  @override
  String get expenses => 'Expenses';

  @override
  String get createExpense => 'Create Expense';

  @override
  String get editExpense => 'Edit Expense';

  @override
  String get expense => 'Expense';

  @override
  String get expenseRequired => 'Expense name is required';

  @override
  String get expenseNameExists => 'Expense name already exists';

  @override
  String get noExpenses => 'No Expenses';

  @override
  String get noExpensesMessage =>
      'You haven\'t created any expenses yet. Tap the + button to create your first expense.';

  @override
  String get reference => 'Reference';

  @override
  String get expenseDate => 'Expense Date';

  @override
  String get expenseAmount => 'Amount';

  @override
  String errorLoadingRole(String error) {
    return 'Error loading role: $error';
  }

  @override
  String get deselectAll => 'Deselect All';

  @override
  String selectedCount(int selected, int total) {
    return '$selected / $total selected';
  }

  @override
  String get accountStatus => 'Account Status';

  @override
  String get memberSince => 'Member Since';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get changePassword => 'Change Password';

  @override
  String get verified => 'Verified';

  @override
  String get notVerified => 'Not Verified';

  @override
  String get batches => 'Batches';

  @override
  String get batch => 'Batch';

  @override
  String get createBatch => 'Create Batch';

  @override
  String get noBatches => 'No batches';

  @override
  String get noBatchesMessage => 'You don\'t have any batches yet.';

  @override
  String get batchName => 'Batch Name';

  @override
  String get batchNameRequired => 'Batch name is required';

  @override
  String get split => 'Split';

  @override
  String get consolidation => 'Consolidation';

  @override
  String get consolidate => 'Consolidate';

  @override
  String get sourceBatch => 'Source batch';

  @override
  String get destinationBatch => 'Destination batch';

  @override
  String get selectSourceBatch => 'Select source batch';

  @override
  String get selectDestinationBatch => 'Select destination batch';

  @override
  String get sourceBatches => 'Source batches';

  @override
  String get destinationBatches => 'Destination batches';

  @override
  String get addSource => 'Add source';

  @override
  String get addDestination => 'Add destination';

  @override
  String sourceNumber(int number) {
    return 'Source $number';
  }

  @override
  String destinationNumber(int number) {
    return 'Destination $number';
  }

  @override
  String get selectBatch => 'Select batch';

  @override
  String get removeSource => 'Remove source';

  @override
  String get removeDestination => 'Remove destination';

  @override
  String get hideDetails => 'Hide details';

  @override
  String get moreOptions => 'More options';

  @override
  String get hideOptionalFields => 'Hide optional fields';

  @override
  String get qtyOptional => 'Qty (optional)';

  @override
  String get itemRequiredToCreateBatch => 'Item is required to create a batch';

  @override
  String get sourceAndDestinationBatchRequired =>
      'Source and destination batch are required';

  @override
  String get destinationBatchRequired => 'Destination batch is required';

  @override
  String get sourceBatchRequired => 'Source batch is required';

  @override
  String get eachSourceMustHaveBatch =>
      'Each source must have a batch selected';

  @override
  String get eachDestinationMustHaveBatch =>
      'Each destination must have a batch selected';

  @override
  String get eachDestinationQuantityAtLeast1 =>
      'Each destination quantity must be at least 1';

  @override
  String get atLeastOneSourceRequired => 'At least one source is required';

  @override
  String get atLeastOneDestinationRequired =>
      'At least one destination is required';

  @override
  String totalQuantityMustNotExceedSource(int count) {
    return 'Total quantity must not exceed source ($count)';
  }

  @override
  String totalQuantityCannotExceedSource(int total, int source) {
    return 'Total quantity ($total) cannot exceed source batch quantity ($source)';
  }

  @override
  String get quantityMustBeAtLeast1 => 'Quantity must be at least 1';

  @override
  String quantityCannotExceedSourceBatch(int count) {
    return 'Quantity cannot exceed source batch quantity ($count)';
  }

  @override
  String get costPriceCannotBeNegative => 'Cost price cannot be negative';

  @override
  String get unitPriceCannotBeNegative => 'Unit price cannot be negative';

  @override
  String get cannotBeNegative => 'Cannot be negative';

  @override
  String get operationComingSoon => 'Operation – coming soon';

  @override
  String get stocks => 'Stocks';

  @override
  String get stock => 'Stock';

  @override
  String get noStocks => 'No stocks';

  @override
  String get noStocksMessage => 'You don\'t have any stocks yet.';

  @override
  String get updateStock => 'Update Stock';

  @override
  String get lowStockThreshold => 'Low Stock Threshold';

  @override
  String get location => 'Location';

  @override
  String get status => 'Status';

  @override
  String get transactions => 'Transactions';

  @override
  String get transaction => 'Transaction';

  @override
  String get noTransactions => 'No transactions';

  @override
  String get noTransactionsMessage => 'You don\'t have any transactions yet.';

  @override
  String get transfers => 'Transfers';

  @override
  String get transfer => 'Transfer';

  @override
  String get noTransfers => 'No transfers';

  @override
  String get noTransfersMessage => 'You don\'t have any transfers yet.';

  @override
  String get createTransfer => 'Create Transfer';

  @override
  String get destinationBranch => 'Destination Branch';

  @override
  String get sourceBranch => 'Source Branch';

  @override
  String get lastUpdated => 'Last Updated';

  @override
  String get notAvailable => 'N/A';

  @override
  String get unknown => 'Unknown';

  @override
  String get transferOut => 'Transfer Out';

  @override
  String get transferIn => 'Transfer In';

  @override
  String get transferCreatedSuccessfully => 'Transfer created successfully';

  @override
  String get reverseTransaction => 'Reverse Transaction';

  @override
  String get reverseTransactionMessage =>
      'Are you sure you want to reverse this transaction? This will create a reversal entry.';

  @override
  String get reversalNote => 'Reversal Note';

  @override
  String get reversalNoteHint => 'Enter a note for this reversal (optional)';

  @override
  String get reverse => 'Reverse';

  @override
  String get purchaseReverse => 'Purchase Reverse';

  @override
  String get saleReverse => 'Sale Reverse';

  @override
  String get fulfillmentBranch => 'Fulfillment Branch';

  @override
  String get saleBranch => 'Sale Branch';

  @override
  String get selectFulfillmentBranch => 'Select Fulfillment Branch';

  @override
  String get orderNumber => 'Order Number';

  @override
  String get pending => 'Pending';

  @override
  String get approved => 'Approved';

  @override
  String get fulfilled => 'Fulfilled';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get approve => 'Approve';

  @override
  String get fulfill => 'Fulfill';

  @override
  String get cancelOrder => 'Cancel Order';

  @override
  String get approveOrder => 'Approve Order';

  @override
  String get fulfillOrder => 'Fulfill Order';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get totalTax => 'Total Tax';

  @override
  String get totalAmount => 'Total Amount';

  @override
  String get paidAmount => 'Paid Amount';

  @override
  String get remainingAmount => 'Remaining Amount';

  @override
  String get attachments => 'Attachments';

  @override
  String get deliveryProof => 'Delivery Proof';

  @override
  String get walkIn => 'Walk-in';

  @override
  String get cancelOrderConfirmation =>
      'Are you sure you want to cancel this order? This action cannot be undone.';

  @override
  String get tax => 'Tax';

  @override
  String get total => 'Total';

  @override
  String get approvedAt => 'Approved At';

  @override
  String get approvedBy => 'Approved By';

  @override
  String get createdBy => 'Created By';

  @override
  String get updatedBy => 'Updated By';

  @override
  String get add => 'Add';

  @override
  String get accept => 'Accept';

  @override
  String get reject => 'Reject';

  @override
  String get payment => 'Payment';

  @override
  String get paymentDetails => 'Payment Details';

  @override
  String get notes => 'Notes';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get currentBranch => 'Current Branch';

  @override
  String get selectBranch => 'Select Branch';

  @override
  String get switchBranch => 'Switch Branch';

  @override
  String get main => 'Main';

  @override
  String get people => 'People';

  @override
  String get products => 'Products';

  @override
  String get pointOfSale => 'Point of Sale';

  @override
  String get stockTransfer => 'Stock Transfer';

  @override
  String get billers => 'Billers';

  @override
  String get dailySalesReport => 'Daily Sales Report';

  @override
  String get core => 'Core';

  @override
  String get inventory => 'Inventory';

  @override
  String get operations => 'Operations';

  @override
  String get administration => 'Administration';

  @override
  String get paid => 'Paid';

  @override
  String get remaining => 'Remaining';

  @override
  String get optional => 'optional';

  @override
  String get paymentMethods => 'Payment Methods';

  @override
  String get noPaymentMethodsAdded => 'No payment methods added';

  @override
  String get attachment => 'Attachment';

  @override
  String get addAttachment => 'Add Attachment';

  @override
  String get change => 'Change';

  @override
  String get remove => 'Remove';

  @override
  String get fulfillOrderConfirmation =>
      'This will create a transaction and deduct inventory from the fulfillment branch.';

  @override
  String get noDescription => 'No description';

  @override
  String get addBalance => 'Add Balance';

  @override
  String get refund => 'Refund';

  @override
  String get transactionId => 'Transaction ID';

  @override
  String get transactionIdRequired => 'Transaction ID is required';

  @override
  String get invalidTransactionId => 'Invalid transaction ID';

  @override
  String get addBalanceSuccess => 'Balance added successfully';

  @override
  String get refundSuccess => 'Refund processed successfully';

  @override
  String get addPaymentMethod => 'Add Payment Method';

  @override
  String get addAtLeastOnePaymentMethod =>
      'Please add at least one payment method';

  @override
  String get receipt => 'Receipt';

  @override
  String get totalSales => 'Total Sales';

  @override
  String get totalSalesReturn => 'Total Sales Return';

  @override
  String get totalPurchase => 'Total Purchase';

  @override
  String get totalPurchaseReturn => 'Total Purchase Return';

  @override
  String get viewAll => 'View All';

  @override
  String get profit => 'Profit';

  @override
  String get invoiceDue => 'Invoice Due';

  @override
  String get totalExpenses => 'Total Expenses';

  @override
  String get totalPaymentReturns => 'Total Payment Returns';

  @override
  String get salesAndPurchase => 'Sales & Purchase';

  @override
  String get sales => 'Sales';

  @override
  String get purchase => 'Purchase';

  @override
  String get noData => 'No data available';

  @override
  String get overallInformation => 'Overall Information';

  @override
  String get orders => 'Orders';

  @override
  String get customersOverview => 'Customers Overview';

  @override
  String get firstTime => 'First Time';

  @override
  String get returning => 'Return';

  @override
  String get salesStatistics => 'Sales Statistics';

  @override
  String get revenue => 'Revenue';

  @override
  String get topSellingProducts => 'Top Selling Products';

  @override
  String get lowStockProducts => 'Low Stock Products';

  @override
  String get inStock => 'In Stock';

  @override
  String get topCustomers => 'Top Customers';

  @override
  String get salesReport => 'Sales Report';

  @override
  String get annualReport => 'Annual Report';

  @override
  String get bestSellerReport => 'Best Seller Report';

  @override
  String get customerReport => 'Customer Report';

  @override
  String get expenseReport => 'Expense Report';

  @override
  String get profitLossReport => 'Profit & Loss Report';

  @override
  String get purchaseReport => 'Purchase Report';

  @override
  String switchedToBranch(String branchName) {
    return 'Switched to $branchName';
  }

  @override
  String get failedToSwitchBranch => 'Failed to switch branch';

  @override
  String get yourTransactions => 'Your Transactions';

  @override
  String get allCustomers => 'All Customers';

  @override
  String get yourProduct => 'Your Product';

  @override
  String get isRunningLowAlreadyBelow => 'is running Low, already below';

  @override
  String get pcs => 'Pcs.';

  @override
  String get addStock => 'Add Stock';

  @override
  String get noAnnualItems => 'No annual items';

  @override
  String get totalCost => 'Total Cost';

  @override
  String get vat => 'VAT';

  @override
  String get grossProfit => 'Gross Profit';

  @override
  String get netProfit => 'Net Profit';

  @override
  String get noProfitLossItems => 'No profit-loss items';

  @override
  String get salesAndProfitTrend => 'Sales and Profit Trend';

  @override
  String get last10Days => 'Last 10 Days';

  @override
  String get noBestSellers => 'No best sellers';

  @override
  String get averageExpense => 'Average Expense';

  @override
  String get largestExpense => 'Largest Expense';

  @override
  String get totalToPayCustomers => 'Total to Pay Customers';

  @override
  String get totalCustomersOweUs => 'Total Customers Owe Us';

  @override
  String get netBalance => 'Net Balance';

  @override
  String get noCustomers => 'No customers';

  @override
  String get totalPaid => 'Total Paid';

  @override
  String get totalUnpaid => 'Total Unpaid';

  @override
  String get overdue => 'Overdue';

  @override
  String get noPurchaseItems => 'No purchase items';

  @override
  String get noSalesItems => 'No sales items';

  @override
  String get noPaymentData => 'No payment data';

  @override
  String get addPayment => 'Add Payment';

  @override
  String get noPaymentMethods => 'No payment methods';

  @override
  String get assignRolesToBranches => 'Assign Roles to Branches';

  @override
  String get autoPrint => 'Auto Print';

  @override
  String get automaticallyPrintReceipts =>
      'Automatically print receipts after transactions';

  @override
  String get defaultCalendarType => 'Default Calendar Type';

  @override
  String get businessType => 'Business Type';

  @override
  String get uploadLogo => 'Upload Logo';

  @override
  String get noCompanyFound => 'No company found';

  @override
  String get qty => 'Qty';

  @override
  String get ref => 'Ref';

  @override
  String get noAnnualItemsFound =>
      'No annual items found for the selected date.';

  @override
  String get noExpensesFound =>
      'No expenses found for the selected date range.';

  @override
  String get noProfitLossItemsFound =>
      'No profit-loss items found for the selected date range.';

  @override
  String get noBestSellersFound =>
      'No best sellers found for the selected date range.';

  @override
  String get noCustomerDataFound => 'No customer data found.';

  @override
  String get noSalesItemsFound =>
      'No sales items found for the selected date range.';

  @override
  String get noPurchaseItemsFound =>
      'No purchase items found for the selected date range.';

  @override
  String get salesAndProfitTrendLast10Days =>
      'Sales and Profit Trend (Last 10 Days)';

  @override
  String get paymentId => 'Payment ID';

  @override
  String get companyInformation => 'Company Information';

  @override
  String get enabled => 'Enabled';

  @override
  String get disabled => 'Disabled';

  @override
  String get stockInformation => 'Stock Information';

  @override
  String get metadata => 'Metadata';

  @override
  String get itemDetails => 'Item Details';

  @override
  String get updateQuantity => 'Update Quantity';

  @override
  String get addItems => 'Add Items';

  @override
  String get noItems => 'No items';

  @override
  String get overview => 'Overview';

  @override
  String get editPaymentMethod => 'Edit Payment Method';

  @override
  String get deletePaymentMethod => 'Delete Payment Method';

  @override
  String get updatePaymentMethod => 'Update Payment Method';

  @override
  String get confirmDeletePaymentMethod =>
      'Are you sure you want to delete this payment method? This action cannot be undone.';

  @override
  String get updateCompany => 'Update Company';

  @override
  String get basicInformation => 'Basic Information';

  @override
  String get locationInformation => 'Location Information';

  @override
  String get appSettings => 'App Settings';

  @override
  String get transactionDetails => 'Transaction Details';

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get noMovements => 'No Movements';

  @override
  String get noStockMovementsRecorded => 'No stock movements recorded yet';

  @override
  String get stockDetails => 'Stock Details';

  @override
  String get stockMovementDetails => 'Stock Movement Details';

  @override
  String get movementInformation => 'Movement Information';

  @override
  String get previousStock => 'Previous Stock';

  @override
  String get newStock => 'New Stock';

  @override
  String get inbound => 'Inbound';

  @override
  String get outbound => 'Outbound';

  @override
  String get transferId => 'Transfer ID';

  @override
  String get reversedMovement => 'Reversed Movement ID';

  @override
  String get noTransactionsYet => 'No transactions yet.';

  @override
  String get acceptTransfer => 'Accept Transfer';

  @override
  String get confirmAcceptTransfer =>
      'Are you sure you want to accept this transfer?';

  @override
  String get rejectTransfer => 'Reject Transfer';

  @override
  String get confirmRejectTransfer =>
      'Are you sure you want to reject this transfer?';

  @override
  String get transferDetails => 'Transfer Details';

  @override
  String get noItemsInCart => 'No items in cart';

  @override
  String get tapItemsIconToAdd =>
      'Tap the Items icon above to add items to your cart';

  @override
  String get itemsInCart => 'Items in Cart';

  @override
  String get newTransfer => 'New Transfer';

  @override
  String get noTransfersFound => 'No transfers found';

  @override
  String get youDontHaveAnyItemsYet => 'You don\'t have any items yet.';

  @override
  String get newTransaction => 'New Transaction';

  @override
  String get cart => 'Cart';

  @override
  String get additionalInformation => 'Additional Information';

  @override
  String get recordPaymentWithApproval => 'Record payment with approval';

  @override
  String get id => 'ID';

  @override
  String get none => 'None';

  @override
  String get bakery => 'Bakery';

  @override
  String get pharmacy => 'Pharmacy';

  @override
  String get supermarket => 'Supermarket';

  @override
  String get retail => 'Retail';

  @override
  String get cafe => 'Cafe';

  @override
  String get allCategories => 'All Categories';

  @override
  String get allSuppliers => 'All Suppliers';

  @override
  String get allStatus => 'All Status';

  @override
  String get completed => 'Completed';

  @override
  String get reversed => 'Reversed';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get bankRequired => 'Bank *';

  @override
  String get admin => 'Admin';

  @override
  String get manager => 'Manager';

  @override
  String get cashier => 'Cashier';

  @override
  String get storekeeper => 'Storekeeper';

  @override
  String get supervisor => 'Supervisor';

  @override
  String get standard => 'Standard';

  @override
  String get userType => 'User Type';

  @override
  String get userId => 'User ID';

  @override
  String get phone1 => 'Phone 1';

  @override
  String get phone2 => 'Phone 2';

  @override
  String get city => 'City';

  @override
  String get wereda => 'Wereda';

  @override
  String get youDontHaveAnySuppliersYet => 'You don\'t have any suppliers yet.';

  @override
  String get youDontHaveAnyExpenseCategoriesYet =>
      'You don\'t have any expense categories yet.';

  @override
  String get youDontHaveAnyCategoriesYet =>
      'You don\'t have any categories yet.';

  @override
  String get youDontHaveAnyCustomersYet => 'You don\'t have any customers yet.';

  @override
  String errorPickingImages(String error) {
    return 'Error picking images: $error';
  }

  @override
  String deleteTypeTitle(String type) {
    return 'Delete $type';
  }

  @override
  String confirmDeleteItem(String itemName) {
    return 'Are you sure you want to delete $itemName? This action cannot be undone.';
  }

  @override
  String get fulfillmentDate => 'Fulfillment Date';

  @override
  String get notSet => 'Not set';

  @override
  String get party => 'Party';

  @override
  String get unitPrice => 'Unit Price';

  @override
  String get costPrice => 'Cost Price';

  @override
  String get taxRate => 'Tax Rate';

  @override
  String get taxableAmt => 'Taxable Amt';

  @override
  String get taxAmt => 'Tax Amt';

  @override
  String get itemCode => 'Code';

  @override
  String itemCodeLabel(String code) {
    return 'Code: $code';
  }

  @override
  String get noAttachments => 'No attachments';

  @override
  String attachmentNumber(int number) {
    return 'Attachment $number';
  }

  @override
  String transactionLabel(String number) {
    return 'Transaction: $number';
  }

  @override
  String get stockMovements => 'Stock Movements';

  @override
  String get color => 'Color';

  @override
  String get size => 'Size';

  @override
  String get material => 'Material';

  @override
  String get weight => 'Weight';

  @override
  String get unknownItem => 'Unknown Item';

  @override
  String quantityLabel(String quantity) {
    return 'Qty: $quantity';
  }

  @override
  String itemNumber(String id) {
    return 'Item #$id';
  }

  @override
  String inboundLabel(String quantity) {
    return 'Inbound: +$quantity';
  }

  @override
  String outboundLabel(String quantity) {
    return 'Outbound: -$quantity';
  }

  @override
  String fromLabel(String source) {
    return 'From: $source';
  }

  @override
  String toLabel(String destination) {
    return 'To: $destination';
  }

  @override
  String movementCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count movements',
      one: '1 movement',
    );
    return '$_temp0';
  }

  @override
  String moreMovements(int count) {
    return '+ $count more movements';
  }

  @override
  String notesLabel(String notes) {
    return 'Notes: $notes';
  }

  @override
  String get methods => 'Methods';

  @override
  String get selectTransactionType => 'Select Transaction Type';

  @override
  String get addAttachments => 'Add Attachments';

  @override
  String get clearAll => 'Clear All';

  @override
  String get applyFilters => 'Apply Filters';

  @override
  String get nameAsc => 'Name (A-Z)';

  @override
  String get nameDesc => 'Name (Z-A)';

  @override
  String get createdDesc => 'Created Date (Newest)';

  @override
  String get createdAsc => 'Created Date (Oldest)';

  @override
  String get unitPriceAsc => 'Unit Price (Low to High)';

  @override
  String get unitPriceDesc => 'Unit Price (High to Low)';

  @override
  String get costPriceAsc => 'Cost Price (Low to High)';

  @override
  String get costPriceDesc => 'Cost Price (High to Low)';

  @override
  String get allSubCategories => 'All Sub Categories';

  @override
  String get allBrands => 'All Brands';

  @override
  String get allUnits => 'All Units';

  @override
  String get allModels => 'All Models';

  @override
  String get isTaxable => 'Is Taxable';

  @override
  String get isActive => 'Is Active';

  @override
  String get taxable => 'Taxable';

  @override
  String get nonTaxable => 'Non-taxable';

  @override
  String get pleaseEnterValidAmount => 'Please enter a valid amount';

  @override
  String get pleaseAddAtLeastOnePaymentMethod =>
      'Please add at least one payment method';

  @override
  String get pleaseSelectBankForBankTransfer =>
      'Please select a bank for bank transfer payment method';

  @override
  String referenceNumberRequired(String method) {
    return 'Reference number is required for $method';
  }

  @override
  String paymentMethodsTotalMustEqual(String total, String amount) {
    return 'Payment methods total ($total) must equal expense amount ($amount)';
  }

  @override
  String get failedToLoadBanks => 'Failed to load banks';

  @override
  String get selectBank => 'Select Bank';

  @override
  String errorLoadingItems(String error) {
    return 'Error loading items: $error';
  }

  @override
  String get expenseDataNotFound => 'Expense data not found';

  @override
  String get showExpensesFromAllCategories =>
      'Show expenses from all categories';

  @override
  String get noBranchesAvailable => 'No branches available';

  @override
  String get errorLoadingRoles => 'Error loading roles';

  @override
  String get myCompany => 'My Company';

  @override
  String get viewAndManageCompanyDetails => 'View and manage company details';

  @override
  String refLabel(String ref) {
    return 'Ref: $ref';
  }

  @override
  String get notesOptional => 'Notes (optional)';

  @override
  String get paymentNotesOptional => 'Payment notes (optional)';

  @override
  String get orderTotal => 'Order Total';

  @override
  String get advancedFilters => 'Advanced Filters';

  @override
  String get productInformation => 'Product Information';

  @override
  String get priceRanges => 'Price Ranges';

  @override
  String get taxStatus => 'Tax Status';

  @override
  String get min => 'Min';

  @override
  String get max => 'Max';

  @override
  String get expenseName => 'Expense Name';

  @override
  String get expenseNameRequired => 'Expense name is required';

  @override
  String get amountRequired => 'Amount is required';

  @override
  String get selectCategory => 'Select Category';

  @override
  String get categorySelected => 'Category selected';

  @override
  String get thisWillCreateTransactionAndUpdateInventory =>
      'This will create a transaction and update inventory.';

  @override
  String get addAttachmentOptional => 'Add attachment (optional)';

  @override
  String get firstNameRequired => 'First name is required';

  @override
  String get lastNameRequired => 'Last name is required';

  @override
  String get enterValidEmail => 'Enter a valid email';

  @override
  String get assignRolesToUser => 'Assign Roles to User';

  @override
  String get pleaseSelectAtLeastOneBranch =>
      'Please select at least one branch';

  @override
  String get pleaseSelectBank => 'Please select a bank';

  @override
  String get selectBankRequired => 'Select Bank *';

  @override
  String get pleaseSelectFulfillmentBranch =>
      'Please select a fulfillment branch';

  @override
  String get changing => 'Changing...';

  @override
  String get filterBestSellerReport => 'Filter Best Seller Report';

  @override
  String paymentMethodsCount(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    return 'Payment Methods ($countString)';
  }

  @override
  String get removePaymentMethod => 'Remove payment method';

  @override
  String get selectBankPlaceholder => 'Select bank';

  @override
  String get sortLabel => 'Sort:';

  @override
  String get nameAZ => 'Name (A-Z)';

  @override
  String get nameZA => 'Name (Z-A)';

  @override
  String get createdDateNewest => 'Created Date (Newest)';

  @override
  String get createdDateOldest => 'Created Date (Oldest)';

  @override
  String get attributes => 'Attributes';

  @override
  String get referenceNumberLabel => 'Reference Number';

  @override
  String get searchByNamePhoneOrAccountCode =>
      'Search by name, phone, or account code...';

  @override
  String get noSuppliersMessage => 'You don\'t have any suppliers yet.';

  @override
  String get selectFulfillmentDate => 'Select Fulfillment Date';

  @override
  String get searchExpenseCategories => 'Search expense categories...';

  @override
  String get failedToLoadExpenseCategories =>
      'Failed to load expense categories';

  @override
  String get noExpenseCategoriesMatchSearch =>
      'No expense categories match your search';

  @override
  String userLabel(String userName) {
    return 'User: $userName';
  }

  @override
  String get selectBranchesAndAssignRoles => 'Select branches and assign roles';

  @override
  String get searchCategories => 'Search categories...';

  @override
  String get noCategoriesFound => 'No categories found';

  @override
  String get noCategoriesMatchSearch => 'No categories match your search';

  @override
  String get selectCategoryFirst => 'Select category first';

  @override
  String get noSubCategoriesAvailable => 'No sub-categories available';

  @override
  String get noBrandsAvailable => 'No brands available';

  @override
  String get noUnitsAvailable => 'No units available';

  @override
  String get noModelsAvailable => 'No models available';

  @override
  String get searchByBatchName => 'Search by batch name...';

  @override
  String batchNumberLabel(String batchNumber) {
    return 'Batch #: $batchNumber';
  }

  @override
  String itemNameLabel(String itemName) {
    return 'Item: $itemName';
  }

  @override
  String get noAdditionalDetailsAvailable => 'No additional details available';

  @override
  String get filterSalesReport => 'Filter Sales Report';

  @override
  String get filterPurchaseReport => 'Filter Purchase Report';

  @override
  String get filterExpenseReport => 'Filter Expense Report';

  @override
  String get placeOrder => 'Place Order';

  @override
  String get noBanksAvailable => 'No banks available';

  @override
  String get receiptAttached => 'Receipt attached';

  @override
  String get walkingCustomer => 'Walking';

  @override
  String get allTransactions => 'All';

  @override
  String get selectCustomer => 'Select Customer';

  @override
  String get pleaseSelectBatchForItem => 'Please select a batch for this item';

  @override
  String get pleaseSelectAtLeastOneBatch =>
      'Please select at least one batch for each item';

  @override
  String get addReceipt => 'Add Receipt';

  @override
  String get tapToUpload => 'Tap to upload';

  @override
  String get pleaseSelectItem => 'Please select an item';

  @override
  String get selectItem => 'Select an item';

  @override
  String get configuration => 'Configuration';

  @override
  String get noSuppliers => 'No suppliers';

  @override
  String get noExpenseCategories => 'No expense categories';

  @override
  String get createSupplier => 'Create Supplier';

  @override
  String get createCustomer => 'Create Customer';

  @override
  String get createItem => 'Create Item';

  @override
  String get updateItem => 'Update Item';

  @override
  String get deleteItem => 'Delete Item';

  @override
  String get selectItems => 'Select Items';

  @override
  String get expenseDetails => 'Expense Details';

  @override
  String get batchDetails => 'Batch Details';

  @override
  String get identification => 'Identification';

  @override
  String get productDetails => 'Product Details';

  @override
  String get relationships => 'Relationships';

  @override
  String get pricing => 'Pricing';

  @override
  String get taxAndStatus => 'Tax & Status';

  @override
  String get datesOptional => 'Dates (Optional)';

  @override
  String get actions => 'Actions';

  @override
  String get editExpenseCategory => 'Edit Expense Category';

  @override
  String get tradeName => 'Trade Name';

  @override
  String attachmentIndex(int index) {
    return 'Attachment $index';
  }

  @override
  String get selectCustomerOptional => 'Select Customer (optional)';

  @override
  String get selectPaymentMethod => 'Select payment method';

  @override
  String get attachReceiptOptional => 'Attach receipt (optional)';

  @override
  String failedToLoadBanksWithError(String error) {
    return 'Failed to load banks: $error';
  }

  @override
  String get searchByNameCodeSku => 'Search by name, code, SKU...';

  @override
  String get selectBusinessType => 'Select Business Type';

  @override
  String get selectCalendarType => 'Select Calendar Type';

  @override
  String get unitPriceLowToHigh => 'Unit Price (Low to High)';

  @override
  String get unitPriceHighToLow => 'Unit Price (High to Low)';

  @override
  String get costPriceLowToHigh => 'Cost Price (Low to High)';

  @override
  String get costPriceHighToLow => 'Cost Price (High to Low)';

  @override
  String get selectSubCategory => 'Select Sub-Category';

  @override
  String get selectBrand => 'Select Brand';

  @override
  String get selectUnit => 'Select Unit';

  @override
  String get selectModel => 'Select Model';

  @override
  String get enterLimit => 'Enter limit (e.g., 1000)';

  @override
  String get selectStatus => 'Select Status';

  @override
  String get searchByName => 'Search by name...';

  @override
  String get date => 'Date';

  @override
  String get created => 'Created';

  @override
  String get updated => 'Updated';

  @override
  String get needStock => 'Need Stock';

  @override
  String get availableQuantity => 'Available Quantity';

  @override
  String get batchNumber => 'Batch Number';

  @override
  String get itemId => 'Item ID';

  @override
  String get itemName => 'Item Name';

  @override
  String get supplierBatchNumber => 'Supplier Batch Number';

  @override
  String get sku => 'SKU';

  @override
  String get barcode => 'Barcode';

  @override
  String get expirationDate => 'Expiration Date';

  @override
  String get manufacturingDate => 'Manufacturing Date';

  @override
  String get selectSupplier => 'Select Supplier';

  @override
  String get selectUserType => 'Select User Type';

  @override
  String get limit => 'Limit';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get currentPasswordRequired => 'Current password is required';

  @override
  String get referenceNumber => 'Reference Number';

  @override
  String get noCustomersMessage => 'You don\'t have any customers yet.';

  @override
  String get noItemsMessage => 'You don\'t have any items yet.';

  @override
  String get noSubCategoriesInCategoryMessage =>
      'This category doesn\'t have any sub-categories yet.';

  @override
  String get noExpenseCategoriesMessage =>
      'You don\'t have any expense categories yet.';

  @override
  String get roleAssignmentsByBranch => 'Role Assignments by Branch';

  @override
  String errorLoadingRoleAssignments(String error) {
    return 'Error loading role assignments: $error';
  }

  @override
  String get noRoleAssignmentsFound => 'No role assignments found';

  @override
  String get noRoleAssignmentsMessage =>
      'This user doesn\'t have any role assignments in any branch yet.';

  @override
  String get noRolesAvailable => 'No roles available';

  @override
  String get thisCategoryHasNoSubCategories =>
      'This category doesn\'t have any sub-categories yet.';

  @override
  String get amount => 'Amount';

  @override
  String get searchCustomers => 'Search customers...';

  @override
  String get quantity => 'Quantity';

  @override
  String get payments => 'Payments';

  @override
  String get noPaymentsRecorded => 'No payments recorded';

  @override
  String get confirmReverseTransaction =>
      'Are you sure you want to reverse this transaction?';

  @override
  String get thisActionCannotBeUndone => 'This action cannot be undone.';

  @override
  String get nA => 'N/A';

  @override
  String get expenseCategory => 'expense category';

  @override
  String get pleaseEnterComplete6DigitCode =>
      'Please enter a complete 6-digit code';

  @override
  String get noResetTokenFound => 'No reset token found';

  @override
  String get loginSuccessful => 'Login successful! Welcome back.';

  @override
  String get creatingAccount => 'Creating account...';

  @override
  String get accountCreatedSuccessfully =>
      'Account created successfully! Please verify your account.';

  @override
  String get accountVerifiedSuccessfully =>
      'Account verified successfully! You can now access all features.';

  @override
  String get otpValidatedSuccessfully => 'OTP validated successfully!';

  @override
  String get passwordResetLinkSent =>
      'Password reset link sent to your phone number.';

  @override
  String get passwordResetLinkSentGeneric =>
      'If an account exists with this phone number, a reset link has been sent.';

  @override
  String get passwordResetSuccessfully =>
      'Password reset successfully! You can now login with your new password.';

  @override
  String get passwordChangedSuccessfully => 'Password changed successfully!';

  @override
  String get profileUpdatedSuccessfully => 'Profile updated successfully!';

  @override
  String get accountDeletedSuccessfully =>
      'Account deleted successfully. We\'re sorry to see you go.';

  @override
  String get otpResentSuccessfully =>
      'OTP resent successfully! Please check your phone.';

  @override
  String get otpResentGeneric =>
      'If an account exists with this phone number, an OTP has been resent.';

  @override
  String get loggedOutSuccessfully => 'Logged out successfully!';

  @override
  String get authenticationRefreshed => 'Authentication refreshed!';

  @override
  String get noAuthenticatedUserFound => 'No authenticated user found.';

  @override
  String get sendingResetLink => 'Sending reset link...';

  @override
  String get validatingOtp => 'Validating OTP...';

  @override
  String get changingPassword => 'Changing password...';

  @override
  String get updatingProfile => 'Updating profile...';

  @override
  String get deletingAccount => 'Deleting account...';

  @override
  String get loggingOut => 'Logging out...';

  @override
  String get refreshing => 'Refreshing...';

  @override
  String get companySelected => 'Company Selected';

  @override
  String get branchSelected => 'Branch Selected';

  @override
  String get noContextSelected => 'No Context Selected';

  @override
  String get companyAndBranchSelected => 'Company & Branch Selected';

  @override
  String get guest => 'Guest';

  @override
  String get viewDetails => 'View details';

  @override
  String get noRolesAssigned => 'No roles assigned';

  @override
  String get balanceAddedSuccess => 'Balance added successfully';

  @override
  String get refundProcessedSuccess => 'Refund processed successfully';

  @override
  String get bankCreatedSuccessfully => 'Bank created successfully';

  @override
  String get bankUpdatedSuccessfully => 'Bank updated successfully';

  @override
  String get bankDeletedSuccessfully => 'Bank deleted successfully';

  @override
  String get failedToSyncCompanySwitch =>
      'Failed to sync company switch with server. Your selection is saved locally.';

  @override
  String get failedToSyncBranchSwitch =>
      'Failed to sync branch switch with server. Your selection is saved locally.';

  @override
  String get brandCreatedSuccessfully => 'Brand created successfully';

  @override
  String get brandUpdatedSuccessfully => 'Brand updated successfully';

  @override
  String get brandDeletedSuccessfully => 'Brand deleted successfully';

  @override
  String get categoryCreatedSuccessfully => 'Category created successfully';

  @override
  String get categoryUpdatedSuccessfully => 'Category updated successfully';

  @override
  String get categoryDeletedSuccessfully => 'Category deleted successfully';

  @override
  String get companyUpdatedSuccessfully => 'Company updated successfully';

  @override
  String get stockUpdatedSuccessfully => 'Stock updated successfully';

  @override
  String get companyLogo => 'Company Logo';

  @override
  String get oneDay => '1D';

  @override
  String get twoDays => '2D';

  @override
  String get sevenDays => '7D';

  @override
  String get tenDays => '10D';

  @override
  String get thirtyDays => '30D';

  @override
  String attachmentsCount(int count) {
    return 'Attachments ($count)';
  }

  @override
  String get expenseCategoryCreatedSuccessfully =>
      'Expense category created successfully';

  @override
  String get expenseCategoryUpdatedSuccessfully =>
      'Expense category updated successfully';

  @override
  String get expenseCategoryDeletedSuccessfully =>
      'Expense category deleted successfully';

  @override
  String get itemCreatedSuccessfully => 'Item created successfully';

  @override
  String get itemUpdatedSuccessfully => 'Item updated successfully';

  @override
  String get itemDeletedSuccessfully => 'Item deleted successfully';

  @override
  String get codeRequired => 'Code is required';

  @override
  String get costPriceRequired => 'Cost price is required';

  @override
  String get costPriceMustBeGreaterThanZero =>
      'Cost price must be greater than 0';

  @override
  String get unitPriceRequired => 'Unit price is required';

  @override
  String get unitPriceMustBeGreaterThanZero =>
      'Unit price must be greater than 0';

  @override
  String get unitPriceMustBeGreaterThanOrEqualToCostPrice =>
      'Unit price must be greater than or equal to cost price';

  @override
  String get taxRateRequired => 'Tax rate is required';

  @override
  String get taxRateMustBeBetween0And100 =>
      'Tax rate must be between 0 and 100';

  @override
  String get filterItems => 'Filter items';

  @override
  String get modelCreatedSuccessfully => 'Model created successfully';

  @override
  String get modelUpdatedSuccessfully => 'Model updated successfully';

  @override
  String get modelDeletedSuccessfully => 'Model deleted successfully';

  @override
  String get paymentMethodCreatedSuccessfully =>
      'Payment method created successfully';

  @override
  String get paymentMethodUpdatedSuccessfully =>
      'Payment method updated successfully';

  @override
  String get paymentMethodDeletedSuccessfully =>
      'Payment method deleted successfully';

  @override
  String get profilePictureUploadedSuccessfully =>
      'Profile picture uploaded successfully';

  @override
  String transferLabel(String number) {
    return 'Transfer: $number';
  }

  @override
  String get by => 'by';

  @override
  String get arrow => '→';
}
