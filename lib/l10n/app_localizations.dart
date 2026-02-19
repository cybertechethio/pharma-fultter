import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_am.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('am'),
    Locale('en'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Cyber Tech'**
  String get appTitle;

  /// The full application title with POS
  ///
  /// In en, this message translates to:
  /// **'Cyber Tech POS'**
  String get appTitleWithPos;

  /// Welcome message
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Home navigation label
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Settings navigation label
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Language settings label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Theme settings label
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Light theme option
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// Dark theme option
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Brand color customization label
  ///
  /// In en, this message translates to:
  /// **'Brand Color'**
  String get brandColor;

  /// Save button label
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Cancel button label
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// OK button label
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Generic error message
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// Generic success message
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// Loading indicator text
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Retry button label
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// Close button tooltip
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// Greeting message with user name
  ///
  /// In en, this message translates to:
  /// **'Hello, {userName}!'**
  String greetingMessage(String userName);

  /// Display item count with pluralization
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No items} =1{1 item} other{{count} items}}'**
  String itemCount(int count);

  /// Logout button label
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// Login button label
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// Email field label
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Forgot password screen title
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No account prompt
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get noAccount;

  /// Sign up button label
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// Create account button label
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// Registration screen title
  ///
  /// In en, this message translates to:
  /// **'Join Us Today'**
  String get joinUsToday;

  /// Registration screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Create your account to get started'**
  String get createAccountToGetStarted;

  /// First name field label
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// Last name field label
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// Company name label
  ///
  /// In en, this message translates to:
  /// **'Company Name'**
  String get companyName;

  /// Phone number field label
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// Phone number field hint
  ///
  /// In en, this message translates to:
  /// **'+251012001708'**
  String get phoneNumberHint;

  /// Confirm password field label
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Confirm password field hint
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get confirmPasswordHint;

  /// Terms and conditions checkbox label
  ///
  /// In en, this message translates to:
  /// **'I agree to the Terms and Conditions'**
  String get acceptTerms;

  /// Terms and conditions description
  ///
  /// In en, this message translates to:
  /// **'By checking this box, you agree to our terms of service and privacy policy.'**
  String get termsDescription;

  /// Password strength indicator label
  ///
  /// In en, this message translates to:
  /// **'Password Strength'**
  String get passwordStrength;

  /// Registration success dialog title
  ///
  /// In en, this message translates to:
  /// **'Registration Successful'**
  String get registrationSuccessful;

  /// Welcome message with user name
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}!'**
  String welcomeUser(String name);

  /// Account verification prompt
  ///
  /// In en, this message translates to:
  /// **'Please verify your account:'**
  String get verifyAccount;

  /// Email verification instruction
  ///
  /// In en, this message translates to:
  /// **'• Check your email for verification link'**
  String get checkEmailForVerification;

  /// Phone verification instruction
  ///
  /// In en, this message translates to:
  /// **'• Check your phone for verification code'**
  String get checkPhoneForVerification;

  /// Login instruction after registration
  ///
  /// In en, this message translates to:
  /// **'You can now log in with your credentials.'**
  String get canLoginNow;

  /// Login link prompt
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// Sign in link text
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// Change language option
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// Welcome back message on login screen
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// Login prompt subtitle
  ///
  /// In en, this message translates to:
  /// **'Login to continue'**
  String get loginToContinue;

  /// Email field hint text
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailHint;

  /// Password field hint text
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// Remember me checkbox label
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// Login button text
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// Login in progress message
  ///
  /// In en, this message translates to:
  /// **'Logging in...'**
  String get loggingIn;

  /// Email validation message
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailRequired;

  /// Invalid email validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get invalidEmail;

  /// Password validation message
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// Password minimum length validation message
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordMinLength;

  /// Login success message
  ///
  /// In en, this message translates to:
  /// **'Login successful!'**
  String get loginSuccess;

  /// Login failure message
  ///
  /// In en, this message translates to:
  /// **'Login failed'**
  String get loginFailed;

  /// Invalid credentials error message
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get invalidCredentials;

  /// Social login separator text
  ///
  /// In en, this message translates to:
  /// **'Or login with'**
  String get orLoginWith;

  /// Google login button label
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get googleLogin;

  /// Facebook login button label
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebookLogin;

  /// Apple login button label
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get appleLogin;

  /// Social login feature not available message
  ///
  /// In en, this message translates to:
  /// **'Social login coming soon'**
  String get socialLoginComingSoon;

  /// Language toggle button tooltip
  ///
  /// In en, this message translates to:
  /// **'Toggle Language'**
  String get languageToggle;

  /// Guest login option
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get continueAsGuest;

  /// Calendar label
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// Select date button/title
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// Select button label (e.g. date picker confirm)
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// Gregorian calendar type label
  ///
  /// In en, this message translates to:
  /// **'Gregorian Calendar'**
  String get gregorianCalendar;

  /// Ethiopian calendar type label
  ///
  /// In en, this message translates to:
  /// **'Ethiopian Calendar'**
  String get ethiopianCalendar;

  /// Calendar type selector label
  ///
  /// In en, this message translates to:
  /// **'Calendar Type'**
  String get calendarType;

  /// Today button label
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// Selected date label
  ///
  /// In en, this message translates to:
  /// **'Selected Date'**
  String get selectedDate;

  /// Ethiopian month 1
  ///
  /// In en, this message translates to:
  /// **'Meskerem'**
  String get ethiopianMonthMeskerem;

  /// Ethiopian month 2
  ///
  /// In en, this message translates to:
  /// **'Tikimt'**
  String get ethiopianMonthTikimt;

  /// Ethiopian month 3
  ///
  /// In en, this message translates to:
  /// **'Hidar'**
  String get ethiopianMonthHidar;

  /// Ethiopian month 4
  ///
  /// In en, this message translates to:
  /// **'Tahsas'**
  String get ethiopianMonthTahsas;

  /// Ethiopian month 5
  ///
  /// In en, this message translates to:
  /// **'Tir'**
  String get ethiopianMonthTir;

  /// Ethiopian month 6
  ///
  /// In en, this message translates to:
  /// **'Yekatit'**
  String get ethiopianMonthYekatit;

  /// Ethiopian month 7
  ///
  /// In en, this message translates to:
  /// **'Megabit'**
  String get ethiopianMonthMegabit;

  /// Ethiopian month 8
  ///
  /// In en, this message translates to:
  /// **'Miazia'**
  String get ethiopianMonthMiazia;

  /// Ethiopian month 9
  ///
  /// In en, this message translates to:
  /// **'Genbot'**
  String get ethiopianMonthGenbot;

  /// Ethiopian month 10
  ///
  /// In en, this message translates to:
  /// **'Sene'**
  String get ethiopianMonthSene;

  /// Ethiopian month 11
  ///
  /// In en, this message translates to:
  /// **'Hamle'**
  String get ethiopianMonthHamle;

  /// Ethiopian month 12
  ///
  /// In en, this message translates to:
  /// **'Nehasse'**
  String get ethiopianMonthNehasse;

  /// Ethiopian month 13
  ///
  /// In en, this message translates to:
  /// **'Pagumen'**
  String get ethiopianMonthPagumen;

  /// Date range label
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get dateRange;

  /// Select date range button/title
  ///
  /// In en, this message translates to:
  /// **'Select Date Range'**
  String get selectDateRange;

  /// Start date label
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get startDate;

  /// End date label
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get endDate;

  /// Hint when selecting start date
  ///
  /// In en, this message translates to:
  /// **'Selecting Start Date'**
  String get selectingStart;

  /// Hint when selecting end date
  ///
  /// In en, this message translates to:
  /// **'Selecting End Date'**
  String get selectingEnd;

  /// Duration label
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// Days count with pluralization
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 days} =1{1 day} other{{count} days}}'**
  String days(int count);

  /// Clear selection button label
  ///
  /// In en, this message translates to:
  /// **'Clear Selection'**
  String get clearSelection;

  /// Select range action
  ///
  /// In en, this message translates to:
  /// **'Select Range'**
  String get selectRange;

  /// Default date setting label
  ///
  /// In en, this message translates to:
  /// **'Default Date'**
  String get defaultDate;

  /// Default start date setting label
  ///
  /// In en, this message translates to:
  /// **'Default Start Date'**
  String get defaultStartDate;

  /// Button to set default date
  ///
  /// In en, this message translates to:
  /// **'Set Default Date'**
  String get setDefaultDate;

  /// Description of default date functionality
  ///
  /// In en, this message translates to:
  /// **'This date will be used for dashboard and data filtering'**
  String get defaultDateDescription;

  /// Message when no default date is set
  ///
  /// In en, this message translates to:
  /// **'No default date set'**
  String get noDefaultDate;

  /// Theme settings section title
  ///
  /// In en, this message translates to:
  /// **'Theme Settings'**
  String get themeSettings;

  /// Language settings section title
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get languageSettings;

  /// Date settings section title
  ///
  /// In en, this message translates to:
  /// **'Date Settings'**
  String get dateSettings;

  /// Appearance settings label
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// General settings label
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// Calendar display type setting label
  ///
  /// In en, this message translates to:
  /// **'Calendar Display'**
  String get calendarDisplayType;

  /// Description of calendar display setting
  ///
  /// In en, this message translates to:
  /// **'Choose how dates are displayed throughout the app'**
  String get calendarDisplayDescription;

  /// Auto-detect calendar type based on language
  ///
  /// In en, this message translates to:
  /// **'Auto (Based on Language)'**
  String get autoDetect;

  /// Always display dates in Gregorian calendar
  ///
  /// In en, this message translates to:
  /// **'Always Gregorian'**
  String get displayInGregorian;

  /// Always display dates in Ethiopian calendar
  ///
  /// In en, this message translates to:
  /// **'Always Ethiopian'**
  String get displayInEthiopian;

  /// Get started button text
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// Add item button text
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get addItem;

  /// Browse items button text
  ///
  /// In en, this message translates to:
  /// **'Browse Items'**
  String get browseItems;

  /// Start shopping button text
  ///
  /// In en, this message translates to:
  /// **'Start Shopping'**
  String get startShopping;

  /// Clear search button text
  ///
  /// In en, this message translates to:
  /// **'Clear Search'**
  String get clearSearch;

  /// Complete profile button text
  ///
  /// In en, this message translates to:
  /// **'Complete Profile'**
  String get completeProfile;

  /// Network error message
  ///
  /// In en, this message translates to:
  /// **'Network connection failed. Please check your internet connection and try again.'**
  String get networkError;

  /// Server error message
  ///
  /// In en, this message translates to:
  /// **'Server error occurred. Please try again later.'**
  String get serverError;

  /// Not found error title
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get notFound;

  /// Not found error message
  ///
  /// In en, this message translates to:
  /// **'The requested content was not found.'**
  String get notFoundMessage;

  /// Permission error message
  ///
  /// In en, this message translates to:
  /// **'Permission denied. Please grant the required permissions to continue.'**
  String get permissionError;

  /// Empty list message
  ///
  /// In en, this message translates to:
  /// **'No items found. Start by adding your first item.'**
  String get noItemsFound;

  /// Empty search results message
  ///
  /// In en, this message translates to:
  /// **'No results found. Try adjusting your search terms.'**
  String get noResultsFound;

  /// Empty favorites message
  ///
  /// In en, this message translates to:
  /// **'No favorites yet. Start by adding items you love.'**
  String get noFavoritesYet;

  /// Empty notifications message
  ///
  /// In en, this message translates to:
  /// **'No notifications yet. We\'ll notify you when something important happens.'**
  String get noNotificationsYet;

  /// Empty cart message
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty. Add some items to get started.'**
  String get cartEmpty;

  /// Incomplete profile message
  ///
  /// In en, this message translates to:
  /// **'Complete your profile to get the most out of the app.'**
  String get profileIncomplete;

  /// Loading data message
  ///
  /// In en, this message translates to:
  /// **'Loading data...'**
  String get loadingData;

  /// Please wait message
  ///
  /// In en, this message translates to:
  /// **'Please wait...'**
  String get pleaseWait;

  /// Required field indicator
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// Generic required field validation message
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// Email field hint
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// Password field label
  ///
  /// In en, this message translates to:
  /// **'Enter Password'**
  String get enterPassword;

  /// Search field hint
  ///
  /// In en, this message translates to:
  /// **'Search...'**
  String get searchHint;

  /// Search by item name hint text
  ///
  /// In en, this message translates to:
  /// **'Search by item name...'**
  String get searchByItemName;

  /// Dropdown hint text
  ///
  /// In en, this message translates to:
  /// **'Select an option'**
  String get selectOption;

  /// Search button and label
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Menu button label
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// Back button label
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// Done button label
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Edit button label
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Delete button label
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// Share button label
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// Copy button label
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// Paste button label
  ///
  /// In en, this message translates to:
  /// **'Paste'**
  String get paste;

  /// Cut button label
  ///
  /// In en, this message translates to:
  /// **'Cut'**
  String get cut;

  /// Select all button label
  ///
  /// In en, this message translates to:
  /// **'Select All'**
  String get selectAll;

  /// More options label
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// Less options label
  ///
  /// In en, this message translates to:
  /// **'Less'**
  String get less;

  /// Show more content label
  ///
  /// In en, this message translates to:
  /// **'Show More'**
  String get showMore;

  /// Show less content label
  ///
  /// In en, this message translates to:
  /// **'Show Less'**
  String get showLess;

  /// Expand content label
  ///
  /// In en, this message translates to:
  /// **'Expand'**
  String get expand;

  /// Collapse content label
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get collapse;

  /// Refresh content label
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// Filter content label
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// Sort content label
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// View content label
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// Details label
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// Summary section title
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// Preview label
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// Full screen mode label
  ///
  /// In en, this message translates to:
  /// **'Full Screen'**
  String get fullScreen;

  /// Exit full screen mode label
  ///
  /// In en, this message translates to:
  /// **'Exit Full Screen'**
  String get exitFullScreen;

  /// Welcome message for home screen
  ///
  /// In en, this message translates to:
  /// **'Welcome to Cyber Tech'**
  String get welcomeToApp;

  /// Application name
  ///
  /// In en, this message translates to:
  /// **'SecureAuth'**
  String get appName;

  /// Sign in continuation message
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account to continue'**
  String get signInToContinue;

  /// Email address field label
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// Email field hint text
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// Password field hint text
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYourPassword;

  /// Password required validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get pleaseEnterPassword;

  /// Signing in progress message
  ///
  /// In en, this message translates to:
  /// **'Signing In...'**
  String get signingIn;

  /// OR separator text
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get or;

  /// Google sign in button text
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No account prompt text
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// Full name field label
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// Terms agreement text
  ///
  /// In en, this message translates to:
  /// **'By creating an account, you agree to our'**
  String get byCreatingAccount;

  /// Terms of use link text
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// Conjunction word
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// Privacy policy link text
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// Quick navigation button to home screen
  ///
  /// In en, this message translates to:
  /// **'Go to Home'**
  String get goToHome;

  /// Login screen title
  ///
  /// In en, this message translates to:
  /// **'Login to Your Account'**
  String get loginAccount;

  /// Phone number field label
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get enterPhone;

  /// Phone number validation message
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get enterValidPhone;

  /// Valid password validation message
  ///
  /// In en, this message translates to:
  /// **'Enter a valid password'**
  String get enterValidPassword;

  /// Google login button text
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get loginWithGoogle;

  /// Verify account screen title
  ///
  /// In en, this message translates to:
  /// **'Verify Your Account'**
  String get verifyAccountTitle;

  /// Verify account screen subtitle with identifier
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code sent to your {identifier}'**
  String verifyAccountSubtitle(String identifier);

  /// OTP validation screen title
  ///
  /// In en, this message translates to:
  /// **'Validate OTP'**
  String get validateOtpTitle;

  /// OTP validation screen subtitle with identifier
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code sent to {identifier}'**
  String validateOtpSubtitle(String identifier);

  /// OTP input field label
  ///
  /// In en, this message translates to:
  /// **'Enter Verification Code'**
  String get enterVerificationCode;

  /// OTP input field hint
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code'**
  String get verificationCodeHint;

  /// Verify OTP button text
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// Resend OTP button text
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOtp;

  /// Resend OTP countdown timer
  ///
  /// In en, this message translates to:
  /// **'Resend OTP in {seconds}s'**
  String resendOtpIn(int seconds);

  /// OTP required validation message
  ///
  /// In en, this message translates to:
  /// **'Verification code is required'**
  String get otpRequired;

  /// Invalid OTP error message
  ///
  /// In en, this message translates to:
  /// **'Invalid verification code'**
  String get otpInvalid;

  /// Expired OTP error message
  ///
  /// In en, this message translates to:
  /// **'Verification code has expired'**
  String get otpExpired;

  /// Account verification in progress message
  ///
  /// In en, this message translates to:
  /// **'Verifying account...'**
  String get verifyingAccount;

  /// OTP resend in progress message
  ///
  /// In en, this message translates to:
  /// **'Resending OTP...'**
  String get resendingOtp;

  /// Account verification success message
  ///
  /// In en, this message translates to:
  /// **'Account verified successfully!'**
  String get accountVerifiedSuccess;

  /// OTP resend success message
  ///
  /// In en, this message translates to:
  /// **'OTP resent successfully!'**
  String get otpResentSuccess;

  /// Verification failure message
  ///
  /// In en, this message translates to:
  /// **'Verification failed'**
  String get verificationFailed;

  /// Didn't receive code prompt
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code?'**
  String get didntReceiveCode;

  /// Check spam folder instruction
  ///
  /// In en, this message translates to:
  /// **'Check your spam folder or try resending'**
  String get checkSpamFolder;

  /// Forgot password screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number to receive a password reset code'**
  String get forgotPasswordSubtitle;

  /// Send password reset code button text
  ///
  /// In en, this message translates to:
  /// **'Send Reset Code'**
  String get sendResetCode;

  /// Sending password reset code in progress message
  ///
  /// In en, this message translates to:
  /// **'Sending reset code...'**
  String get sendingResetCode;

  /// Password reset code sent success message
  ///
  /// In en, this message translates to:
  /// **'Password reset code sent successfully!'**
  String get resetCodeSent;

  /// Phone number field hint for password reset
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enterPhoneForReset;

  /// Edit phone button text
  ///
  /// In en, this message translates to:
  /// **'Edit Phone'**
  String get editPhone;

  /// Reset password screen title
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// Reset password screen subtitle
  ///
  /// In en, this message translates to:
  /// **'Enter your new password'**
  String get resetPasswordSubtitle;

  /// New password field label
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// Confirm new password field label
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirmNewPassword;

  /// Reset password button text
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPasswordButton;

  /// Resetting password in progress message
  ///
  /// In en, this message translates to:
  /// **'Resetting password...'**
  String get resettingPassword;

  /// Password reset success message
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully!'**
  String get passwordResetSuccess;

  /// Password mismatch validation message
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// Companies screen title
  ///
  /// In en, this message translates to:
  /// **'Companies'**
  String get companies;

  /// Customers menu label
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// Suppliers menu label
  ///
  /// In en, this message translates to:
  /// **'Suppliers'**
  String get suppliers;

  /// Supplier label
  ///
  /// In en, this message translates to:
  /// **'Supplier'**
  String get supplier;

  /// Customer type label
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// Edit customer dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Customer'**
  String get editCustomer;

  /// Edit supplier dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Supplier'**
  String get editSupplier;

  /// Type field label
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// Name field label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Description field label
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// Account code field label
  ///
  /// In en, this message translates to:
  /// **'Account Code'**
  String get accountCode;

  /// TIN number label
  ///
  /// In en, this message translates to:
  /// **'TIN Number'**
  String get tinNumber;

  /// Customer details screen title
  ///
  /// In en, this message translates to:
  /// **'Customer Details'**
  String get customerDetails;

  /// Supplier details screen title
  ///
  /// In en, this message translates to:
  /// **'Supplier Details'**
  String get supplierDetails;

  /// Business information section title
  ///
  /// In en, this message translates to:
  /// **'Business Information'**
  String get businessInformation;

  /// Account details section title
  ///
  /// In en, this message translates to:
  /// **'Account Details'**
  String get accountDetails;

  /// Balance field label
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// Categories menu label
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// Sub-Categories menu label
  ///
  /// In en, this message translates to:
  /// **'Sub-Categories'**
  String get subCategories;

  /// Units menu label
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get units;

  /// Brands menu label
  ///
  /// In en, this message translates to:
  /// **'Brands'**
  String get brands;

  /// Models menu label
  ///
  /// In en, this message translates to:
  /// **'Models'**
  String get models;

  /// Items section title
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// Item type label
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get item;

  /// Roles menu label
  ///
  /// In en, this message translates to:
  /// **'Roles'**
  String get roles;

  /// Users menu label
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// User type label
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// Banks menu label
  ///
  /// In en, this message translates to:
  /// **'Banks'**
  String get banks;

  /// Employees menu label
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employees;

  /// Reports menu label
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get reports;

  /// Help menu label
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// Empty companies list title
  ///
  /// In en, this message translates to:
  /// **'No Companies'**
  String get noCompanies;

  /// Empty companies list message
  ///
  /// In en, this message translates to:
  /// **'You haven\'t created any companies yet.\nTap the + button to create your first company.'**
  String get noCompaniesMessage;

  /// Create company button and dialog title
  ///
  /// In en, this message translates to:
  /// **'Create Company'**
  String get createCompany;

  /// Edit company dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Company'**
  String get editCompany;

  /// Active status label
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// Inactive status label
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// View branches button tooltip
  ///
  /// In en, this message translates to:
  /// **'View Branches'**
  String get viewBranches;

  /// Edit company button tooltip
  ///
  /// In en, this message translates to:
  /// **'Edit Company'**
  String get editCompanyTooltip;

  /// Delete company button tooltip
  ///
  /// In en, this message translates to:
  /// **'Delete Company'**
  String get deleteCompanyTooltip;

  /// Update button label
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// Create button label
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// Branches screen title
  ///
  /// In en, this message translates to:
  /// **'Branches'**
  String get branches;

  /// Empty branches list title
  ///
  /// In en, this message translates to:
  /// **'No Branches'**
  String get noBranches;

  /// Empty branches list message
  ///
  /// In en, this message translates to:
  /// **'This company doesn\'t have any branches yet.\nTap the + button to create the first branch.'**
  String get noBranchesMessage;

  /// Create branch button and dialog title
  ///
  /// In en, this message translates to:
  /// **'Create Branch'**
  String get createBranch;

  /// Edit branch dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Branch'**
  String get editBranch;

  /// Branch name field label
  ///
  /// In en, this message translates to:
  /// **'Branch Name'**
  String get branchName;

  /// Edit branch button tooltip
  ///
  /// In en, this message translates to:
  /// **'Edit Branch'**
  String get editBranchTooltip;

  /// Delete branch button tooltip
  ///
  /// In en, this message translates to:
  /// **'Delete Branch'**
  String get deleteBranchTooltip;

  /// Management menu label for company and branch management
  ///
  /// In en, this message translates to:
  /// **'Management'**
  String get management;

  /// Add new item button tooltip
  ///
  /// In en, this message translates to:
  /// **'Add New'**
  String get addNew;

  /// Empty roles list title
  ///
  /// In en, this message translates to:
  /// **'No roles'**
  String get noRoles;

  /// Empty roles list message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any roles yet.'**
  String get noRolesMessage;

  /// Create role button and screen title
  ///
  /// In en, this message translates to:
  /// **'Create Role'**
  String get createRole;

  /// Edit role screen title
  ///
  /// In en, this message translates to:
  /// **'Edit Role'**
  String get editRole;

  /// Role details screen title
  ///
  /// In en, this message translates to:
  /// **'Role Details'**
  String get roleDetails;

  /// Active status toggle label
  ///
  /// In en, this message translates to:
  /// **'Active Status'**
  String get activeStatus;

  /// Active status toggle subtitle
  ///
  /// In en, this message translates to:
  /// **'Enable or disable this role'**
  String get enableOrDisableRole;

  /// Permissions section title
  ///
  /// In en, this message translates to:
  /// **'Permissions'**
  String get permissions;

  /// Selected permissions count
  ///
  /// In en, this message translates to:
  /// **'Selected: {count} permissions'**
  String selectedPermissions(int count);

  /// Permission selection validation message
  ///
  /// In en, this message translates to:
  /// **'Please select at least one permission'**
  String get selectAtLeastOnePermission;

  /// Error message when loading permissions fails
  ///
  /// In en, this message translates to:
  /// **'Error loading permissions: {error}'**
  String errorLoadingPermissions(String error);

  /// Message when no permissions are available
  ///
  /// In en, this message translates to:
  /// **'No permissions available'**
  String get noPermissionsAvailable;

  /// Update role button text
  ///
  /// In en, this message translates to:
  /// **'Update Role'**
  String get updateRole;

  /// Creating in progress message
  ///
  /// In en, this message translates to:
  /// **'Creating...'**
  String get creating;

  /// Updating in progress message
  ///
  /// In en, this message translates to:
  /// **'Updating...'**
  String get updating;

  /// Name field validation message
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// Description field validation message
  ///
  /// In en, this message translates to:
  /// **'Description is required'**
  String get descriptionRequired;

  /// Message when role has no permissions
  ///
  /// In en, this message translates to:
  /// **'No permissions assigned'**
  String get noPermissionsAssigned;

  /// Delete role dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete Role'**
  String get deleteRole;

  /// Delete role confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {roleName}? This action cannot be undone.'**
  String confirmDeleteRole(String roleName);

  /// Empty users list title
  ///
  /// In en, this message translates to:
  /// **'No Users'**
  String get noUsers;

  /// Empty users list message
  ///
  /// In en, this message translates to:
  /// **'You haven\'t created any users yet.\nTap the + button to create your first user.'**
  String get noUsersMessage;

  /// Create user button and screen title
  ///
  /// In en, this message translates to:
  /// **'Create User'**
  String get createUser;

  /// Edit user screen title
  ///
  /// In en, this message translates to:
  /// **'Edit User'**
  String get editUser;

  /// Update user button text
  ///
  /// In en, this message translates to:
  /// **'Update User'**
  String get updateUser;

  /// User details screen title
  ///
  /// In en, this message translates to:
  /// **'User Details'**
  String get userDetails;

  /// Delete user dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete User'**
  String get deleteUser;

  /// Delete user confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {userName}? This action cannot be undone.'**
  String confirmDeleteUser(String userName);

  /// Error message when loading user fails
  ///
  /// In en, this message translates to:
  /// **'Error loading user: {error}'**
  String errorLoadingUser(String error);

  /// Active status toggle subtitle for user
  ///
  /// In en, this message translates to:
  /// **'Enable or disable this user'**
  String get enableOrDisableUser;

  /// Contact information section title
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation;

  /// Phone field label
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// Created at label
  ///
  /// In en, this message translates to:
  /// **'Created At'**
  String get createdAt;

  /// Updated at label
  ///
  /// In en, this message translates to:
  /// **'Updated At'**
  String get updatedAt;

  /// Go back button text
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// Total permissions count label
  ///
  /// In en, this message translates to:
  /// **'Total Permissions: {count}'**
  String totalPermissions(int count);

  /// Profile screen title
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Empty user profile title
  ///
  /// In en, this message translates to:
  /// **'No User Found'**
  String get noUserFound;

  /// Error loading user profile message
  ///
  /// In en, this message translates to:
  /// **'Unable to load user profile. Please try again.'**
  String get unableToLoadProfile;

  /// Account information section title
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get accountInformation;

  /// Settings and actions section title
  ///
  /// In en, this message translates to:
  /// **'Settings & Actions'**
  String get settingsAndActions;

  /// Danger zone section title
  ///
  /// In en, this message translates to:
  /// **'Danger Zone'**
  String get dangerZone;

  /// Logout confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get confirmLogout;

  /// Delete account dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// Delete account warning message
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone. Please enter your password to confirm.'**
  String get deleteAccountWarning;

  /// Choose from gallery option
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get chooseFromGallery;

  /// Take photo option
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// Error message when picking image fails
  ///
  /// In en, this message translates to:
  /// **'Error picking image: {error}'**
  String errorPickingImage(String error);

  /// Create brand dialog title
  ///
  /// In en, this message translates to:
  /// **'Create Brand'**
  String get createBrand;

  /// Brand type label
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// Edit brand dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Brand'**
  String get editBrand;

  /// Empty brands list title
  ///
  /// In en, this message translates to:
  /// **'No brands'**
  String get noBrands;

  /// Empty brands list message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any brands yet.'**
  String get noBrandsMessage;

  /// Create unit dialog title
  ///
  /// In en, this message translates to:
  /// **'Create Unit'**
  String get createUnit;

  /// Unit type label
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// Edit unit dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Unit'**
  String get editUnit;

  /// Empty units list title
  ///
  /// In en, this message translates to:
  /// **'No units'**
  String get noUnits;

  /// Empty units list message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any units yet.'**
  String get noUnitsMessage;

  /// Create bank dialog title
  ///
  /// In en, this message translates to:
  /// **'Create Bank'**
  String get createBank;

  /// Bank label
  ///
  /// In en, this message translates to:
  /// **'Bank'**
  String get bank;

  /// Edit bank dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Bank'**
  String get editBank;

  /// Empty banks list title
  ///
  /// In en, this message translates to:
  /// **'No banks'**
  String get noBanks;

  /// Empty banks list message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any banks yet.'**
  String get noBanksMessage;

  /// Bank name field label
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankName;

  /// Bank name validation error
  ///
  /// In en, this message translates to:
  /// **'Bank name is required'**
  String get bankNameRequired;

  /// Create category screen title
  ///
  /// In en, this message translates to:
  /// **'Create Category'**
  String get createCategory;

  /// No categories empty state
  ///
  /// In en, this message translates to:
  /// **'No categories'**
  String get noCategories;

  /// No categories empty state message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any categories yet.'**
  String get noCategoriesMessage;

  /// Create sub-category screen title
  ///
  /// In en, this message translates to:
  /// **'Create Sub-Category'**
  String get createSubCategory;

  /// Sub category label
  ///
  /// In en, this message translates to:
  /// **'Sub Category'**
  String get subCategory;

  /// Edit sub-category dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Sub-Category'**
  String get editSubCategory;

  /// No sub-categories empty state
  ///
  /// In en, this message translates to:
  /// **'No sub-categories'**
  String get noSubCategories;

  /// No sub-categories empty state message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any sub-categories yet.'**
  String get noSubCategoriesMessage;

  /// Create model dialog title
  ///
  /// In en, this message translates to:
  /// **'Create Model'**
  String get createModel;

  /// Model type label
  ///
  /// In en, this message translates to:
  /// **'Model'**
  String get model;

  /// Edit model dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Model'**
  String get editModel;

  /// Empty models list title
  ///
  /// In en, this message translates to:
  /// **'No models'**
  String get noModels;

  /// Empty models list message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any models yet.'**
  String get noModelsMessage;

  /// Message when no categories are available for sub-category
  ///
  /// In en, this message translates to:
  /// **'No categories available. Please create a category first.'**
  String get noCategoriesAvailable;

  /// Error message when loading categories fails
  ///
  /// In en, this message translates to:
  /// **'Error loading categories: {error}'**
  String errorLoadingCategories(String error);

  /// Category section title
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// Edit category dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Category'**
  String get editCategory;

  /// Category field validation message
  ///
  /// In en, this message translates to:
  /// **'Category is required'**
  String get categoryRequired;

  /// Expense categories navigation label
  ///
  /// In en, this message translates to:
  /// **'Expense Categories'**
  String get expenseCategories;

  /// Create expense category dialog title
  ///
  /// In en, this message translates to:
  /// **'Create Expense Category'**
  String get createExpenseCategory;

  /// Expenses navigation label
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get expenses;

  /// Create expense button label
  ///
  /// In en, this message translates to:
  /// **'Create Expense'**
  String get createExpense;

  /// Edit expense dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Expense'**
  String get editExpense;

  /// Expense singular form
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get expense;

  /// Expense name validation message
  ///
  /// In en, this message translates to:
  /// **'Expense name is required'**
  String get expenseRequired;

  /// Expense name uniqueness validation message
  ///
  /// In en, this message translates to:
  /// **'Expense name already exists'**
  String get expenseNameExists;

  /// No expenses title
  ///
  /// In en, this message translates to:
  /// **'No Expenses'**
  String get noExpenses;

  /// No expenses message
  ///
  /// In en, this message translates to:
  /// **'You haven\'t created any expenses yet. Tap the + button to create your first expense.'**
  String get noExpensesMessage;

  /// Reference label
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get reference;

  /// Expense date label
  ///
  /// In en, this message translates to:
  /// **'Expense Date'**
  String get expenseDate;

  /// Expense amount label
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get expenseAmount;

  /// Error message when loading role fails
  ///
  /// In en, this message translates to:
  /// **'Error loading role: {error}'**
  String errorLoadingRole(String error);

  /// Deselect all button label
  ///
  /// In en, this message translates to:
  /// **'Deselect All'**
  String get deselectAll;

  /// Selected count display
  ///
  /// In en, this message translates to:
  /// **'{selected} / {total} selected'**
  String selectedCount(int selected, int total);

  /// Account status label
  ///
  /// In en, this message translates to:
  /// **'Account Status'**
  String get accountStatus;

  /// Member since label
  ///
  /// In en, this message translates to:
  /// **'Member Since'**
  String get memberSince;

  /// Edit profile dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// Change password button label
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// Verified account status
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get verified;

  /// Not verified account status
  ///
  /// In en, this message translates to:
  /// **'Not Verified'**
  String get notVerified;

  /// Batches menu label
  ///
  /// In en, this message translates to:
  /// **'Batches'**
  String get batches;

  /// Batch type label
  ///
  /// In en, this message translates to:
  /// **'Batch'**
  String get batch;

  /// Title for items associated with a batch
  ///
  /// In en, this message translates to:
  /// **'Items with Batch'**
  String get itemWithBatch;

  /// Create batch dialog title
  ///
  /// In en, this message translates to:
  /// **'Create Batch'**
  String get createBatch;

  /// Empty batches list title
  ///
  /// In en, this message translates to:
  /// **'No batches'**
  String get noBatches;

  /// Empty batches list message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any batches yet.'**
  String get noBatchesMessage;

  /// Batch name label
  ///
  /// In en, this message translates to:
  /// **'Batch Name'**
  String get batchName;

  /// Batch name field validation message
  ///
  /// In en, this message translates to:
  /// **'Batch name is required'**
  String get batchNameRequired;

  /// No description provided for @split.
  ///
  /// In en, this message translates to:
  /// **'Split'**
  String get split;

  /// No description provided for @consolidation.
  ///
  /// In en, this message translates to:
  /// **'Consolidation'**
  String get consolidation;

  /// No description provided for @consolidate.
  ///
  /// In en, this message translates to:
  /// **'Consolidate'**
  String get consolidate;

  /// No description provided for @sourceBatch.
  ///
  /// In en, this message translates to:
  /// **'Source batch'**
  String get sourceBatch;

  /// No description provided for @destinationBatch.
  ///
  /// In en, this message translates to:
  /// **'Destination batch'**
  String get destinationBatch;

  /// No description provided for @selectSourceBatch.
  ///
  /// In en, this message translates to:
  /// **'Select source batch'**
  String get selectSourceBatch;

  /// No description provided for @selectDestinationBatch.
  ///
  /// In en, this message translates to:
  /// **'Select destination batch'**
  String get selectDestinationBatch;

  /// No description provided for @sourceBatches.
  ///
  /// In en, this message translates to:
  /// **'Source batches'**
  String get sourceBatches;

  /// No description provided for @destinationBatches.
  ///
  /// In en, this message translates to:
  /// **'Destination batches'**
  String get destinationBatches;

  /// No description provided for @addSource.
  ///
  /// In en, this message translates to:
  /// **'Add source'**
  String get addSource;

  /// No description provided for @addDestination.
  ///
  /// In en, this message translates to:
  /// **'Add destination'**
  String get addDestination;

  /// No description provided for @sourceNumber.
  ///
  /// In en, this message translates to:
  /// **'Source {number}'**
  String sourceNumber(int number);

  /// No description provided for @destinationNumber.
  ///
  /// In en, this message translates to:
  /// **'Destination {number}'**
  String destinationNumber(int number);

  /// No description provided for @selectBatch.
  ///
  /// In en, this message translates to:
  /// **'Select batch'**
  String get selectBatch;

  /// No description provided for @removeSource.
  ///
  /// In en, this message translates to:
  /// **'Remove source'**
  String get removeSource;

  /// No description provided for @removeDestination.
  ///
  /// In en, this message translates to:
  /// **'Remove destination'**
  String get removeDestination;

  /// No description provided for @hideDetails.
  ///
  /// In en, this message translates to:
  /// **'Hide details'**
  String get hideDetails;

  /// No description provided for @moreOptions.
  ///
  /// In en, this message translates to:
  /// **'More options'**
  String get moreOptions;

  /// No description provided for @hideOptionalFields.
  ///
  /// In en, this message translates to:
  /// **'Hide optional fields'**
  String get hideOptionalFields;

  /// No description provided for @qtyOptional.
  ///
  /// In en, this message translates to:
  /// **'Qty (optional)'**
  String get qtyOptional;

  /// No description provided for @itemRequiredToCreateBatch.
  ///
  /// In en, this message translates to:
  /// **'Item is required to create a batch'**
  String get itemRequiredToCreateBatch;

  /// No description provided for @sourceAndDestinationBatchRequired.
  ///
  /// In en, this message translates to:
  /// **'Source and destination batch are required'**
  String get sourceAndDestinationBatchRequired;

  /// No description provided for @destinationBatchRequired.
  ///
  /// In en, this message translates to:
  /// **'Destination batch is required'**
  String get destinationBatchRequired;

  /// No description provided for @sourceBatchRequired.
  ///
  /// In en, this message translates to:
  /// **'Source batch is required'**
  String get sourceBatchRequired;

  /// No description provided for @eachSourceMustHaveBatch.
  ///
  /// In en, this message translates to:
  /// **'Each source must have a batch selected'**
  String get eachSourceMustHaveBatch;

  /// No description provided for @eachDestinationMustHaveBatch.
  ///
  /// In en, this message translates to:
  /// **'Each destination must have a batch selected'**
  String get eachDestinationMustHaveBatch;

  /// No description provided for @eachDestinationQuantityAtLeast1.
  ///
  /// In en, this message translates to:
  /// **'Each destination quantity must be at least 1'**
  String get eachDestinationQuantityAtLeast1;

  /// No description provided for @atLeastOneSourceRequired.
  ///
  /// In en, this message translates to:
  /// **'At least one source is required'**
  String get atLeastOneSourceRequired;

  /// No description provided for @atLeastOneDestinationRequired.
  ///
  /// In en, this message translates to:
  /// **'At least one destination is required'**
  String get atLeastOneDestinationRequired;

  /// No description provided for @totalQuantityMustNotExceedSource.
  ///
  /// In en, this message translates to:
  /// **'Total quantity must not exceed source ({count})'**
  String totalQuantityMustNotExceedSource(int count);

  /// No description provided for @totalQuantityCannotExceedSource.
  ///
  /// In en, this message translates to:
  /// **'Total quantity ({total}) cannot exceed source batch quantity ({source})'**
  String totalQuantityCannotExceedSource(int total, int source);

  /// No description provided for @quantityMustBeAtLeast1.
  ///
  /// In en, this message translates to:
  /// **'Quantity must be at least 1'**
  String get quantityMustBeAtLeast1;

  /// No description provided for @quantityCannotExceedSourceBatch.
  ///
  /// In en, this message translates to:
  /// **'Quantity cannot exceed source batch quantity ({count})'**
  String quantityCannotExceedSourceBatch(int count);

  /// No description provided for @costPriceCannotBeNegative.
  ///
  /// In en, this message translates to:
  /// **'Cost price cannot be negative'**
  String get costPriceCannotBeNegative;

  /// No description provided for @unitPriceCannotBeNegative.
  ///
  /// In en, this message translates to:
  /// **'Unit price cannot be negative'**
  String get unitPriceCannotBeNegative;

  /// No description provided for @cannotBeNegative.
  ///
  /// In en, this message translates to:
  /// **'Cannot be negative'**
  String get cannotBeNegative;

  /// No description provided for @operationComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Operation – coming soon'**
  String get operationComingSoon;

  /// Stocks menu label
  ///
  /// In en, this message translates to:
  /// **'Stocks'**
  String get stocks;

  /// Stock type label
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get stock;

  /// Empty stocks list title
  ///
  /// In en, this message translates to:
  /// **'No stocks'**
  String get noStocks;

  /// Empty stocks list message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any stocks yet.'**
  String get noStocksMessage;

  /// Update stock dialog title
  ///
  /// In en, this message translates to:
  /// **'Update Stock'**
  String get updateStock;

  /// Low stock threshold label
  ///
  /// In en, this message translates to:
  /// **'Low Stock Threshold'**
  String get lowStockThreshold;

  /// Location label
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// Status label
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// Transactions menu label
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// Transaction type label
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No transactions empty state
  ///
  /// In en, this message translates to:
  /// **'No transactions'**
  String get noTransactions;

  /// Empty transactions list message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any transactions yet.'**
  String get noTransactionsMessage;

  /// Transfers screen title
  ///
  /// In en, this message translates to:
  /// **'Transfers'**
  String get transfers;

  /// Transfer type label
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transfer;

  /// Empty transfers list title
  ///
  /// In en, this message translates to:
  /// **'No transfers'**
  String get noTransfers;

  /// Empty transfers list message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any transfers yet.'**
  String get noTransfersMessage;

  /// Create transfer button and screen title
  ///
  /// In en, this message translates to:
  /// **'Create Transfer'**
  String get createTransfer;

  /// Destination branch label
  ///
  /// In en, this message translates to:
  /// **'Destination Branch'**
  String get destinationBranch;

  /// Source branch field label
  ///
  /// In en, this message translates to:
  /// **'Source Branch'**
  String get sourceBranch;

  /// Last updated field label
  ///
  /// In en, this message translates to:
  /// **'Last Updated'**
  String get lastUpdated;

  /// Not available placeholder text
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notAvailable;

  /// Unknown value placeholder
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// Transfer out type label
  ///
  /// In en, this message translates to:
  /// **'Transfer Out'**
  String get transferOut;

  /// Transfer in type label
  ///
  /// In en, this message translates to:
  /// **'Transfer In'**
  String get transferIn;

  /// Transfer creation success message
  ///
  /// In en, this message translates to:
  /// **'Transfer created successfully'**
  String get transferCreatedSuccessfully;

  /// Reverse transaction dialog title
  ///
  /// In en, this message translates to:
  /// **'Reverse Transaction'**
  String get reverseTransaction;

  /// Reverse transaction confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reverse this transaction? This will create a reversal entry.'**
  String get reverseTransactionMessage;

  /// Reversal note field label
  ///
  /// In en, this message translates to:
  /// **'Reversal Note'**
  String get reversalNote;

  /// Reversal note field hint
  ///
  /// In en, this message translates to:
  /// **'Enter a note for this reversal (optional)'**
  String get reversalNoteHint;

  /// Reverse button label
  ///
  /// In en, this message translates to:
  /// **'Reverse'**
  String get reverse;

  /// Purchase reverse transaction type label
  ///
  /// In en, this message translates to:
  /// **'Purchase Reverse'**
  String get purchaseReverse;

  /// Sale reverse transaction type label
  ///
  /// In en, this message translates to:
  /// **'Sale Reverse'**
  String get saleReverse;

  /// Fulfillment branch field label
  ///
  /// In en, this message translates to:
  /// **'Fulfillment Branch'**
  String get fulfillmentBranch;

  /// Sale branch field label
  ///
  /// In en, this message translates to:
  /// **'Sale Branch'**
  String get saleBranch;

  /// Fulfillment branch selector hint
  ///
  /// In en, this message translates to:
  /// **'Select Fulfillment Branch'**
  String get selectFulfillmentBranch;

  /// Order number field label
  ///
  /// In en, this message translates to:
  /// **'Order Number'**
  String get orderNumber;

  /// Pending status label
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// Approved status label
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// Fulfilled status label
  ///
  /// In en, this message translates to:
  /// **'Fulfilled'**
  String get fulfilled;

  /// Cancelled status label
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// Approve action button label
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// Fulfill action button label
  ///
  /// In en, this message translates to:
  /// **'Fulfill'**
  String get fulfill;

  /// Cancel order action button label
  ///
  /// In en, this message translates to:
  /// **'Cancel Order'**
  String get cancelOrder;

  /// Approve order dialog title
  ///
  /// In en, this message translates to:
  /// **'Approve Order'**
  String get approveOrder;

  /// Fulfill order dialog title
  ///
  /// In en, this message translates to:
  /// **'Fulfill Order'**
  String get fulfillOrder;

  /// Subtotal label
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// Total tax label
  ///
  /// In en, this message translates to:
  /// **'Total Tax'**
  String get totalTax;

  /// Total amount label
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmount;

  /// Paid amount label
  ///
  /// In en, this message translates to:
  /// **'Paid Amount'**
  String get paidAmount;

  /// Remaining amount label
  ///
  /// In en, this message translates to:
  /// **'Remaining Amount'**
  String get remainingAmount;

  /// Attachments section title
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get attachments;

  /// Delivery proof attachment label
  ///
  /// In en, this message translates to:
  /// **'Delivery Proof'**
  String get deliveryProof;

  /// Walk-in customer label
  ///
  /// In en, this message translates to:
  /// **'Walk-in'**
  String get walkIn;

  /// Cancel order confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this order? This action cannot be undone.'**
  String get cancelOrderConfirmation;

  /// Tax label
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get tax;

  /// Total label
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// Approved at date label
  ///
  /// In en, this message translates to:
  /// **'Approved At'**
  String get approvedAt;

  /// Approved by user label
  ///
  /// In en, this message translates to:
  /// **'Approved By'**
  String get approvedBy;

  /// Created by user label
  ///
  /// In en, this message translates to:
  /// **'Created By'**
  String get createdBy;

  /// Updated by user label
  ///
  /// In en, this message translates to:
  /// **'Updated By'**
  String get updatedBy;

  /// Add button label
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// Accept button label
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// Reject button label
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// Payment label
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// Payment details section title
  ///
  /// In en, this message translates to:
  /// **'Payment Details'**
  String get paymentDetails;

  /// Notes label
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// Yes confirmation button
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No confirmation button
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// Current branch label in drawer
  ///
  /// In en, this message translates to:
  /// **'Current Branch'**
  String get currentBranch;

  /// Select branch prompt in drawer
  ///
  /// In en, this message translates to:
  /// **'Select Branch'**
  String get selectBranch;

  /// Switch branch action label
  ///
  /// In en, this message translates to:
  /// **'Switch Branch'**
  String get switchBranch;

  /// Main section label in drawer
  ///
  /// In en, this message translates to:
  /// **'Main'**
  String get main;

  /// People section label in drawer
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get people;

  /// Products menu label
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// Point of Sale menu label
  ///
  /// In en, this message translates to:
  /// **'Point of Sale'**
  String get pointOfSale;

  /// Stock transfer menu label
  ///
  /// In en, this message translates to:
  /// **'Stock Transfer'**
  String get stockTransfer;

  /// Billers menu label
  ///
  /// In en, this message translates to:
  /// **'Billers'**
  String get billers;

  /// Daily sales report menu label
  ///
  /// In en, this message translates to:
  /// **'Daily Sales Report'**
  String get dailySalesReport;

  /// Core section label in navigation
  ///
  /// In en, this message translates to:
  /// **'Core'**
  String get core;

  /// Inventory section label in navigation
  ///
  /// In en, this message translates to:
  /// **'Inventory'**
  String get inventory;

  /// Operations section label in navigation
  ///
  /// In en, this message translates to:
  /// **'Operations'**
  String get operations;

  /// Administration section label in navigation
  ///
  /// In en, this message translates to:
  /// **'Administration'**
  String get administration;

  /// Paid label
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// Remaining label
  ///
  /// In en, this message translates to:
  /// **'Remaining'**
  String get remaining;

  /// Optional field indicator
  ///
  /// In en, this message translates to:
  /// **'optional'**
  String get optional;

  /// Payment methods section title
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethods;

  /// No payment methods added message
  ///
  /// In en, this message translates to:
  /// **'No payment methods added'**
  String get noPaymentMethodsAdded;

  /// Attachment label
  ///
  /// In en, this message translates to:
  /// **'Attachment'**
  String get attachment;

  /// Add attachment button label
  ///
  /// In en, this message translates to:
  /// **'Add Attachment'**
  String get addAttachment;

  /// Change button label
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// Remove button label
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// Fulfill order information message
  ///
  /// In en, this message translates to:
  /// **'This will create a transaction and deduct inventory from the fulfillment branch.'**
  String get fulfillOrderConfirmation;

  /// Placeholder text when no description is available
  ///
  /// In en, this message translates to:
  /// **'No description'**
  String get noDescription;

  /// Add balance button label
  ///
  /// In en, this message translates to:
  /// **'Add Balance'**
  String get addBalance;

  /// Refund button label
  ///
  /// In en, this message translates to:
  /// **'Refund'**
  String get refund;

  /// Transaction ID field label
  ///
  /// In en, this message translates to:
  /// **'Transaction ID'**
  String get transactionId;

  /// Transaction ID required validation message
  ///
  /// In en, this message translates to:
  /// **'Transaction ID is required'**
  String get transactionIdRequired;

  /// Invalid transaction ID validation message
  ///
  /// In en, this message translates to:
  /// **'Invalid transaction ID'**
  String get invalidTransactionId;

  /// Add balance success message
  ///
  /// In en, this message translates to:
  /// **'Balance added successfully'**
  String get addBalanceSuccess;

  /// Refund success message
  ///
  /// In en, this message translates to:
  /// **'Refund processed successfully'**
  String get refundSuccess;

  /// Add payment method button label
  ///
  /// In en, this message translates to:
  /// **'Add Payment Method'**
  String get addPaymentMethod;

  /// Validation message for payment methods
  ///
  /// In en, this message translates to:
  /// **'Please add at least one payment method'**
  String get addAtLeastOnePaymentMethod;

  /// Receipt label
  ///
  /// In en, this message translates to:
  /// **'Receipt'**
  String get receipt;

  /// Total sales label
  ///
  /// In en, this message translates to:
  /// **'Total Sales'**
  String get totalSales;

  /// Total sales return label
  ///
  /// In en, this message translates to:
  /// **'Total Sales Return'**
  String get totalSalesReturn;

  /// Total purchase label
  ///
  /// In en, this message translates to:
  /// **'Total Purchase'**
  String get totalPurchase;

  /// Total purchase return label
  ///
  /// In en, this message translates to:
  /// **'Total Purchase Return'**
  String get totalPurchaseReturn;

  /// View all button label
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// Profit label
  ///
  /// In en, this message translates to:
  /// **'Profit'**
  String get profit;

  /// Invoice due label
  ///
  /// In en, this message translates to:
  /// **'Invoice Due'**
  String get invoiceDue;

  /// Total expenses label
  ///
  /// In en, this message translates to:
  /// **'Total Expenses'**
  String get totalExpenses;

  /// Total payment returns label
  ///
  /// In en, this message translates to:
  /// **'Total Payment Returns'**
  String get totalPaymentReturns;

  /// Sales and purchase chart title
  ///
  /// In en, this message translates to:
  /// **'Sales & Purchase'**
  String get salesAndPurchase;

  /// Sales label
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales;

  /// Purchase label
  ///
  /// In en, this message translates to:
  /// **'Purchase'**
  String get purchase;

  /// No data message
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get noData;

  /// Overall information section title
  ///
  /// In en, this message translates to:
  /// **'Overall Information'**
  String get overallInformation;

  /// Orders label
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// Customers overview chart title
  ///
  /// In en, this message translates to:
  /// **'Customers Overview'**
  String get customersOverview;

  /// First time customer label
  ///
  /// In en, this message translates to:
  /// **'First Time'**
  String get firstTime;

  /// Returning customer label
  ///
  /// In en, this message translates to:
  /// **'Return'**
  String get returning;

  /// Sales statistics chart title
  ///
  /// In en, this message translates to:
  /// **'Sales Statistics'**
  String get salesStatistics;

  /// Revenue label
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get revenue;

  /// Top selling products card title
  ///
  /// In en, this message translates to:
  /// **'Top Selling Products'**
  String get topSellingProducts;

  /// Low stock products card title
  ///
  /// In en, this message translates to:
  /// **'Low Stock Products'**
  String get lowStockProducts;

  /// In stock label
  ///
  /// In en, this message translates to:
  /// **'In Stock'**
  String get inStock;

  /// Top customers card title
  ///
  /// In en, this message translates to:
  /// **'Top Customers'**
  String get topCustomers;

  /// Sales report label in drawer
  ///
  /// In en, this message translates to:
  /// **'Sales Report'**
  String get salesReport;

  /// Annual report label in drawer
  ///
  /// In en, this message translates to:
  /// **'Annual Report'**
  String get annualReport;

  /// Best seller report label in drawer
  ///
  /// In en, this message translates to:
  /// **'Best Seller Report'**
  String get bestSellerReport;

  /// Customer report label in drawer
  ///
  /// In en, this message translates to:
  /// **'Customer Report'**
  String get customerReport;

  /// Expense report label in drawer
  ///
  /// In en, this message translates to:
  /// **'Expense Report'**
  String get expenseReport;

  /// Profit and loss report label in drawer
  ///
  /// In en, this message translates to:
  /// **'Profit & Loss Report'**
  String get profitLossReport;

  /// Purchase report label in drawer
  ///
  /// In en, this message translates to:
  /// **'Purchase Report'**
  String get purchaseReport;

  /// Branch switch success message
  ///
  /// In en, this message translates to:
  /// **'Switched to {branchName}'**
  String switchedToBranch(String branchName);

  /// Branch switch failure message
  ///
  /// In en, this message translates to:
  /// **'Failed to switch branch'**
  String get failedToSwitchBranch;

  /// Transactions list header title
  ///
  /// In en, this message translates to:
  /// **'Your Transactions'**
  String get yourTransactions;

  /// All customers option label
  ///
  /// In en, this message translates to:
  /// **'All Customers'**
  String get allCustomers;

  /// Alert banner product label
  ///
  /// In en, this message translates to:
  /// **'Your Product'**
  String get yourProduct;

  /// Alert banner low stock message
  ///
  /// In en, this message translates to:
  /// **'is running Low, already below'**
  String get isRunningLowAlreadyBelow;

  /// Pieces abbreviation
  ///
  /// In en, this message translates to:
  /// **'Pcs.'**
  String get pcs;

  /// Add stock button label
  ///
  /// In en, this message translates to:
  /// **'Add Stock'**
  String get addStock;

  /// Empty annual report items message
  ///
  /// In en, this message translates to:
  /// **'No annual items'**
  String get noAnnualItems;

  /// Total cost label
  ///
  /// In en, this message translates to:
  /// **'Total Cost'**
  String get totalCost;

  /// VAT label
  ///
  /// In en, this message translates to:
  /// **'VAT'**
  String get vat;

  /// Gross profit label
  ///
  /// In en, this message translates to:
  /// **'Gross Profit'**
  String get grossProfit;

  /// Net profit label
  ///
  /// In en, this message translates to:
  /// **'Net Profit'**
  String get netProfit;

  /// Empty profit-loss report items message
  ///
  /// In en, this message translates to:
  /// **'No profit-loss items'**
  String get noProfitLossItems;

  /// Sales and profit trend chart title
  ///
  /// In en, this message translates to:
  /// **'Sales and Profit Trend'**
  String get salesAndProfitTrend;

  /// Last 10 days label
  ///
  /// In en, this message translates to:
  /// **'Last 10 Days'**
  String get last10Days;

  /// Empty best seller report message
  ///
  /// In en, this message translates to:
  /// **'No best sellers'**
  String get noBestSellers;

  /// Average expense label
  ///
  /// In en, this message translates to:
  /// **'Average Expense'**
  String get averageExpense;

  /// Largest expense label
  ///
  /// In en, this message translates to:
  /// **'Largest Expense'**
  String get largestExpense;

  /// Total to pay customers label
  ///
  /// In en, this message translates to:
  /// **'Total to Pay Customers'**
  String get totalToPayCustomers;

  /// Total customers owe us label
  ///
  /// In en, this message translates to:
  /// **'Total Customers Owe Us'**
  String get totalCustomersOweUs;

  /// Net balance label
  ///
  /// In en, this message translates to:
  /// **'Net Balance'**
  String get netBalance;

  /// No customers empty state
  ///
  /// In en, this message translates to:
  /// **'No customers'**
  String get noCustomers;

  /// Total paid label
  ///
  /// In en, this message translates to:
  /// **'Total Paid'**
  String get totalPaid;

  /// Total unpaid label
  ///
  /// In en, this message translates to:
  /// **'Total Unpaid'**
  String get totalUnpaid;

  /// Overdue label
  ///
  /// In en, this message translates to:
  /// **'Overdue'**
  String get overdue;

  /// Empty purchase report items message
  ///
  /// In en, this message translates to:
  /// **'No purchase items'**
  String get noPurchaseItems;

  /// Empty sales report items message
  ///
  /// In en, this message translates to:
  /// **'No sales items'**
  String get noSalesItems;

  /// No payment data message
  ///
  /// In en, this message translates to:
  /// **'No payment data'**
  String get noPaymentData;

  /// Add payment button label
  ///
  /// In en, this message translates to:
  /// **'Add Payment'**
  String get addPayment;

  /// No payment methods message
  ///
  /// In en, this message translates to:
  /// **'No payment methods'**
  String get noPaymentMethods;

  /// Assign roles to branches label
  ///
  /// In en, this message translates to:
  /// **'Assign Roles to Branches'**
  String get assignRolesToBranches;

  /// Auto print setting label
  ///
  /// In en, this message translates to:
  /// **'Auto Print'**
  String get autoPrint;

  /// Auto print setting description
  ///
  /// In en, this message translates to:
  /// **'Automatically print receipts after transactions'**
  String get automaticallyPrintReceipts;

  /// Default calendar type setting label
  ///
  /// In en, this message translates to:
  /// **'Default Calendar Type'**
  String get defaultCalendarType;

  /// Business type setting label
  ///
  /// In en, this message translates to:
  /// **'Business Type'**
  String get businessType;

  /// Upload logo button label
  ///
  /// In en, this message translates to:
  /// **'Upload Logo'**
  String get uploadLogo;

  /// No company found message
  ///
  /// In en, this message translates to:
  /// **'No company found'**
  String get noCompanyFound;

  /// Quantity abbreviation
  ///
  /// In en, this message translates to:
  /// **'Qty'**
  String get qty;

  /// Reference abbreviation
  ///
  /// In en, this message translates to:
  /// **'Ref'**
  String get ref;

  /// Empty annual items message
  ///
  /// In en, this message translates to:
  /// **'No annual items found for the selected date.'**
  String get noAnnualItemsFound;

  /// Empty expenses message
  ///
  /// In en, this message translates to:
  /// **'No expenses found for the selected date range.'**
  String get noExpensesFound;

  /// Empty profit-loss items message
  ///
  /// In en, this message translates to:
  /// **'No profit-loss items found for the selected date range.'**
  String get noProfitLossItemsFound;

  /// Empty best sellers message
  ///
  /// In en, this message translates to:
  /// **'No best sellers found for the selected date range.'**
  String get noBestSellersFound;

  /// Empty customer data message
  ///
  /// In en, this message translates to:
  /// **'No customer data found.'**
  String get noCustomerDataFound;

  /// Empty sales items message
  ///
  /// In en, this message translates to:
  /// **'No sales items found for the selected date range.'**
  String get noSalesItemsFound;

  /// Empty purchase items message
  ///
  /// In en, this message translates to:
  /// **'No purchase items found for the selected date range.'**
  String get noPurchaseItemsFound;

  /// Sales and profit trend chart title with last 10 days
  ///
  /// In en, this message translates to:
  /// **'Sales and Profit Trend (Last 10 Days)'**
  String get salesAndProfitTrendLast10Days;

  /// Payment ID label
  ///
  /// In en, this message translates to:
  /// **'Payment ID'**
  String get paymentId;

  /// Company information section title
  ///
  /// In en, this message translates to:
  /// **'Company Information'**
  String get companyInformation;

  /// Enabled status
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// Disabled status
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// Stock information section title
  ///
  /// In en, this message translates to:
  /// **'Stock Information'**
  String get stockInformation;

  /// Metadata section title
  ///
  /// In en, this message translates to:
  /// **'Metadata'**
  String get metadata;

  /// Item details screen title
  ///
  /// In en, this message translates to:
  /// **'Item Details'**
  String get itemDetails;

  /// Update quantity dialog title
  ///
  /// In en, this message translates to:
  /// **'Update Quantity'**
  String get updateQuantity;

  /// Add items button label
  ///
  /// In en, this message translates to:
  /// **'Add Items'**
  String get addItems;

  /// No items empty state
  ///
  /// In en, this message translates to:
  /// **'No items'**
  String get noItems;

  /// Overview section title
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// Edit payment method dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Payment Method'**
  String get editPaymentMethod;

  /// Delete payment method dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete Payment Method'**
  String get deletePaymentMethod;

  /// Update payment method button label
  ///
  /// In en, this message translates to:
  /// **'Update Payment Method'**
  String get updatePaymentMethod;

  /// Delete payment method confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this payment method? This action cannot be undone.'**
  String get confirmDeletePaymentMethod;

  /// Update company screen title
  ///
  /// In en, this message translates to:
  /// **'Update Company'**
  String get updateCompany;

  /// Basic information section title
  ///
  /// In en, this message translates to:
  /// **'Basic Information'**
  String get basicInformation;

  /// Location information section title
  ///
  /// In en, this message translates to:
  /// **'Location Information'**
  String get locationInformation;

  /// App settings section title
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettings;

  /// Transaction details screen title
  ///
  /// In en, this message translates to:
  /// **'Transaction Details'**
  String get transactionDetails;

  /// Personal information section title
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No movements title
  ///
  /// In en, this message translates to:
  /// **'No Movements'**
  String get noMovements;

  /// No stock movements message
  ///
  /// In en, this message translates to:
  /// **'No stock movements recorded yet'**
  String get noStockMovementsRecorded;

  /// Stock details screen title
  ///
  /// In en, this message translates to:
  /// **'Stock Details'**
  String get stockDetails;

  /// Stock movement details screen title
  ///
  /// In en, this message translates to:
  /// **'Stock Movement Details'**
  String get stockMovementDetails;

  /// Movement information section title
  ///
  /// In en, this message translates to:
  /// **'Movement Information'**
  String get movementInformation;

  /// Previous stock label
  ///
  /// In en, this message translates to:
  /// **'Previous Stock'**
  String get previousStock;

  /// New stock label
  ///
  /// In en, this message translates to:
  /// **'New Stock'**
  String get newStock;

  /// Inbound movement label
  ///
  /// In en, this message translates to:
  /// **'Inbound'**
  String get inbound;

  /// Outbound movement label
  ///
  /// In en, this message translates to:
  /// **'Outbound'**
  String get outbound;

  /// Transfer ID label
  ///
  /// In en, this message translates to:
  /// **'Transfer ID'**
  String get transferId;

  /// Reversed movement ID label
  ///
  /// In en, this message translates to:
  /// **'Reversed Movement ID'**
  String get reversedMovement;

  /// No transactions empty state message
  ///
  /// In en, this message translates to:
  /// **'No transactions yet.'**
  String get noTransactionsYet;

  /// Accept transfer dialog title
  ///
  /// In en, this message translates to:
  /// **'Accept Transfer'**
  String get acceptTransfer;

  /// Accept transfer confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to accept this transfer?'**
  String get confirmAcceptTransfer;

  /// Reject transfer dialog title
  ///
  /// In en, this message translates to:
  /// **'Reject Transfer'**
  String get rejectTransfer;

  /// Reject transfer confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reject this transfer?'**
  String get confirmRejectTransfer;

  /// Transfer details screen title
  ///
  /// In en, this message translates to:
  /// **'Transfer Details'**
  String get transferDetails;

  /// No items in cart title
  ///
  /// In en, this message translates to:
  /// **'No items in cart'**
  String get noItemsInCart;

  /// Empty cart instruction message
  ///
  /// In en, this message translates to:
  /// **'Tap the Items icon above to add items to your cart'**
  String get tapItemsIconToAdd;

  /// Items in cart section title
  ///
  /// In en, this message translates to:
  /// **'Items in Cart'**
  String get itemsInCart;

  /// New transfer screen title
  ///
  /// In en, this message translates to:
  /// **'New Transfer'**
  String get newTransfer;

  /// No transfers found message
  ///
  /// In en, this message translates to:
  /// **'No transfers found'**
  String get noTransfersFound;

  /// Empty items message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any items yet.'**
  String get youDontHaveAnyItemsYet;

  /// New transaction screen title
  ///
  /// In en, this message translates to:
  /// **'New Transaction'**
  String get newTransaction;

  /// Cart menu item label
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// Additional information section title
  ///
  /// In en, this message translates to:
  /// **'Additional Information'**
  String get additionalInformation;

  /// Add payment with approval subtitle
  ///
  /// In en, this message translates to:
  /// **'Record payment with approval'**
  String get recordPaymentWithApproval;

  /// ID label
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get id;

  /// None option label
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// Bakery business type
  ///
  /// In en, this message translates to:
  /// **'Bakery'**
  String get bakery;

  /// Pharmacy business type
  ///
  /// In en, this message translates to:
  /// **'Pharmacy'**
  String get pharmacy;

  /// Supermarket business type
  ///
  /// In en, this message translates to:
  /// **'Supermarket'**
  String get supermarket;

  /// Retail business type
  ///
  /// In en, this message translates to:
  /// **'Retail'**
  String get retail;

  /// Cafe business type
  ///
  /// In en, this message translates to:
  /// **'Cafe'**
  String get cafe;

  /// All categories filter option
  ///
  /// In en, this message translates to:
  /// **'All Categories'**
  String get allCategories;

  /// All suppliers filter option
  ///
  /// In en, this message translates to:
  /// **'All Suppliers'**
  String get allSuppliers;

  /// All status filter option
  ///
  /// In en, this message translates to:
  /// **'All Status'**
  String get allStatus;

  /// Completed status
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// Reversed status
  ///
  /// In en, this message translates to:
  /// **'Reversed'**
  String get reversed;

  /// Payment method label
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// Bank required field label
  ///
  /// In en, this message translates to:
  /// **'Bank *'**
  String get bankRequired;

  /// Admin user type
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// Manager user type
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get manager;

  /// Cashier user type
  ///
  /// In en, this message translates to:
  /// **'Cashier'**
  String get cashier;

  /// Storekeeper user type
  ///
  /// In en, this message translates to:
  /// **'Storekeeper'**
  String get storekeeper;

  /// Supervisor user type
  ///
  /// In en, this message translates to:
  /// **'Supervisor'**
  String get supervisor;

  /// Standard user type
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get standard;

  /// User type label
  ///
  /// In en, this message translates to:
  /// **'User Type'**
  String get userType;

  /// User ID label
  ///
  /// In en, this message translates to:
  /// **'User ID'**
  String get userId;

  /// Phone 1 label
  ///
  /// In en, this message translates to:
  /// **'Phone 1'**
  String get phone1;

  /// Phone 2 label
  ///
  /// In en, this message translates to:
  /// **'Phone 2'**
  String get phone2;

  /// City label
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// Wereda label
  ///
  /// In en, this message translates to:
  /// **'Wereda'**
  String get wereda;

  /// Empty suppliers message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any suppliers yet.'**
  String get youDontHaveAnySuppliersYet;

  /// Empty expense categories message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any expense categories yet.'**
  String get youDontHaveAnyExpenseCategoriesYet;

  /// Empty categories message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any categories yet.'**
  String get youDontHaveAnyCategoriesYet;

  /// Empty customers message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any customers yet.'**
  String get youDontHaveAnyCustomersYet;

  /// Error picking images message
  ///
  /// In en, this message translates to:
  /// **'Error picking images: {error}'**
  String errorPickingImages(String error);

  /// Delete confirmation dialog title with item type
  ///
  /// In en, this message translates to:
  /// **'Delete {type}'**
  String deleteTypeTitle(String type);

  /// Delete item confirmation message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete {itemName}? This action cannot be undone.'**
  String confirmDeleteItem(String itemName);

  /// Fulfillment date label
  ///
  /// In en, this message translates to:
  /// **'Fulfillment Date'**
  String get fulfillmentDate;

  /// Not set value
  ///
  /// In en, this message translates to:
  /// **'Not set'**
  String get notSet;

  /// Party label (generic customer/supplier)
  ///
  /// In en, this message translates to:
  /// **'Party'**
  String get party;

  /// Unit price label
  ///
  /// In en, this message translates to:
  /// **'Unit Price'**
  String get unitPrice;

  /// Cost price label
  ///
  /// In en, this message translates to:
  /// **'Cost Price'**
  String get costPrice;

  /// Tax rate label
  ///
  /// In en, this message translates to:
  /// **'Tax Rate'**
  String get taxRate;

  /// Taxable amount label
  ///
  /// In en, this message translates to:
  /// **'Taxable Amt'**
  String get taxableAmt;

  /// Tax amount label
  ///
  /// In en, this message translates to:
  /// **'Tax Amt'**
  String get taxAmt;

  /// Item code label
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get itemCode;

  /// Item code label with value
  ///
  /// In en, this message translates to:
  /// **'Code: {code}'**
  String itemCodeLabel(String code);

  /// No attachments message
  ///
  /// In en, this message translates to:
  /// **'No attachments'**
  String get noAttachments;

  /// Attachment number label
  ///
  /// In en, this message translates to:
  /// **'Attachment {number}'**
  String attachmentNumber(int number);

  /// Transaction label with number
  ///
  /// In en, this message translates to:
  /// **'Transaction: {number}'**
  String transactionLabel(String number);

  /// Stock movements section title
  ///
  /// In en, this message translates to:
  /// **'Stock Movements'**
  String get stockMovements;

  /// Color label
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// Size label
  ///
  /// In en, this message translates to:
  /// **'Size'**
  String get size;

  /// Material label
  ///
  /// In en, this message translates to:
  /// **'Material'**
  String get material;

  /// Weight label
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// Unknown item placeholder
  ///
  /// In en, this message translates to:
  /// **'Unknown Item'**
  String get unknownItem;

  /// Quantity label with value
  ///
  /// In en, this message translates to:
  /// **'Qty: {quantity}'**
  String quantityLabel(String quantity);

  /// Item number label
  ///
  /// In en, this message translates to:
  /// **'Item #{id}'**
  String itemNumber(String id);

  /// Inbound quantity label
  ///
  /// In en, this message translates to:
  /// **'Inbound: +{quantity}'**
  String inboundLabel(String quantity);

  /// Outbound quantity label
  ///
  /// In en, this message translates to:
  /// **'Outbound: -{quantity}'**
  String outboundLabel(String quantity);

  /// From source label
  ///
  /// In en, this message translates to:
  /// **'From: {source}'**
  String fromLabel(String source);

  /// To destination label
  ///
  /// In en, this message translates to:
  /// **'To: {destination}'**
  String toLabel(String destination);

  /// Movement count with pluralization
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 movement} other{{count} movements}}'**
  String movementCount(int count);

  /// More movements label
  ///
  /// In en, this message translates to:
  /// **'+ {count} more movements'**
  String moreMovements(int count);

  /// Notes label with value
  ///
  /// In en, this message translates to:
  /// **'Notes: {notes}'**
  String notesLabel(String notes);

  /// Methods label
  ///
  /// In en, this message translates to:
  /// **'Methods'**
  String get methods;

  /// Select transaction type dialog title
  ///
  /// In en, this message translates to:
  /// **'Select Transaction Type'**
  String get selectTransactionType;

  /// Add attachments button label
  ///
  /// In en, this message translates to:
  /// **'Add Attachments'**
  String get addAttachments;

  /// Clear all button label
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// Apply filters button label
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get applyFilters;

  /// Name ascending sort option
  ///
  /// In en, this message translates to:
  /// **'Name (A-Z)'**
  String get nameAsc;

  /// Name descending sort option
  ///
  /// In en, this message translates to:
  /// **'Name (Z-A)'**
  String get nameDesc;

  /// Sort by created date descending
  ///
  /// In en, this message translates to:
  /// **'Created Date (Newest)'**
  String get createdDesc;

  /// Sort by created date ascending
  ///
  /// In en, this message translates to:
  /// **'Created Date (Oldest)'**
  String get createdAsc;

  /// Sort by unit price ascending
  ///
  /// In en, this message translates to:
  /// **'Unit Price (Low to High)'**
  String get unitPriceAsc;

  /// Sort by unit price descending
  ///
  /// In en, this message translates to:
  /// **'Unit Price (High to Low)'**
  String get unitPriceDesc;

  /// Sort by cost price ascending
  ///
  /// In en, this message translates to:
  /// **'Cost Price (Low to High)'**
  String get costPriceAsc;

  /// Sort by cost price descending
  ///
  /// In en, this message translates to:
  /// **'Cost Price (High to Low)'**
  String get costPriceDesc;

  /// All sub categories filter option
  ///
  /// In en, this message translates to:
  /// **'All Sub Categories'**
  String get allSubCategories;

  /// All brands filter option
  ///
  /// In en, this message translates to:
  /// **'All Brands'**
  String get allBrands;

  /// All units filter option
  ///
  /// In en, this message translates to:
  /// **'All Units'**
  String get allUnits;

  /// All models filter option
  ///
  /// In en, this message translates to:
  /// **'All Models'**
  String get allModels;

  /// Is taxable label
  ///
  /// In en, this message translates to:
  /// **'Is Taxable'**
  String get isTaxable;

  /// Is active label
  ///
  /// In en, this message translates to:
  /// **'Is Active'**
  String get isActive;

  /// Taxable label
  ///
  /// In en, this message translates to:
  /// **'Taxable'**
  String get taxable;

  /// Non-taxable label
  ///
  /// In en, this message translates to:
  /// **'Non-taxable'**
  String get nonTaxable;

  /// Invalid amount error message
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid amount'**
  String get pleaseEnterValidAmount;

  /// No payment method error message
  ///
  /// In en, this message translates to:
  /// **'Please add at least one payment method'**
  String get pleaseAddAtLeastOnePaymentMethod;

  /// Bank selection required error message
  ///
  /// In en, this message translates to:
  /// **'Please select a bank for bank transfer payment method'**
  String get pleaseSelectBankForBankTransfer;

  /// Reference number required error message
  ///
  /// In en, this message translates to:
  /// **'Reference number is required for {method}'**
  String referenceNumberRequired(String method);

  /// Payment methods total mismatch error message
  ///
  /// In en, this message translates to:
  /// **'Payment methods total ({total}) must equal expense amount ({amount})'**
  String paymentMethodsTotalMustEqual(String total, String amount);

  /// Failed to load banks error message
  ///
  /// In en, this message translates to:
  /// **'Failed to load banks'**
  String get failedToLoadBanks;

  /// Select bank dialog title
  ///
  /// In en, this message translates to:
  /// **'Select Bank'**
  String get selectBank;

  /// Error loading items message
  ///
  /// In en, this message translates to:
  /// **'Error loading items: {error}'**
  String errorLoadingItems(String error);

  /// Expense data not found error message
  ///
  /// In en, this message translates to:
  /// **'Expense data not found'**
  String get expenseDataNotFound;

  /// Show expenses from all categories subtitle
  ///
  /// In en, this message translates to:
  /// **'Show expenses from all categories'**
  String get showExpensesFromAllCategories;

  /// No branches available message
  ///
  /// In en, this message translates to:
  /// **'No branches available'**
  String get noBranchesAvailable;

  /// Error loading roles message
  ///
  /// In en, this message translates to:
  /// **'Error loading roles'**
  String get errorLoadingRoles;

  /// My company label
  ///
  /// In en, this message translates to:
  /// **'My Company'**
  String get myCompany;

  /// View and manage company details subtitle
  ///
  /// In en, this message translates to:
  /// **'View and manage company details'**
  String get viewAndManageCompanyDetails;

  /// Reference label with value
  ///
  /// In en, this message translates to:
  /// **'Ref: {ref}'**
  String refLabel(String ref);

  /// Notes field label with optional indicator
  ///
  /// In en, this message translates to:
  /// **'Notes (optional)'**
  String get notesOptional;

  /// Payment notes field label with optional indicator
  ///
  /// In en, this message translates to:
  /// **'Payment notes (optional)'**
  String get paymentNotesOptional;

  /// Order total label
  ///
  /// In en, this message translates to:
  /// **'Order Total'**
  String get orderTotal;

  /// Advanced filters title
  ///
  /// In en, this message translates to:
  /// **'Advanced Filters'**
  String get advancedFilters;

  /// Product information section title
  ///
  /// In en, this message translates to:
  /// **'Product Information'**
  String get productInformation;

  /// Price ranges section title
  ///
  /// In en, this message translates to:
  /// **'Price Ranges'**
  String get priceRanges;

  /// Tax status label
  ///
  /// In en, this message translates to:
  /// **'Tax Status'**
  String get taxStatus;

  /// Minimum label
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get min;

  /// Maximum label
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get max;

  /// Expense name field label
  ///
  /// In en, this message translates to:
  /// **'Expense Name'**
  String get expenseName;

  /// Expense name required validation
  ///
  /// In en, this message translates to:
  /// **'Expense name is required'**
  String get expenseNameRequired;

  /// Amount required error message
  ///
  /// In en, this message translates to:
  /// **'Amount is required'**
  String get amountRequired;

  /// Select category hint
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get selectCategory;

  /// Category selected message
  ///
  /// In en, this message translates to:
  /// **'Category selected'**
  String get categorySelected;

  /// Fulfill sales order warning message
  ///
  /// In en, this message translates to:
  /// **'This will create a transaction and update inventory.'**
  String get thisWillCreateTransactionAndUpdateInventory;

  /// Add attachment placeholder (optional)
  ///
  /// In en, this message translates to:
  /// **'Add attachment (optional)'**
  String get addAttachmentOptional;

  /// First name required validation
  ///
  /// In en, this message translates to:
  /// **'First name is required'**
  String get firstNameRequired;

  /// Last name required validation
  ///
  /// In en, this message translates to:
  /// **'Last name is required'**
  String get lastNameRequired;

  /// Valid email validation message
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get enterValidEmail;

  /// Assign role label
  ///
  /// In en, this message translates to:
  /// **'Assign Role'**
  String get assignRole;

  /// Assign roles to user dialog title
  ///
  /// In en, this message translates to:
  /// **'Assign Roles to User'**
  String get assignRolesToUser;

  /// Select at least one branch validation
  ///
  /// In en, this message translates to:
  /// **'Please select at least one branch'**
  String get pleaseSelectAtLeastOneBranch;

  /// Please select bank error message
  ///
  /// In en, this message translates to:
  /// **'Please select a bank'**
  String get pleaseSelectBank;

  /// Select bank required label
  ///
  /// In en, this message translates to:
  /// **'Select Bank *'**
  String get selectBankRequired;

  /// Please select fulfillment branch validation
  ///
  /// In en, this message translates to:
  /// **'Please select a fulfillment branch'**
  String get pleaseSelectFulfillmentBranch;

  /// Changing password loading text
  ///
  /// In en, this message translates to:
  /// **'Changing...'**
  String get changing;

  /// Filter best seller report bottom sheet title
  ///
  /// In en, this message translates to:
  /// **'Filter Best Seller Report'**
  String get filterBestSellerReport;

  /// Payment methods with count
  ///
  /// In en, this message translates to:
  /// **'Payment Methods ({count})'**
  String paymentMethodsCount(int count);

  /// Remove payment method tooltip
  ///
  /// In en, this message translates to:
  /// **'Remove payment method'**
  String get removePaymentMethod;

  /// Select bank placeholder
  ///
  /// In en, this message translates to:
  /// **'Select bank'**
  String get selectBankPlaceholder;

  /// Sort section label with colon
  ///
  /// In en, this message translates to:
  /// **'Sort:'**
  String get sortLabel;

  /// Sort by name ascending
  ///
  /// In en, this message translates to:
  /// **'Name (A-Z)'**
  String get nameAZ;

  /// Sort by name descending
  ///
  /// In en, this message translates to:
  /// **'Name (Z-A)'**
  String get nameZA;

  /// Created date newest sort option
  ///
  /// In en, this message translates to:
  /// **'Created Date (Newest)'**
  String get createdDateNewest;

  /// Created date oldest sort option
  ///
  /// In en, this message translates to:
  /// **'Created Date (Oldest)'**
  String get createdDateOldest;

  /// Attributes section title
  ///
  /// In en, this message translates to:
  /// **'Attributes'**
  String get attributes;

  /// Reference number field label
  ///
  /// In en, this message translates to:
  /// **'Reference Number'**
  String get referenceNumberLabel;

  /// Search by name, phone, or account code hint
  ///
  /// In en, this message translates to:
  /// **'Search by name, phone, or account code...'**
  String get searchByNamePhoneOrAccountCode;

  /// No suppliers empty state message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any suppliers yet.'**
  String get noSuppliersMessage;

  /// Select fulfillment date dialog help text
  ///
  /// In en, this message translates to:
  /// **'Select Fulfillment Date'**
  String get selectFulfillmentDate;

  /// Search expense categories placeholder
  ///
  /// In en, this message translates to:
  /// **'Search expense categories...'**
  String get searchExpenseCategories;

  /// Failed to load expense categories error message
  ///
  /// In en, this message translates to:
  /// **'Failed to load expense categories'**
  String get failedToLoadExpenseCategories;

  /// No expense categories match search message
  ///
  /// In en, this message translates to:
  /// **'No expense categories match your search'**
  String get noExpenseCategoriesMatchSearch;

  /// User label with name
  ///
  /// In en, this message translates to:
  /// **'User: {userName}'**
  String userLabel(String userName);

  /// Select branches and assign roles header text
  ///
  /// In en, this message translates to:
  /// **'Select branches and assign roles'**
  String get selectBranchesAndAssignRoles;

  /// Search categories hint
  ///
  /// In en, this message translates to:
  /// **'Search categories...'**
  String get searchCategories;

  /// No categories found message
  ///
  /// In en, this message translates to:
  /// **'No categories found'**
  String get noCategoriesFound;

  /// No categories match search message
  ///
  /// In en, this message translates to:
  /// **'No categories match your search'**
  String get noCategoriesMatchSearch;

  /// Select category first message
  ///
  /// In en, this message translates to:
  /// **'Select category first'**
  String get selectCategoryFirst;

  /// No sub-categories available message
  ///
  /// In en, this message translates to:
  /// **'No sub-categories available'**
  String get noSubCategoriesAvailable;

  /// No brands available message
  ///
  /// In en, this message translates to:
  /// **'No brands available'**
  String get noBrandsAvailable;

  /// No units available message
  ///
  /// In en, this message translates to:
  /// **'No units available'**
  String get noUnitsAvailable;

  /// No models available message
  ///
  /// In en, this message translates to:
  /// **'No models available'**
  String get noModelsAvailable;

  /// Search batches hint text
  ///
  /// In en, this message translates to:
  /// **'Search by batch name...'**
  String get searchByBatchName;

  /// Batch number label with number
  ///
  /// In en, this message translates to:
  /// **'Batch #: {batchNumber}'**
  String batchNumberLabel(String batchNumber);

  /// Item name label
  ///
  /// In en, this message translates to:
  /// **'Item: {itemName}'**
  String itemNameLabel(String itemName);

  /// No additional details available message
  ///
  /// In en, this message translates to:
  /// **'No additional details available'**
  String get noAdditionalDetailsAvailable;

  /// Filter sales report dialog title
  ///
  /// In en, this message translates to:
  /// **'Filter Sales Report'**
  String get filterSalesReport;

  /// Filter purchase report dialog title
  ///
  /// In en, this message translates to:
  /// **'Filter Purchase Report'**
  String get filterPurchaseReport;

  /// Filter expense report dialog title
  ///
  /// In en, this message translates to:
  /// **'Filter Expense Report'**
  String get filterExpenseReport;

  /// Place order button text
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get placeOrder;

  /// No banks available message
  ///
  /// In en, this message translates to:
  /// **'No banks available'**
  String get noBanksAvailable;

  /// Receipt attached label
  ///
  /// In en, this message translates to:
  /// **'Receipt attached'**
  String get receiptAttached;

  /// No description provided for @walkingCustomer.
  ///
  /// In en, this message translates to:
  /// **'Walking'**
  String get walkingCustomer;

  /// No description provided for @allTransactions.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allTransactions;

  /// No description provided for @selectCustomer.
  ///
  /// In en, this message translates to:
  /// **'Select Customer'**
  String get selectCustomer;

  /// No description provided for @pleaseSelectBatchForItem.
  ///
  /// In en, this message translates to:
  /// **'Please select a batch for this item'**
  String get pleaseSelectBatchForItem;

  /// No description provided for @pleaseSelectAtLeastOneBatch.
  ///
  /// In en, this message translates to:
  /// **'Please select at least one batch for each item'**
  String get pleaseSelectAtLeastOneBatch;

  /// Add receipt button label
  ///
  /// In en, this message translates to:
  /// **'Add Receipt'**
  String get addReceipt;

  /// Tap to upload hint text
  ///
  /// In en, this message translates to:
  /// **'Tap to upload'**
  String get tapToUpload;

  /// Please select item validation message
  ///
  /// In en, this message translates to:
  /// **'Please select an item'**
  String get pleaseSelectItem;

  /// Select item hint
  ///
  /// In en, this message translates to:
  /// **'Select an item'**
  String get selectItem;

  /// Configuration section title
  ///
  /// In en, this message translates to:
  /// **'Configuration'**
  String get configuration;

  /// No suppliers empty state
  ///
  /// In en, this message translates to:
  /// **'No suppliers'**
  String get noSuppliers;

  /// No expense categories empty state
  ///
  /// In en, this message translates to:
  /// **'No expense categories'**
  String get noExpenseCategories;

  /// Create supplier screen title
  ///
  /// In en, this message translates to:
  /// **'Create Supplier'**
  String get createSupplier;

  /// Create customer screen title
  ///
  /// In en, this message translates to:
  /// **'Create Customer'**
  String get createCustomer;

  /// Create item screen title
  ///
  /// In en, this message translates to:
  /// **'Create Item'**
  String get createItem;

  /// Update item screen title
  ///
  /// In en, this message translates to:
  /// **'Update Item'**
  String get updateItem;

  /// Delete item dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete Item'**
  String get deleteItem;

  /// Select items screen title
  ///
  /// In en, this message translates to:
  /// **'Select Items'**
  String get selectItems;

  /// Expense details screen title
  ///
  /// In en, this message translates to:
  /// **'Expense Details'**
  String get expenseDetails;

  /// Batch details screen title
  ///
  /// In en, this message translates to:
  /// **'Batch Details'**
  String get batchDetails;

  /// Identification section title
  ///
  /// In en, this message translates to:
  /// **'Identification'**
  String get identification;

  /// Product details section title
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get productDetails;

  /// Relationships section title
  ///
  /// In en, this message translates to:
  /// **'Relationships'**
  String get relationships;

  /// Pricing section title
  ///
  /// In en, this message translates to:
  /// **'Pricing'**
  String get pricing;

  /// Tax and status section title
  ///
  /// In en, this message translates to:
  /// **'Tax & Status'**
  String get taxAndStatus;

  /// Dates optional section title
  ///
  /// In en, this message translates to:
  /// **'Dates (Optional)'**
  String get datesOptional;

  /// Actions section title
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get actions;

  /// Edit expense category dialog title
  ///
  /// In en, this message translates to:
  /// **'Edit Expense Category'**
  String get editExpenseCategory;

  /// Trade name label
  ///
  /// In en, this message translates to:
  /// **'Trade Name'**
  String get tradeName;

  /// Attachment label with index
  ///
  /// In en, this message translates to:
  /// **'Attachment {index}'**
  String attachmentIndex(int index);

  /// Select customer dropdown hint (optional)
  ///
  /// In en, this message translates to:
  /// **'Select Customer (optional)'**
  String get selectCustomerOptional;

  /// Select payment method dropdown hint
  ///
  /// In en, this message translates to:
  /// **'Select payment method'**
  String get selectPaymentMethod;

  /// Attach receipt placeholder
  ///
  /// In en, this message translates to:
  /// **'Attach receipt (optional)'**
  String get attachReceiptOptional;

  /// Failed to load banks error message with error details
  ///
  /// In en, this message translates to:
  /// **'Failed to load banks: {error}'**
  String failedToLoadBanksWithError(String error);

  /// Search by name, code, SKU hint
  ///
  /// In en, this message translates to:
  /// **'Search by name, code, SKU...'**
  String get searchByNameCodeSku;

  /// Select business type hint
  ///
  /// In en, this message translates to:
  /// **'Select Business Type'**
  String get selectBusinessType;

  /// Select calendar type hint
  ///
  /// In en, this message translates to:
  /// **'Select Calendar Type'**
  String get selectCalendarType;

  /// Unit price low to high sort option
  ///
  /// In en, this message translates to:
  /// **'Unit Price (Low to High)'**
  String get unitPriceLowToHigh;

  /// Unit price high to low sort option
  ///
  /// In en, this message translates to:
  /// **'Unit Price (High to Low)'**
  String get unitPriceHighToLow;

  /// Cost price low to high sort option
  ///
  /// In en, this message translates to:
  /// **'Cost Price (Low to High)'**
  String get costPriceLowToHigh;

  /// Cost price high to low sort option
  ///
  /// In en, this message translates to:
  /// **'Cost Price (High to Low)'**
  String get costPriceHighToLow;

  /// Select sub-category hint
  ///
  /// In en, this message translates to:
  /// **'Select Sub-Category'**
  String get selectSubCategory;

  /// Select brand hint
  ///
  /// In en, this message translates to:
  /// **'Select Brand'**
  String get selectBrand;

  /// Select unit hint
  ///
  /// In en, this message translates to:
  /// **'Select Unit'**
  String get selectUnit;

  /// Select model hint
  ///
  /// In en, this message translates to:
  /// **'Select Model'**
  String get selectModel;

  /// Enter limit hint
  ///
  /// In en, this message translates to:
  /// **'Enter limit (e.g., 1000)'**
  String get enterLimit;

  /// Select status hint
  ///
  /// In en, this message translates to:
  /// **'Select Status'**
  String get selectStatus;

  /// Search by name hint
  ///
  /// In en, this message translates to:
  /// **'Search by name...'**
  String get searchByName;

  /// Date label
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// Created label
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get created;

  /// Updated label
  ///
  /// In en, this message translates to:
  /// **'Updated'**
  String get updated;

  /// Need stock label
  ///
  /// In en, this message translates to:
  /// **'Need Stock'**
  String get needStock;

  /// Available quantity label
  ///
  /// In en, this message translates to:
  /// **'Available Quantity'**
  String get availableQuantity;

  /// Batch number label
  ///
  /// In en, this message translates to:
  /// **'Batch Number'**
  String get batchNumber;

  /// Item ID label
  ///
  /// In en, this message translates to:
  /// **'Item ID'**
  String get itemId;

  /// Item name label
  ///
  /// In en, this message translates to:
  /// **'Item Name'**
  String get itemName;

  /// Supplier batch number label
  ///
  /// In en, this message translates to:
  /// **'Supplier Batch Number'**
  String get supplierBatchNumber;

  /// SKU label
  ///
  /// In en, this message translates to:
  /// **'SKU'**
  String get sku;

  /// Barcode label
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get barcode;

  /// Expiration date label
  ///
  /// In en, this message translates to:
  /// **'Expiration Date'**
  String get expirationDate;

  /// Manufacturing date label
  ///
  /// In en, this message translates to:
  /// **'Manufacturing Date'**
  String get manufacturingDate;

  /// Select supplier hint
  ///
  /// In en, this message translates to:
  /// **'Select Supplier'**
  String get selectSupplier;

  /// Select user type hint
  ///
  /// In en, this message translates to:
  /// **'Select User Type'**
  String get selectUserType;

  /// Limit label
  ///
  /// In en, this message translates to:
  /// **'Limit'**
  String get limit;

  /// Current password field label
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// Current password required validation
  ///
  /// In en, this message translates to:
  /// **'Current password is required'**
  String get currentPasswordRequired;

  /// Reference number field label
  ///
  /// In en, this message translates to:
  /// **'Reference Number'**
  String get referenceNumber;

  /// No customers empty state message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any customers yet.'**
  String get noCustomersMessage;

  /// No items empty state message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any items yet.'**
  String get noItemsMessage;

  /// Empty sub-categories list message for a specific category
  ///
  /// In en, this message translates to:
  /// **'This category doesn\'t have any sub-categories yet.'**
  String get noSubCategoriesInCategoryMessage;

  /// No expense categories empty state message
  ///
  /// In en, this message translates to:
  /// **'You don\'t have any expense categories yet.'**
  String get noExpenseCategoriesMessage;

  /// Role assignments section title
  ///
  /// In en, this message translates to:
  /// **'Role Assignments by Branch'**
  String get roleAssignmentsByBranch;

  /// Error message when loading role assignments fails
  ///
  /// In en, this message translates to:
  /// **'Error loading role assignments: {error}'**
  String errorLoadingRoleAssignments(String error);

  /// Empty role assignments message
  ///
  /// In en, this message translates to:
  /// **'No role assignments found'**
  String get noRoleAssignmentsFound;

  /// Empty role assignments detailed message
  ///
  /// In en, this message translates to:
  /// **'This user doesn\'t have any role assignments in any branch yet.'**
  String get noRoleAssignmentsMessage;

  /// No roles available message
  ///
  /// In en, this message translates to:
  /// **'No roles available'**
  String get noRolesAvailable;

  /// Category has no sub-categories message
  ///
  /// In en, this message translates to:
  /// **'This category doesn\'t have any sub-categories yet.'**
  String get thisCategoryHasNoSubCategories;

  /// Amount field label
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// Search customers hint
  ///
  /// In en, this message translates to:
  /// **'Search customers...'**
  String get searchCustomers;

  /// Quantity field label
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// Payments section title
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// Empty payments list message
  ///
  /// In en, this message translates to:
  /// **'No payments recorded'**
  String get noPaymentsRecorded;

  /// Confirm reverse transaction dialog message
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reverse this transaction?'**
  String get confirmReverseTransaction;

  /// Warning message for irreversible actions
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get thisActionCannotBeUndone;

  /// Not available label
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get nA;

  /// Expense category type label
  ///
  /// In en, this message translates to:
  /// **'expense category'**
  String get expenseCategory;

  /// OTP validation error message
  ///
  /// In en, this message translates to:
  /// **'Please enter a complete 6-digit code'**
  String get pleaseEnterComplete6DigitCode;

  /// Reset token not found error message
  ///
  /// In en, this message translates to:
  /// **'No reset token found'**
  String get noResetTokenFound;

  /// Login success message
  ///
  /// In en, this message translates to:
  /// **'Login successful! Welcome back.'**
  String get loginSuccessful;

  /// Registration loading message
  ///
  /// In en, this message translates to:
  /// **'Creating account...'**
  String get creatingAccount;

  /// Registration success message
  ///
  /// In en, this message translates to:
  /// **'Account created successfully! Please verify your account.'**
  String get accountCreatedSuccessfully;

  /// Account verification success message
  ///
  /// In en, this message translates to:
  /// **'Account verified successfully! You can now access all features.'**
  String get accountVerifiedSuccessfully;

  /// OTP validation success message
  ///
  /// In en, this message translates to:
  /// **'OTP validated successfully!'**
  String get otpValidatedSuccessfully;

  /// Password reset link sent message
  ///
  /// In en, this message translates to:
  /// **'Password reset link sent to your phone number.'**
  String get passwordResetLinkSent;

  /// Generic password reset link sent message
  ///
  /// In en, this message translates to:
  /// **'If an account exists with this phone number, a reset link has been sent.'**
  String get passwordResetLinkSentGeneric;

  /// Password reset success message
  ///
  /// In en, this message translates to:
  /// **'Password reset successfully! You can now login with your new password.'**
  String get passwordResetSuccessfully;

  /// Password change success message
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully!'**
  String get passwordChangedSuccessfully;

  /// Profile update success message
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully!'**
  String get profileUpdatedSuccessfully;

  /// Account deletion success message
  ///
  /// In en, this message translates to:
  /// **'Account deleted successfully. We\'re sorry to see you go.'**
  String get accountDeletedSuccessfully;

  /// OTP resend success message
  ///
  /// In en, this message translates to:
  /// **'OTP resent successfully! Please check your phone.'**
  String get otpResentSuccessfully;

  /// Generic OTP resend message
  ///
  /// In en, this message translates to:
  /// **'If an account exists with this phone number, an OTP has been resent.'**
  String get otpResentGeneric;

  /// Logout success message
  ///
  /// In en, this message translates to:
  /// **'Logged out successfully!'**
  String get loggedOutSuccessfully;

  /// Authentication refresh success message
  ///
  /// In en, this message translates to:
  /// **'Authentication refreshed!'**
  String get authenticationRefreshed;

  /// No authenticated user message
  ///
  /// In en, this message translates to:
  /// **'No authenticated user found.'**
  String get noAuthenticatedUserFound;

  /// No description provided for @sendingResetLink.
  ///
  /// In en, this message translates to:
  /// **'Sending reset link...'**
  String get sendingResetLink;

  /// No description provided for @validatingOtp.
  ///
  /// In en, this message translates to:
  /// **'Validating OTP...'**
  String get validatingOtp;

  /// No description provided for @changingPassword.
  ///
  /// In en, this message translates to:
  /// **'Changing password...'**
  String get changingPassword;

  /// No description provided for @updatingProfile.
  ///
  /// In en, this message translates to:
  /// **'Updating profile...'**
  String get updatingProfile;

  /// No description provided for @deletingAccount.
  ///
  /// In en, this message translates to:
  /// **'Deleting account...'**
  String get deletingAccount;

  /// No description provided for @loggingOut.
  ///
  /// In en, this message translates to:
  /// **'Logging out...'**
  String get loggingOut;

  /// No description provided for @refreshing.
  ///
  /// In en, this message translates to:
  /// **'Refreshing...'**
  String get refreshing;

  /// No description provided for @companySelected.
  ///
  /// In en, this message translates to:
  /// **'Company Selected'**
  String get companySelected;

  /// No description provided for @branchSelected.
  ///
  /// In en, this message translates to:
  /// **'Branch Selected'**
  String get branchSelected;

  /// No description provided for @noContextSelected.
  ///
  /// In en, this message translates to:
  /// **'No Context Selected'**
  String get noContextSelected;

  /// No description provided for @companyAndBranchSelected.
  ///
  /// In en, this message translates to:
  /// **'Company & Branch Selected'**
  String get companyAndBranchSelected;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get viewDetails;

  /// No description provided for @noRolesAssigned.
  ///
  /// In en, this message translates to:
  /// **'No roles assigned'**
  String get noRolesAssigned;

  /// No description provided for @balanceAddedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Balance added successfully'**
  String get balanceAddedSuccess;

  /// No description provided for @refundProcessedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Refund processed successfully'**
  String get refundProcessedSuccess;

  /// Bank creation success message
  ///
  /// In en, this message translates to:
  /// **'Bank created successfully'**
  String get bankCreatedSuccessfully;

  /// Bank update success message
  ///
  /// In en, this message translates to:
  /// **'Bank updated successfully'**
  String get bankUpdatedSuccessfully;

  /// Bank deletion success message
  ///
  /// In en, this message translates to:
  /// **'Bank deleted successfully'**
  String get bankDeletedSuccessfully;

  /// Company switch sync failure message
  ///
  /// In en, this message translates to:
  /// **'Failed to sync company switch with server. Your selection is saved locally.'**
  String get failedToSyncCompanySwitch;

  /// Branch switch sync failure message
  ///
  /// In en, this message translates to:
  /// **'Failed to sync branch switch with server. Your selection is saved locally.'**
  String get failedToSyncBranchSwitch;

  /// Brand created success message
  ///
  /// In en, this message translates to:
  /// **'Brand created successfully'**
  String get brandCreatedSuccessfully;

  /// Brand updated success message
  ///
  /// In en, this message translates to:
  /// **'Brand updated successfully'**
  String get brandUpdatedSuccessfully;

  /// Brand deleted success message
  ///
  /// In en, this message translates to:
  /// **'Brand deleted successfully'**
  String get brandDeletedSuccessfully;

  /// Category created success message
  ///
  /// In en, this message translates to:
  /// **'Category created successfully'**
  String get categoryCreatedSuccessfully;

  /// Category updated success message
  ///
  /// In en, this message translates to:
  /// **'Category updated successfully'**
  String get categoryUpdatedSuccessfully;

  /// Category deleted success message
  ///
  /// In en, this message translates to:
  /// **'Category deleted successfully'**
  String get categoryDeletedSuccessfully;

  /// Company updated success message
  ///
  /// In en, this message translates to:
  /// **'Company updated successfully'**
  String get companyUpdatedSuccessfully;

  /// Stock updated success message
  ///
  /// In en, this message translates to:
  /// **'Stock updated successfully'**
  String get stockUpdatedSuccessfully;

  /// Company logo label
  ///
  /// In en, this message translates to:
  /// **'Company Logo'**
  String get companyLogo;

  /// One day period label
  ///
  /// In en, this message translates to:
  /// **'1D'**
  String get oneDay;

  /// Two days period label
  ///
  /// In en, this message translates to:
  /// **'2D'**
  String get twoDays;

  /// Seven days period label
  ///
  /// In en, this message translates to:
  /// **'7D'**
  String get sevenDays;

  /// Ten days period label
  ///
  /// In en, this message translates to:
  /// **'10D'**
  String get tenDays;

  /// Thirty days period label
  ///
  /// In en, this message translates to:
  /// **'30D'**
  String get thirtyDays;

  /// Attachments count label
  ///
  /// In en, this message translates to:
  /// **'Attachments ({count})'**
  String attachmentsCount(int count);

  /// Expense category created success message
  ///
  /// In en, this message translates to:
  /// **'Expense category created successfully'**
  String get expenseCategoryCreatedSuccessfully;

  /// Expense category updated success message
  ///
  /// In en, this message translates to:
  /// **'Expense category updated successfully'**
  String get expenseCategoryUpdatedSuccessfully;

  /// Expense category deleted success message
  ///
  /// In en, this message translates to:
  /// **'Expense category deleted successfully'**
  String get expenseCategoryDeletedSuccessfully;

  /// Item created success message
  ///
  /// In en, this message translates to:
  /// **'Item created successfully'**
  String get itemCreatedSuccessfully;

  /// Item updated success message
  ///
  /// In en, this message translates to:
  /// **'Item updated successfully'**
  String get itemUpdatedSuccessfully;

  /// Item deleted success message
  ///
  /// In en, this message translates to:
  /// **'Item deleted successfully'**
  String get itemDeletedSuccessfully;

  /// Code field validation message
  ///
  /// In en, this message translates to:
  /// **'Code is required'**
  String get codeRequired;

  /// Cost price required validation message
  ///
  /// In en, this message translates to:
  /// **'Cost price is required'**
  String get costPriceRequired;

  /// Cost price must be greater than zero validation message
  ///
  /// In en, this message translates to:
  /// **'Cost price must be greater than 0'**
  String get costPriceMustBeGreaterThanZero;

  /// Unit price required validation message
  ///
  /// In en, this message translates to:
  /// **'Unit price is required'**
  String get unitPriceRequired;

  /// Unit price must be greater than zero validation message
  ///
  /// In en, this message translates to:
  /// **'Unit price must be greater than 0'**
  String get unitPriceMustBeGreaterThanZero;

  /// Unit price must be greater than or equal to cost price validation message
  ///
  /// In en, this message translates to:
  /// **'Unit price must be greater than or equal to cost price'**
  String get unitPriceMustBeGreaterThanOrEqualToCostPrice;

  /// Tax rate required validation message
  ///
  /// In en, this message translates to:
  /// **'Tax rate is required'**
  String get taxRateRequired;

  /// Tax rate must be between 0 and 100 validation message
  ///
  /// In en, this message translates to:
  /// **'Tax rate must be between 0 and 100'**
  String get taxRateMustBeBetween0And100;

  /// Filter items tooltip
  ///
  /// In en, this message translates to:
  /// **'Filter items'**
  String get filterItems;

  /// Model created success message
  ///
  /// In en, this message translates to:
  /// **'Model created successfully'**
  String get modelCreatedSuccessfully;

  /// Model updated success message
  ///
  /// In en, this message translates to:
  /// **'Model updated successfully'**
  String get modelUpdatedSuccessfully;

  /// Model deleted success message
  ///
  /// In en, this message translates to:
  /// **'Model deleted successfully'**
  String get modelDeletedSuccessfully;

  /// Payment method created success message
  ///
  /// In en, this message translates to:
  /// **'Payment method created successfully'**
  String get paymentMethodCreatedSuccessfully;

  /// Payment method updated success message
  ///
  /// In en, this message translates to:
  /// **'Payment method updated successfully'**
  String get paymentMethodUpdatedSuccessfully;

  /// Payment method deleted success message
  ///
  /// In en, this message translates to:
  /// **'Payment method deleted successfully'**
  String get paymentMethodDeletedSuccessfully;

  /// Profile picture uploaded success message
  ///
  /// In en, this message translates to:
  /// **'Profile picture uploaded successfully'**
  String get profilePictureUploadedSuccessfully;

  /// No description provided for @transferLabel.
  ///
  /// In en, this message translates to:
  /// **'Transfer: {number}'**
  String transferLabel(String number);

  /// No description provided for @by.
  ///
  /// In en, this message translates to:
  /// **'by'**
  String get by;

  /// No description provided for @arrow.
  ///
  /// In en, this message translates to:
  /// **'→'**
  String get arrow;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['am', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'am':
      return AppLocalizationsAm();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
