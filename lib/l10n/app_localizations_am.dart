// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get appTitle => 'ሳይበር ቴክ';

  @override
  String get appTitleWithPos => 'ሳይበር ቴክ POS';

  @override
  String get welcome => 'እንኳን ደህና መጡ';

  @override
  String get home => 'መነሻ';

  @override
  String get settings => 'ቅንብሮች';

  @override
  String get language => 'ቋንቋ';

  @override
  String get theme => 'ገጽታ';

  @override
  String get lightMode => 'ብርሃን ገጽታ';

  @override
  String get darkMode => 'ጨለማ ገጽታ';

  @override
  String get brandColor => 'የምርት ቀለም';

  @override
  String get save => 'አስቀምጥ';

  @override
  String get cancel => 'ሰርዝ';

  @override
  String get ok => 'እሺ';

  @override
  String get error => 'ስህተት';

  @override
  String get success => 'ተሳክቷል';

  @override
  String get loading => 'በመጫን ላይ...';

  @override
  String get retry => 'እንደገና ሞክር';

  @override
  String get close => 'ዝጋ';

  @override
  String greetingMessage(String userName) {
    return 'ሰላም፣ $userName!';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ነገሮች',
      one: '1 ነገር',
      zero: 'ምንም ነገር የለም',
    );
    return '$_temp0';
  }

  @override
  String get logout => 'ውጣ';

  @override
  String get login => 'ግባ';

  @override
  String get email => 'ኢሜይል';

  @override
  String get password => 'የይለፍ ቃል';

  @override
  String get forgotPassword => 'የይለፍ ቃልዎን ረሱ?';

  @override
  String get noAccount => 'መለያ የለዎትም?';

  @override
  String get signUp => 'ይመዝገቡ';

  @override
  String get createAccount => 'መለያ ይፍጠሩ';

  @override
  String get joinUsToday => 'ዛሬ ይቀላቀሉን';

  @override
  String get createAccountToGetStarted => 'ለመጀመር መለያዎን ይፍጠሩ';

  @override
  String get firstName => 'የመጀመሪያ ስም';

  @override
  String get lastName => 'የአባት ስም';

  @override
  String get companyName => 'የኩባንያ ስም';

  @override
  String get phoneNumber => 'የስልክ ቁጥር';

  @override
  String get phoneNumberHint => '+251012001708';

  @override
  String get confirmPassword => 'የይለፍ ቃል ያረጋግጡ';

  @override
  String get confirmPasswordHint => 'የይለፍ ቃልዎን ያረጋግጡ';

  @override
  String get acceptTerms => 'የአገልግሎት ውሎችን እቀበላለሁ';

  @override
  String get termsDescription =>
      'ይህን ሳጥን በመመርጥ የአገልግሎት ውሎችን እና የግላዊነት ፖሊሲያችንን እቀበላለሁ።';

  @override
  String get passwordStrength => 'የይለፍ ቃል ጥንካሬ';

  @override
  String get registrationSuccessful => 'መዝገብ በተሳካ ሁኔታ';

  @override
  String welcomeUser(String name) {
    return 'እንኳን ደህና መጡ፣ $name!';
  }

  @override
  String get verifyAccount => 'እባክዎ መለያዎን ያረጋግጡ:';

  @override
  String get checkEmailForVerification => '• ለማረጋገጫ ኢሜይልዎን ይፈልጉ';

  @override
  String get checkPhoneForVerification => '• ለማረጋገጫ ስልክዎን ይፈልጉ';

  @override
  String get canLoginNow => 'አሁን በምልክቶችዎ መግባት ይችላሉ።';

  @override
  String get alreadyHaveAccount => 'አስቀድመው መለያ አላችሁ?';

  @override
  String get signIn => 'ግባ';

  @override
  String get changeLanguage => 'ቋንቋ ቀይር';

  @override
  String get welcomeBack => 'እንኳን ደህና መጡ!';

  @override
  String get loginToContinue => 'ለመቀጠል ይግቡ';

  @override
  String get emailHint => 'ኢሜይልዎን ያስገቡ';

  @override
  String get passwordHint => 'የይለፍ ቃልዎን ያስገቡ';

  @override
  String get rememberMe => 'አስታውሰኝ';

  @override
  String get loginButton => 'ግባ';

  @override
  String get loggingIn => 'በመግባት ላይ...';

  @override
  String get emailRequired => 'ኢሜይል ያስፈልጋል';

  @override
  String get invalidEmail => 'እባክዎ ትክክለኛ ኢሜይል ያስገቡ';

  @override
  String get passwordRequired => 'የይለፍ ቃል ያስፈልጋል';

  @override
  String get passwordMinLength => 'የይለፍ ቃል ቢያንስ 6 ቁምፊዎች መሆን አለበት';

  @override
  String get loginSuccess => 'በተሳካ ሁኔታ ገብተዋል!';

  @override
  String get loginFailed => 'መግባት አልተሳካም';

  @override
  String get invalidCredentials => 'የተሳሳተ ኢሜይል ወይም የይለፍ ቃል';

  @override
  String get orLoginWith => 'ወይም በሚከተለው ይግቡ';

  @override
  String get googleLogin => 'ጉግል';

  @override
  String get facebookLogin => 'ፌስቡክ';

  @override
  String get appleLogin => 'አፕል';

  @override
  String get socialLoginComingSoon => 'ማህበራዊ መግባት በቅርቡ ይመጣል';

  @override
  String get languageToggle => 'ቋንቋ ቀይር';

  @override
  String get continueAsGuest => 'እንደ እንግዳ ቀጥል';

  @override
  String get calendar => 'የቀን መቁጠሪያ';

  @override
  String get selectDate => 'ቀን ይምረጡ';

  @override
  String get gregorianCalendar => 'ግሪጎሪያን የቀን መቁጠሪያ';

  @override
  String get ethiopianCalendar => 'የኢትዮጵያ የቀን መቁጠሪያ';

  @override
  String get calendarType => 'የቀን መቁጠሪያ አይነት';

  @override
  String get today => 'ዛሬ';

  @override
  String get selectedDate => 'የተመረጠ ቀን';

  @override
  String get ethiopianMonthMeskerem => 'መስከረም';

  @override
  String get ethiopianMonthTikimt => 'ጥቅምት';

  @override
  String get ethiopianMonthHidar => 'ህዳር';

  @override
  String get ethiopianMonthTahsas => 'ታህሳስ';

  @override
  String get ethiopianMonthTir => 'ጥር';

  @override
  String get ethiopianMonthYekatit => 'የካቲት';

  @override
  String get ethiopianMonthMegabit => 'መጋቢት';

  @override
  String get ethiopianMonthMiazia => 'ሚያዝያ';

  @override
  String get ethiopianMonthGenbot => 'ግንቦት';

  @override
  String get ethiopianMonthSene => 'ሰኔ';

  @override
  String get ethiopianMonthHamle => 'ሐምሌ';

  @override
  String get ethiopianMonthNehasse => 'ነሐሴ';

  @override
  String get ethiopianMonthPagumen => 'ጳጉሜን';

  @override
  String get dateRange => 'የቀን ክልል';

  @override
  String get selectDateRange => 'የቀን ክልል ይምረጡ';

  @override
  String get startDate => 'የመጀመሪያ ቀን';

  @override
  String get endDate => 'የመጨረሻ ቀን';

  @override
  String get selectingStart => 'የመጀመሪያ ቀን በመምረጥ ላይ';

  @override
  String get selectingEnd => 'የመጨረሻ ቀን በመምረጥ ላይ';

  @override
  String get duration => 'ቆይታ';

  @override
  String days(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ቀናት',
      one: '1 ቀን',
      zero: '0 ቀናት',
    );
    return '$_temp0';
  }

  @override
  String get clearSelection => 'ምርጫ አጽዳ';

  @override
  String get selectRange => 'ክልል ምረጥ';

  @override
  String get defaultDate => 'ነባሪ ቀን';

  @override
  String get defaultStartDate => 'ነባሪ የመጀመሪያ ቀን';

  @override
  String get setDefaultDate => 'ነባሪ ቀን ያስቀምጡ';

  @override
  String get defaultDateDescription => 'ይህ ቀን ለዳሽቦርድ እና ለመረጃ ማጣሪያ ይውላል';

  @override
  String get noDefaultDate => 'ምንም ነባሪ ቀን አልተቀመጠም';

  @override
  String get themeSettings => 'የገጽታ ቅንብሮች';

  @override
  String get languageSettings => 'የቋንቋ ቅንብሮች';

  @override
  String get dateSettings => 'የቀን ቅንብሮች';

  @override
  String get appearance => 'ገጽታ';

  @override
  String get general => 'አጠቃላይ';

  @override
  String get calendarDisplayType => 'የቀን መቁጠሪያ ማሳያ';

  @override
  String get calendarDisplayDescription => 'በመተግበሪያው ውስጥ ቀኖች እንዴት እንደሚታዩ ይምረጡ';

  @override
  String get autoDetect => 'ራስ-ሰር (በቋንቋ ላይ የተመሰረተ)';

  @override
  String get displayInGregorian => 'ሁልጊዜ ግሪጎሪያን';

  @override
  String get displayInEthiopian => 'ሁልጊዜ ኢትዮጵያን';

  @override
  String get getStarted => 'ጀምር';

  @override
  String get addItem => 'ንጥል ጨምር';

  @override
  String get browseItems => 'ንጥሎች ያስሱ';

  @override
  String get startShopping => 'ግዢ ጀምር';

  @override
  String get clearSearch => 'ፍለጋ አጽዳ';

  @override
  String get completeProfile => 'መገለጫ ሙሉ';

  @override
  String get networkError =>
      'የኔትዎርክ ግንኙነት አልተሳካም። እባክዎ የኢንተርኔት ግንኙነትዎን ያረጋግጡ እና እንደገና ይሞክሩ።';

  @override
  String get serverError => 'የሰርቨር ስህተት ተከስቷል። እባክዎ ቆይተው እንደገና ይሞክሩ።';

  @override
  String get notFound => 'አልተገኘም';

  @override
  String get notFoundMessage => 'የተጠየቀው ይዘት አልተገኘም።';

  @override
  String get permissionError => 'ፈቃድ ተከልክሏል። ለመቀጠል አስፈላጊውን ፈቃድ እባክዎ ይስጡ።';

  @override
  String get noItemsFound => 'ምንም ንጥል አልተገኘም። የመጀመሪያውን ንጥልዎን በመጨመር ይጀምሩ።';

  @override
  String get noResultsFound => 'ምንም ውጤት አልተገኘም። የፍለጋ ቃላትዎን እባክዎ ያስተካክሉ።';

  @override
  String get noFavoritesYet =>
      'እስካሁን ምንም ተወዳጅ አልተጨመረም። የሚወዷቸውን ንጥሎች በመጨመር ይጀምሩ።';

  @override
  String get noNotificationsYet =>
      'እስካሁን ምንም ማሳወቂያ የለም። አስፈላጊ ነገር በሚከሰት ጊዜ እናሳውቅዎታለን።';

  @override
  String get cartEmpty => 'የግዢ ቅርጫትዎ ባዶ ነው። ለመጀመር አንዳንድ ንጥሎች ይጨምሩ።';

  @override
  String get profileIncomplete => 'የመገለጫዎን ሙሉ ለማድረግ አፕሊኬሽኑን በተሻለ ሁኔታ ለመጠቀም።';

  @override
  String get loadingData => 'ውሂብ በመጫን ላይ...';

  @override
  String get pleaseWait => 'እባክዎ ይጠብቁ...';

  @override
  String get required => 'ያስፈልጋል';

  @override
  String get fieldRequired => 'ይህ መስክ ያስፈልጋል';

  @override
  String get enterEmail => 'ኢሜይልዎን ያስገቡ';

  @override
  String get enterPassword => 'የይለፍ ቃል ያስገቡ';

  @override
  String get searchHint => 'ፍለጋ...';

  @override
  String get searchByItemName => 'በንጥል ስም ፍለጋ...';

  @override
  String get selectOption => 'አማራጭ ይምረጡ';

  @override
  String get search => 'ፍለጋ';

  @override
  String get menu => 'ምናሌ';

  @override
  String get back => 'ተመለስ';

  @override
  String get done => 'ተጠናቋል';

  @override
  String get edit => 'አርትዖ';

  @override
  String get delete => 'ሰርዝ';

  @override
  String get share => 'አጋራ';

  @override
  String get copy => 'ቅዳ';

  @override
  String get paste => 'ጣቅም';

  @override
  String get cut => 'ቈርጥ';

  @override
  String get selectAll => 'ሁሉንም ይምረጡ';

  @override
  String get more => 'ተጨማሪ';

  @override
  String get less => 'ተጨማሪ';

  @override
  String get showMore => 'ተጨማሪ አሳይ';

  @override
  String get showLess => 'ተጨማሪ አሳይ';

  @override
  String get expand => 'ዘርጋ';

  @override
  String get collapse => 'ጠቅ';

  @override
  String get refresh => 'አደስ';

  @override
  String get filter => 'አጣራ';

  @override
  String get sort => 'ደርድር';

  @override
  String get view => 'እይታ';

  @override
  String get details => 'ዝርዝሮች';

  @override
  String get summary => 'ማጠቃለያ';

  @override
  String get preview => 'ቅድመ እይታ';

  @override
  String get fullScreen => 'ሙሉ ማያ';

  @override
  String get exitFullScreen => 'ሙሉ ማያ ውጣ';

  @override
  String get welcomeToApp => 'ወደ ሳይበር ቴክ እንኳን ደህና መጡ';

  @override
  String get appName => 'ደህንነት ያለው ማረጋገጫ';

  @override
  String get signInToContinue => 'ለመቀጠል ወደ መለያዎ ይግቡ';

  @override
  String get emailAddress => 'የኢሜል አድራሻ';

  @override
  String get enterYourEmail => 'ኢሜልዎን ያስገቡ';

  @override
  String get enterYourPassword => 'የይለፍ ቃልዎን ያስገቡ';

  @override
  String get pleaseEnterPassword => 'እባክዎ የይለፍ ቃልዎን ያስገቡ';

  @override
  String get signingIn => 'በመግባት ላይ...';

  @override
  String get or => 'ወይም';

  @override
  String get continueWithGoogle => 'በ Google ይቀጥሉ';

  @override
  String get dontHaveAccount => 'መለያ የለዎትም?';

  @override
  String get fullName => 'ሙሉ ስም';

  @override
  String get byCreatingAccount => 'መለያ በመፍጠር እኛን በማመንታት ተስማምተዋል';

  @override
  String get termsOfUse => 'የአጠቃቀም ውሎች';

  @override
  String get and => 'እና';

  @override
  String get privacyPolicy => 'የግላዊነት ፖሊሲ';

  @override
  String get goToHome => 'ወደ መነሻ ይሂዱ';

  @override
  String get loginAccount => 'ወደ መለያዎ ይግቡ';

  @override
  String get enterPhone => 'የስልክ ቁጥር ያስገቡ';

  @override
  String get enterValidPhone => 'እባክዎ ትክክለኛ የስልክ ቁጥር ያስገቡ';

  @override
  String get enterValidPassword => 'እባክዎ ትክክለኛ የይለፍ ቃል ያስገቡ';

  @override
  String get loginWithGoogle => 'በ Google ይግቡ';

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
  String get companies => 'ኩባንያዎች';

  @override
  String get customers => 'ደንበኞች';

  @override
  String get suppliers => 'አቅራቢዎች';

  @override
  String get supplier => 'አቅራቢ';

  @override
  String get customer => 'ደንበኛ';

  @override
  String get editCustomer => 'ደንበኛ አርትዖ';

  @override
  String get editSupplier => 'አቅራቢ አርትዖ';

  @override
  String get type => 'ዓይነት';

  @override
  String get name => 'ስም';

  @override
  String get description => 'መግለጫ';

  @override
  String get accountCode => 'የመለያ ኮድ';

  @override
  String get tinNumber => 'የTIN ቁጥር';

  @override
  String get customerDetails => 'የደንበኛ ዝርዝሮች';

  @override
  String get supplierDetails => 'የአቅራቢ ዝርዝሮች';

  @override
  String get businessInformation => 'የንግድ መረጃ';

  @override
  String get accountDetails => 'የመለያ ዝርዝሮች';

  @override
  String get balance => 'ቀሪ ሂሳብ';

  @override
  String get categories => 'ምድቦች';

  @override
  String get subCategories => 'ንዑስ ምድቦች';

  @override
  String get units => 'አሃዶች';

  @override
  String get brands => 'የምርት ስም';

  @override
  String get models => 'ሞዴሎች';

  @override
  String get items => 'ንጥሎች';

  @override
  String get item => 'ንጥል';

  @override
  String get roles => 'ሚናዎች';

  @override
  String get users => 'ተጠቃሚዎች';

  @override
  String get user => 'ተጠቃሚ';

  @override
  String get banks => 'ባንኮች';

  @override
  String get employees => 'ሠራተኞች';

  @override
  String get reports => 'ሪፖርቶች';

  @override
  String get help => 'እርዳታ';

  @override
  String get noCompanies => 'ምንም ኩባንያ የለም';

  @override
  String get noCompaniesMessage =>
      'እስካሁን ምንም ኩባንያ አልፈጠርክም።\nየመጀመሪያውን ኩባንያዎን ለመፍጠር + ቁልፉን ይንኩ።';

  @override
  String get createCompany => 'ኩባንያ ፍጠር';

  @override
  String get editCompany => 'ኩባንያ አርትዖ';

  @override
  String get active => 'ንቁ';

  @override
  String get inactive => 'አልተሰራም';

  @override
  String get viewBranches => 'ቅርንጫፎች ይመልከቱ';

  @override
  String get editCompanyTooltip => 'ኩባንያ አርትዖ';

  @override
  String get deleteCompanyTooltip => 'ኩባንያ ሰርዝ';

  @override
  String get update => 'ያዘምኑ';

  @override
  String get create => 'ፍጠር';

  @override
  String get branches => 'ቅርንጫፎች';

  @override
  String get noBranches => 'ምንም ቅርንጫፍ የለም';

  @override
  String get noBranchesMessage =>
      'ይህ ኩባንያ እስካሁን ምንም ቅርንጫፍ የለውም።\nየመጀመሪያውን ቅርንጫፍ ለመፍጠር + ቁልፉን ይንኩ።';

  @override
  String get createBranch => 'ቅርንጫፍ ፍጠር';

  @override
  String get editBranch => 'ቅርንጫፍ አርትዖ';

  @override
  String get branchName => 'የቅርንጫፍ ስም';

  @override
  String get editBranchTooltip => 'ቅርንጫፍ አርትዖ';

  @override
  String get deleteBranchTooltip => 'ቅርንጫፍ ሰርዝ';

  @override
  String get management => 'አስተዳደር';

  @override
  String get addNew => 'አዲስ ጨምር';

  @override
  String get noRoles => 'ምንም ሚና የለም';

  @override
  String get noRolesMessage => 'እስካሁን ምንም ሚና የሎትም።';

  @override
  String get createRole => 'ሚና ፍጠር';

  @override
  String get editRole => 'ሚና አርትዖ';

  @override
  String get roleDetails => 'የሚና ዝርዝሮች';

  @override
  String get activeStatus => 'ንቁ ሁኔታ';

  @override
  String get enableOrDisableRole => 'ይህን ሚና ያብሩ ወይም ያጥፉ';

  @override
  String get permissions => 'ፈቃዶች';

  @override
  String selectedPermissions(int count) {
    return 'የተመረጠ: $count ፈቃዶች';
  }

  @override
  String get selectAtLeastOnePermission => 'እባክዎ ቢያንስ አንድ ፈቃድ ይምረጡ';

  @override
  String errorLoadingPermissions(String error) {
    return 'ፈቃዶችን በመጫን ላይ ስህተት: $error';
  }

  @override
  String get noPermissionsAvailable => 'ምንም ፈቃድ አይገኝም';

  @override
  String get updateRole => 'ሚና አዘምን';

  @override
  String get creating => 'በመፍጠር ላይ...';

  @override
  String get updating => 'በማዘመን ላይ...';

  @override
  String get nameRequired => 'ስም ያስፈልጋል';

  @override
  String get descriptionRequired => 'መግለጫ ያስፈልጋል';

  @override
  String get noPermissionsAssigned => 'ምንም ፈቃድ አልተመደበም';

  @override
  String get deleteRole => 'ሚና ሰርዝ';

  @override
  String confirmDeleteRole(String roleName) {
    return 'እርግጠኛ ነዎት $roleNameን መሰረዝ ይፈልጋሉ? ይህ ተግባር ሊመለስ አይችልም።';
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
  String get contactInformation => 'የግንኙነት መረጃ';

  @override
  String get phone => 'Phone';

  @override
  String get createdAt => 'በተፈጠረበት';

  @override
  String get updatedAt => 'በተዘመነበት';

  @override
  String get goBack => 'ተመለስ';

  @override
  String totalPermissions(int count) {
    return 'ጠቅላላ ፈቃዶች: $count';
  }

  @override
  String get profile => 'መገለጫ';

  @override
  String get noUserFound => 'ምንም ተጠቃሚ አልተገኘም';

  @override
  String get unableToLoadProfile => 'የተጠቃሚ መገለጫ መጫን አልተሳካም። እባክዎ እንደገና ይሞክሩ።';

  @override
  String get accountInformation => 'የመለያ መረጃ';

  @override
  String get settingsAndActions => 'ቅንብሮች እና ተግባሮች';

  @override
  String get dangerZone => 'አደጋ ዞን';

  @override
  String get confirmLogout => 'እርግጠኛ ነዎት መውጣት ይፈልጋሉ?';

  @override
  String get deleteAccount => 'መለያ ሰርዝ';

  @override
  String get deleteAccountWarning =>
      'ይህ ተግባር ሊመለስ አይችልም። ለማረጋገጥ እባክዎ የይለፍ ቃልዎን ያስገቡ።';

  @override
  String get chooseFromGallery => 'ከፎቶ ማግኛ ይምረጡ';

  @override
  String get takePhoto => 'ፎቶ ይቅረጹ';

  @override
  String errorPickingImage(String error) {
    return 'ምስል በመምረጥ ላይ ስህተት: $error';
  }

  @override
  String get createBrand => 'የምርት ስም ፍጠር';

  @override
  String get brand => 'የምርት ስም';

  @override
  String get editBrand => 'የምርት ስም አርትዖ';

  @override
  String get noBrands => 'ምንም የምርት ስም የለም';

  @override
  String get noBrandsMessage => 'እስካሁን ምንም የምርት ስም የሎትም።';

  @override
  String get createUnit => 'አሃድ ፍጠር';

  @override
  String get unit => 'አሃድ';

  @override
  String get editUnit => 'አሃድ አርትዖ';

  @override
  String get noUnits => 'ምንም አሃድ የለም';

  @override
  String get noUnitsMessage => 'እስካሁን ምንም አሃድ የሎትም።';

  @override
  String get createBank => 'ባንክ ፍጠር';

  @override
  String get bank => 'ባንክ';

  @override
  String get editBank => 'ባንክ አርትዖ';

  @override
  String get noBanks => 'ባንኮች የሉም';

  @override
  String get noBanksMessage => 'እስካሁን ምንም ባንኮች የሎትም።';

  @override
  String get bankName => 'የባንክ ስም';

  @override
  String get bankNameRequired => 'የባንክ ስም ያስፈልጋል';

  @override
  String get createCategory => 'ምድብ ፍጠር';

  @override
  String get noCategories => 'ምንም ምድቦች የሉም';

  @override
  String get noCategoriesMessage => 'እስካሁን ምንም ምድብ የሎትም።';

  @override
  String get createSubCategory => 'ንዑስ ምድብ ፍጠር';

  @override
  String get subCategory => 'ንዑስ ምድብ';

  @override
  String get editSubCategory => 'ንዑስ ምድብ አርትዖ';

  @override
  String get noSubCategories => 'ምንም ንዑስ ምድቦች የሉም';

  @override
  String get noSubCategoriesMessage => 'እስካሁን ምንም ንዑስ ምድብ የሎትም።';

  @override
  String get createModel => 'ሞዴል ፍጠር';

  @override
  String get model => 'ሞዴል';

  @override
  String get editModel => 'ሞዴል አርትዖ';

  @override
  String get noModels => 'ምንም ሞዴል የለም';

  @override
  String get noModelsMessage => 'እስካሁን ምንም ሞዴል የሎትም።';

  @override
  String get noCategoriesAvailable => 'ምንም ምድብ አይገኝም። እባክዎ በመጀመሪያ ምድብ ይፍጠሩ።';

  @override
  String errorLoadingCategories(String error) {
    return 'ምድቦችን በመጫን ላይ ስህተት: $error';
  }

  @override
  String get category => 'ምድብ';

  @override
  String get editCategory => 'ምድብ አርትዖ';

  @override
  String get categoryRequired => 'ምድብ ያስፈልጋል';

  @override
  String get expenseCategories => 'የወጪ ምድቦች';

  @override
  String get createExpenseCategory => 'የወጪ ምድብ ፍጠር';

  @override
  String get expenses => 'ወጪዎች';

  @override
  String get createExpense => 'ወጪ ይፍጠሩ';

  @override
  String get editExpense => 'ወጪ አርትዕ';

  @override
  String get expense => 'ወጪ';

  @override
  String get expenseRequired => 'የወጪ ስም አስፈላጊ ነው';

  @override
  String get expenseNameExists => 'የወጪ ስም አስቀድሞ አለ';

  @override
  String get noExpenses => 'ወጪ የለም';

  @override
  String get noExpensesMessage =>
      'እስካሁን ምንም ወጪ አልፈጠሩም። የመጀመሪያ ወጪን ለመፍጠር + ቁልፍን ያድርጉ።';

  @override
  String get reference => 'ማጣቀሻ';

  @override
  String get expenseDate => 'የወጪ ቀን';

  @override
  String get expenseAmount => 'መጠን';

  @override
  String errorLoadingRole(String error) {
    return 'ሚናን በመጫን ላይ ስህተት: $error';
  }

  @override
  String get deselectAll => 'ሁሉንም ምርጫ አጥፋ';

  @override
  String selectedCount(int selected, int total) {
    return '$selected / $total የተመረጠ';
  }

  @override
  String get accountStatus => 'የመለያ ሁኔታ';

  @override
  String get memberSince => 'አባል ከ';

  @override
  String get editProfile => 'መገለጫ ያርትዑ';

  @override
  String get changePassword => 'የይለፍ ቃል ቀይር';

  @override
  String get verified => 'የተረጋገጠ';

  @override
  String get notVerified => 'አልተረጋገጠም';

  @override
  String get batches => 'ቦታዎች';

  @override
  String get batch => 'ቦታ';

  @override
  String get createBatch => 'ቦታ ፍጠር';

  @override
  String get noBatches => 'ምንም ቦታዎች የሉም';

  @override
  String get noBatchesMessage => 'እስካሁን ምንም ቦታዎች የሎትም።';

  @override
  String get batchName => 'የጥምር ስም';

  @override
  String get batchNameRequired => 'የቦታ ስም ያስፈልጋል';

  @override
  String get stocks => 'ክምችቶች';

  @override
  String get stock => 'ክምችት';

  @override
  String get noStocks => 'ምንም ክምችቶች የሉም';

  @override
  String get noStocksMessage => 'እስካሁን ምንም ክምችቶች የሎትም።';

  @override
  String get updateStock => 'ክምችት አዘምን';

  @override
  String get lowStockThreshold => 'ዝቅተኛ ክምችት ደረጃ';

  @override
  String get location => 'አካባቢ';

  @override
  String get status => 'ሁኔታ';

  @override
  String get transactions => 'ግብይቶች';

  @override
  String get transaction => 'ግብይት';

  @override
  String get noTransactions => 'ምንም ግብይቶች የሉም';

  @override
  String get noTransactionsMessage => 'እስካሁን ምንም ግብይቶች የሎትም።';

  @override
  String get transfers => 'ማስተላለፎች';

  @override
  String get transfer => 'ዝውውር';

  @override
  String get noTransfers => 'ምንም ዝውውሮች የሉም';

  @override
  String get noTransfersMessage => 'እስካሁን ምንም ዝውውሮች የሎትም።';

  @override
  String get createTransfer => 'ዝውውር ፍጠር';

  @override
  String get destinationBranch => 'የመድረሻ ቅርንጫፍ';

  @override
  String get sourceBranch => 'ምንጭ ቅርንጫፍ';

  @override
  String get lastUpdated => 'የመጨረሻ ዝመና';

  @override
  String get notAvailable => 'የለም';

  @override
  String get unknown => 'ያልታወቀ';

  @override
  String get transferOut => 'ዝውውር ወጪ';

  @override
  String get transferIn => 'ዝውውር ገቢ';

  @override
  String get transferCreatedSuccessfully => 'ዝውውር በተሳካ ሁኔታ ተፈጥሯል';

  @override
  String get reverseTransaction => 'ግብይት ይቀይሩ';

  @override
  String get reverseTransactionMessage =>
      'እርግጠኛ ነዎት ይህን ግብይት መመለስ ይፈልጋሉ? ይህ የመመለሻ ማስገቢያ ይፈጥራል።';

  @override
  String get reversalNote => 'የመመለሻ ማስታወሻ';

  @override
  String get reversalNoteHint => 'ለዚህ መመለሻ ማስታወሻ ያስገቡ (አማራጭ)';

  @override
  String get reverse => 'ይቀይሩ';

  @override
  String get purchaseReverse => 'ግዥ መመለስ';

  @override
  String get saleReverse => 'ሽያጭ መመለስ';

  @override
  String get salesOrder => 'የሽያጭ ትዕዛዝ';

  @override
  String get salesOrders => 'የሽያጭ ትዕዛዞች';

  @override
  String get noSalesOrders => 'ምንም የሽያጭ ትዕዛዝ የለም';

  @override
  String get noSalesOrdersMessage => 'እስካሁን ምንም የሽያጭ ትዕዛዝ የሎትም።';

  @override
  String get createSalesOrder => 'የሽያጭ ትዕዛዝ ፍጠር';

  @override
  String get salesOrderDetails => 'የሽያጭ ትዕዛዝ ዝርዝሮች';

  @override
  String get fulfillmentBranch => 'የመፈጸሚያ ቅርንጫፍ';

  @override
  String get saleBranch => 'የሽያጭ ቅርንጫፍ';

  @override
  String get selectFulfillmentBranch => 'የመፈጸሚያ ቅርንጫፍ ይምረጡ';

  @override
  String get orderNumber => 'የትዕዛዝ ቁጥር';

  @override
  String get pending => 'በመጠባበቅ ላይ';

  @override
  String get approved => 'ፀድቋል';

  @override
  String get fulfilled => 'ተሟልቷል';

  @override
  String get cancelled => 'ተሰርዟል';

  @override
  String get approve => 'አፅድቅ';

  @override
  String get fulfill => 'ፈጽም';

  @override
  String get cancelOrder => 'ትዕዛዝ ሰርዝ';

  @override
  String get approveOrder => 'ትዕዛዝ አፅድቅ';

  @override
  String get fulfillOrder => 'ትዕዛዝ ፈጽም';

  @override
  String get confirmApproveOrder => 'እርግጠኛ ነዎት ይህን የሽያጭ ትዕዛዝ ማፅደቅ ይፈልጋሉ?';

  @override
  String get confirmFulfillOrder =>
      'እርግጠኛ ነዎት ይህን የሽያጭ ትዕዛዝ መፈጸም ይፈልጋሉ? ይህ ግብይት ይፈጥራል እና ክምችት ይቀንሳል።';

  @override
  String get confirmCancelOrder => 'እርግጠኛ ነዎት ይህን የሽያጭ ትዕዛዝ መሰረዝ ይፈልጋሉ?';

  @override
  String get orderApprovedSuccessfully => 'የሽያጭ ትዕዛዝ በተሳካ ሁኔታ ፀድቋል';

  @override
  String get orderFulfilledSuccessfully => 'የሽያጭ ትዕዛዝ በተሳካ ሁኔታ ተሟልቷል';

  @override
  String get orderCancelledSuccessfully => 'የሽያጭ ትዕዛዝ በተሳካ ሁኔታ ተሰርዟል';

  @override
  String get salesOrderCreatedSuccessfully => 'የሽያጭ ትዕዛዝ በተሳካ ሁኔታ ተፈጥሯል';

  @override
  String get subtotal => 'ንዑስ ድምር';

  @override
  String get totalTax => 'ጠቅላላ ግብር';

  @override
  String get totalAmount => 'ጠቅላላ ድምር';

  @override
  String get paidAmount => 'የተከፈለ መጠን';

  @override
  String get remainingAmount => 'የቀረ ድምር';

  @override
  String get attachments => 'ተጣባባይዎች';

  @override
  String get deliveryProof => 'የመላኪያ ማረጋገጫ';

  @override
  String get walkIn => 'በቀጥታ የመጣ';

  @override
  String get cancelOrderConfirmation =>
      'Are you sure you want to cancel this order? This action cannot be undone.';

  @override
  String get tax => 'Tax';

  @override
  String get total => 'Total';

  @override
  String get approvedAt => 'የፀደቀበት ቀን';

  @override
  String get approvedBy => 'ያፀደቀ';

  @override
  String get createdBy => 'የፈጠረ';

  @override
  String get updatedBy => 'Updated By';

  @override
  String get add => 'ጨምር';

  @override
  String get accept => 'ተቀበል';

  @override
  String get reject => 'ውድቅ አድርግ';

  @override
  String get payment => 'መክፈያ';

  @override
  String get paymentDetails => 'የክፍያ ዝርዝር';

  @override
  String get notes => 'ማስታወሻዎች';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get currentBranch => 'ወቅታዊ ቅርንጫፍ';

  @override
  String get selectBranch => 'ቅርንጫፍ ይምረጡ';

  @override
  String get switchBranch => 'ቅርንጫፍ ይቀይሩ';

  @override
  String get core => 'መሰረታዊ';

  @override
  String get inventory => 'ክምችት';

  @override
  String get operations => 'ስራዎች';

  @override
  String get administration => 'አስተዳደር';

  @override
  String get paid => 'የተከፈለ';

  @override
  String get remaining => 'ቀሪ';

  @override
  String get optional => 'አማራጭ';

  @override
  String get paymentMethods => 'የክፍያ ዘዴዎች';

  @override
  String get noPaymentMethodsAdded => 'የክፍያ ዘዴዎች አልተጨመሩም';

  @override
  String get attachment => 'ተያያዥ';

  @override
  String get addAttachment => 'አባሪ ጨምር';

  @override
  String get change => 'ቀይር';

  @override
  String get remove => 'አስወግድ';

  @override
  String get fulfillOrderConfirmation =>
      'ይህ ግብይት ይፈጥራል እና ከመፈጸሚያ ቅርንጫፍ ክምችት ይቀንሳል።';

  @override
  String get noDescription => 'መግለጫ የለም';

  @override
  String get addBalance => 'ቀሪ ሂሳብ ጨምር';

  @override
  String get refund => 'ተመላሽ';

  @override
  String get transactionId => 'የግብይት መታወቂያ';

  @override
  String get transactionIdRequired => 'የግብይት መታወቂያ ያስፈልጋል';

  @override
  String get invalidTransactionId => 'ልክ ያልሆነ የግብይት መታወቂያ';

  @override
  String get addBalanceSuccess => 'ቀሪ ሂሳብ በተሳካ ሁኔታ ተጨምሯል';

  @override
  String get refundSuccess => 'ተመላሽ በተሳካ ሁኔታ ተከናውኗል';

  @override
  String get addPaymentMethod => 'የክፍያ ዘዴ ጨምር';

  @override
  String get addAtLeastOnePaymentMethod => 'እባክዎ ቢያንስ አንድ የክፍያ ዘዴ ያክሉ';

  @override
  String get receipt => 'ደረሰኝ';

  @override
  String get totalSales => 'ጠቅላላ ሽያጭ';

  @override
  String get totalSalesReturn => 'ጠቅላላ የሽያጭ ተመላሽ';

  @override
  String get totalPurchase => 'ጠቅላላ ግዢ';

  @override
  String get totalPurchaseReturn => 'ጠቅላላ የግዢ ተመላሽ';

  @override
  String get viewAll => 'ሁሉንም ይመልከቱ';

  @override
  String get profit => 'ትርፍ';

  @override
  String get invoiceDue => 'ያልተከፈለ ደረሰኝ';

  @override
  String get totalExpenses => 'ጠቅላላ ወጪዎች';

  @override
  String get totalPaymentReturns => 'ጠቅላላ የክፍያ ተመላሾች';

  @override
  String get salesAndPurchase => 'ሽያጭ እና ግዢ';

  @override
  String get sales => 'ሽያጭ';

  @override
  String get purchase => 'ግዢ';

  @override
  String get noData => 'ምንም ውሂብ የለም';

  @override
  String get overallInformation => 'አጠቃላይ መረጃ';

  @override
  String get orders => 'ትዕዛዞች';

  @override
  String get customersOverview => 'የደንበኞች አጠቃላይ እይታ';

  @override
  String get firstTime => 'አዲስ';

  @override
  String get returning => 'ተመላሽ';

  @override
  String get salesStatistics => 'የሽያጭ ስታቲስቲክስ';

  @override
  String get revenue => 'ገቢ';

  @override
  String get topSellingProducts => 'ከፍተኛ የሚሸጡ ምርቶች';

  @override
  String get lowStockProducts => 'ዝቅተኛ ክምችት ምርቶች';

  @override
  String get inStock => 'በክምችት';

  @override
  String get topCustomers => 'ከፍተኛ ደንበኞች';

  @override
  String get salesReport => 'የሽያጭ ሪፖርት';

  @override
  String get annualReport => 'ዓመታዊ ሪፖርት';

  @override
  String get bestSellerReport => 'ከፍተኛ ሽያጭ ሪፖርት';

  @override
  String get customerReport => 'የደንበኛ ሪፖርት';

  @override
  String get expenseReport => 'የወጪ ሪፖርት';

  @override
  String get profitLossReport => 'የትርፍ እና ኪሳራ ሪፖርት';

  @override
  String get purchaseReport => 'የግዢ ሪፖርት';

  @override
  String switchedToBranch(String branchName) {
    return 'ወደ $branchName ተቀይሯል';
  }

  @override
  String get failedToSwitchBranch => 'ቅርንጫፍ መቀየር አልተሳካም';

  @override
  String get yourTransactions => 'የእርስዎ ግብይቶች';

  @override
  String get allCustomers => 'ሁሉም ደንበኞች';

  @override
  String get yourProduct => 'የእርስዎ ምርት';

  @override
  String get isRunningLowAlreadyBelow => 'ዝቅተኛ እየሆነ ነው፣ አስቀድሞ ከ';

  @override
  String get pcs => 'ቁርጥራጮች';

  @override
  String get addStock => 'ክምችት ጨምር';

  @override
  String get noAnnualItems => 'ዓመታዊ ንጥሎች የሉም';

  @override
  String get totalCost => 'ጠቅላላ ወጪ';

  @override
  String get vat => 'VAT';

  @override
  String get grossProfit => 'ጠቅላላ ትርፍ';

  @override
  String get netProfit => 'ንጹህ ትርፍ';

  @override
  String get noProfitLossItems => 'የትርፍ-ኪሳራ ንጥሎች የሉም';

  @override
  String get salesAndProfitTrend => 'የሽያጭ እና ትርፍ አዝማሚያ';

  @override
  String get last10Days => 'የመጨረሻዎቹ 10 ቀናት';

  @override
  String get noBestSellers => 'ከፍተኛ ሽያጭ የለም';

  @override
  String get averageExpense => 'አማካይ ወጪ';

  @override
  String get largestExpense => 'ትልቁ ወጪ';

  @override
  String get totalToPayCustomers => 'ጠቅላላ ለመክፈል ደንበኞች';

  @override
  String get totalCustomersOweUs => 'ጠቅላላ ደንበኞች ያሳለፉን';

  @override
  String get netBalance => 'ንጹህ ቀሪ ሂሳብ';

  @override
  String get noCustomers => 'ምንም ደንበኞች የሉም';

  @override
  String get totalPaid => 'ጠቅላላ የተከፈለ';

  @override
  String get totalUnpaid => 'ጠቅላላ ያልተከፈለ';

  @override
  String get overdue => 'የተዘገየ';

  @override
  String get noPurchaseItems => 'የግዢ ንጥሎች የሉም';

  @override
  String get noSalesItems => 'የሽያጭ ንጥሎች የሉም';

  @override
  String get noPaymentData => 'የመክፈያ ውሂብ የለም';

  @override
  String get addPayment => 'መክፈያ ጨምር';

  @override
  String get noPaymentMethods => 'የመክፈያ ዘዴዎች የሉም';

  @override
  String get assignRolesToBranches => 'ሚናዎችን ለቅርንጫፎች መድብ';

  @override
  String get autoPrint => 'ራስ-ሰር ማተም';

  @override
  String get automaticallyPrintReceipts => 'ከግብይቶች በኋላ ደረሰኞችን በራስ-ሰር ያትሙ';

  @override
  String get uploadLogo => 'ሎጎ ይጭኑ';

  @override
  String get noCompanyFound => 'ኩባንያ አልተገኘም';

  @override
  String get qty => 'ብዛት';

  @override
  String get ref => 'ማጣቀሻ';

  @override
  String get noAnnualItemsFound => 'ለተመረጠው ቀን ዓመታዊ ንጥሎች አልተገኙም።';

  @override
  String get noExpensesFound => 'ለተመረጠው የቀን ክልል ወጪዎች አልተገኙም።';

  @override
  String get noProfitLossItemsFound => 'ለተመረጠው የቀን ክልል የትርፍ-ኪሳራ ንጥሎች አልተገኙም።';

  @override
  String get noBestSellersFound => 'ለተመረጠው የቀን ክልል ከፍተኛ ሽያጭ አልተገኙም።';

  @override
  String get noCustomerDataFound => 'የደንበኛ ውሂብ አልተገኘም።';

  @override
  String get noSalesItemsFound => 'ለተመረጠው የቀን ክልል የሽያጭ ንጥሎች አልተገኙም።';

  @override
  String get noPurchaseItemsFound => 'ለተመረጠው የቀን ክልል የግዢ ንጥሎች አልተገኙም።';

  @override
  String get salesAndProfitTrendLast10Days =>
      'የሽያጭ እና ትርፍ አዝማሚያ (የመጨረሻዎቹ 10 ቀናት)';

  @override
  String get paymentId => 'የመክፈያ መታወቂያ';

  @override
  String get companyInformation => 'የኩባንያ መረጃ';

  @override
  String get enabled => 'አንቃለሁ';

  @override
  String get disabled => 'አግድያለሁ';

  @override
  String get stockInformation => 'የክምችት መረጃ';

  @override
  String get metadata => 'የመረጃ መረጃ';

  @override
  String get itemDetails => 'የንጥል ዝርዝሮች';

  @override
  String get updateQuantity => 'ብዛት ያዘምኑ';

  @override
  String get addItems => 'ንጥሎች ጨምር';

  @override
  String get noItems => 'ምንም ንጥሎች የሉም';

  @override
  String get overview => 'አጠቃላይ እይታ';

  @override
  String get fulfillSalesOrder => 'የሽያጭ ትዕዛዝ ሙሉ ማድረግ';

  @override
  String get editPaymentMethod => 'የመክፈያ ዘዴ ያርትዑ';

  @override
  String get deletePaymentMethod => 'የመክፈያ ዘዴ ሰርዝ';

  @override
  String get updatePaymentMethod => 'Update Payment Method';

  @override
  String get confirmDeletePaymentMethod =>
      'ይህንን የመክፈያ ዘዴ መሰረዝ እንደፈለጉ እርግጠኛ ነዎት? ይህ ተግባር ሊመለስ አይችልም።';

  @override
  String get updateCompany => 'ኩባንያ አዘምን';

  @override
  String get basicInformation => 'መሰረታዊ መረጃ';

  @override
  String get locationInformation => 'የአካባቢ መረጃ';

  @override
  String get appSettings => 'የመተግበሪያ ቅንብሮች';

  @override
  String get transactionDetails => 'የግብይት ዝርዝሮች';

  @override
  String get personalInformation => 'የግላዊ መረጃ';

  @override
  String get noMovements => 'እንቅስቃሴዎች የሉም';

  @override
  String get noStockMovementsRecorded => 'እስካሁን የክምችት እንቅስቃሴዎች አልተመዘገቡም';

  @override
  String get stockDetails => 'የክምችት ዝርዝሮች';

  @override
  String get noTransactionsYet => 'እስካሁን ግብይቶች የሉም።';

  @override
  String get acceptTransfer => 'ማስተላለፍ ተቀበል';

  @override
  String get confirmAcceptTransfer => 'ይህንን ማስተላለፍ መቀበል እንደፈለጉ እርግጠኛ ነዎት?';

  @override
  String get rejectTransfer => 'ማስተላለፍ ውድቅ አድርግ';

  @override
  String get confirmRejectTransfer => 'ይህንን ማስተላለፍ ማሰረዝ እንደፈለጉ እርግጠኛ ነዎት?';

  @override
  String get transferDetails => 'የማስተላለፍ ዝርዝሮች';

  @override
  String get noItemsInCart => 'በጋሪ ውስጥ ንጥሎች የሉም';

  @override
  String get tapItemsIconToAdd => 'ንጥሎችን ወደ ጋሪዎ ለመጨመር ከላይ ያለውን የንጥሎች አዶ ይንኩ';

  @override
  String get itemsInCart => 'በጋሪ ውስጥ ንጥሎች';

  @override
  String get newTransfer => 'አዲስ ማስተላለፍ';

  @override
  String get noTransfersFound => 'ማስተላለፎች አልተገኙም';

  @override
  String get youDontHaveAnyItemsYet => 'እስካሁን ምንም ንጥሎች የሎትም።';

  @override
  String get cancelSalesOrder => 'የሽያጭ ትዕዛዝ ይቅር';

  @override
  String get confirmCancelSalesOrder => 'ይህንን የሽያጭ ትዕዛዝ ማስረዝ እንደፈለጉ እርግጠኛ ነዎት?';

  @override
  String get newSalesOrder => 'አዲስ የሽያጭ ትዕዛዝ';

  @override
  String get newTransaction => 'አዲስ ግብይት';

  @override
  String get additionalInformation => 'ተጨማሪ መረጃ';

  @override
  String get recordPaymentWithApproval => 'ከማረጋገጫ ጋር መክፈያ ይመዝግቡ';

  @override
  String get id => 'መታወቂያ';

  @override
  String get none => 'ምንም';

  @override
  String get bakery => 'ዳቦ ቤት';

  @override
  String get pharmacy => 'ፋርማሲ';

  @override
  String get supermarket => 'ሱፐርማርኬት';

  @override
  String get retail => 'ገበያ';

  @override
  String get cafe => 'ካፌ';

  @override
  String get allCategories => 'ሁሉም ምድቦች';

  @override
  String get allSuppliers => 'ሁሉም አቅራቢዎች';

  @override
  String get allStatus => 'ሁሉም ሁኔታ';

  @override
  String get completed => 'ተጠናቋል';

  @override
  String get reversed => 'ተመለሰ';

  @override
  String get paymentMethod => 'የመክፈያ ዘዴ';

  @override
  String get bankRequired => 'ባንክ *';

  @override
  String get admin => 'አስተዳዳሪ';

  @override
  String get manager => 'አስተዳዳሪ';

  @override
  String get cashier => 'ገንዘብ ተቀባይ';

  @override
  String get storekeeper => 'መጋዘን ጠባቂ';

  @override
  String get supervisor => 'አቀናባሪ';

  @override
  String get standard => 'መደበኛ';

  @override
  String get userType => 'የተጠቃሚ አይነት';

  @override
  String get userId => 'የተጠቃሚ መታወቂያ';

  @override
  String get phone1 => 'ስልክ 1';

  @override
  String get phone2 => 'ስልክ 2';

  @override
  String get city => 'ከተማ';

  @override
  String get wereda => 'ወረዳ';

  @override
  String get youDontHaveAnySuppliersYet => 'እስካሁን ምንም አቅራቢዎች የሎትም።';

  @override
  String get youDontHaveAnyExpenseCategoriesYet => 'እስካሁን ምንም የወጪ ምድቦች የሎትም።';

  @override
  String get youDontHaveAnyCategoriesYet => 'እስካሁን ምንም ምድቦች የሎትም።';

  @override
  String get youDontHaveAnyCustomersYet => 'እስካሁን ምንም ደንበኞች የሎትም።';

  @override
  String errorPickingImages(String error) {
    return 'ምስሎችን ማምረጥ ስህተት: $error';
  }

  @override
  String confirmDeleteItem(String itemName) {
    return 'እርግጠኛ ነዎት $itemNameን መሰረዝ ይፈልጋሉ? ይህ ተግባር ሊመለስ አይችልም።';
  }

  @override
  String get fulfillmentDate => 'የማሟላት ቀን';

  @override
  String get notSet => 'አልተቀመጠም';

  @override
  String get party => 'አጋር';

  @override
  String get unitPrice => 'የአሃድ ዋጋ';

  @override
  String get costPrice => 'የወጪ ዋጋ';

  @override
  String get taxRate => 'የግብር መጠን';

  @override
  String get taxableAmt => 'የግብር የሚገባ መጠን';

  @override
  String get taxAmt => 'የግብር መጠን';

  @override
  String get itemCode => 'ኮድ';

  @override
  String itemCodeLabel(String code) {
    return 'ኮድ: $code';
  }

  @override
  String get noAttachments => 'መያዣዎች የሉም';

  @override
  String attachmentNumber(int number) {
    return 'መያዣ $number';
  }

  @override
  String transactionLabel(String number) {
    return 'ግብይት: $number';
  }

  @override
  String get stockMovements => 'የክምችት እንቅስቃሴዎች';

  @override
  String get color => 'ቀለም';

  @override
  String get size => 'መጠን';

  @override
  String get material => 'ቁሳቁስ';

  @override
  String get weight => 'ክብደት';

  @override
  String get unknownItem => 'ያልታወቀ ንጥል';

  @override
  String quantityLabel(String quantity) {
    return 'ብዛት: $quantity';
  }

  @override
  String itemNumber(String id) {
    return 'ንጥል #$id';
  }

  @override
  String inboundLabel(String quantity) {
    return 'ገቢ: +$quantity';
  }

  @override
  String outboundLabel(String quantity) {
    return 'ወጪ: -$quantity';
  }

  @override
  String fromLabel(String source) {
    return 'ከ: $source';
  }

  @override
  String toLabel(String destination) {
    return 'ወደ: $destination';
  }

  @override
  String movementCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count እንቅስቃሴዎች',
      one: '1 እንቅስቃሴ',
    );
    return '$_temp0';
  }

  @override
  String moreMovements(int count) {
    return '+ $count ተጨማሪ እንቅስቃሴዎች';
  }

  @override
  String notesLabel(String notes) {
    return 'ማስታወሻዎች: $notes';
  }

  @override
  String get methods => 'ዘዴዎች';

  @override
  String get selectTransactionType => 'የግብይት አይነት ይምረጡ';

  @override
  String get addAttachments => 'ተጣባባይዎች ጨምር';

  @override
  String get clearAll => 'ሁሉንም አጽዳ';

  @override
  String get applyFilters => 'መርጃዎችን ተግብር';

  @override
  String get nameAsc => 'ስም (A-Z)';

  @override
  String get nameDesc => 'ስም (Z-A)';

  @override
  String get createdDesc => 'የተፈጠረ ቀን (አዲስ)';

  @override
  String get createdAsc => 'የተፈጠረ ቀን (አሮጌ)';

  @override
  String get unitPriceAsc => 'የአሃድ ዋጋ (ከዝቅ ወደ ከፍ)';

  @override
  String get unitPriceDesc => 'የአሃድ ዋጋ (ከከፍ ወደ ዝቅ)';

  @override
  String get costPriceAsc => 'የወጪ ዋጋ (ከዝቅ ወደ ከፍ)';

  @override
  String get costPriceDesc => 'የወጪ ዋጋ (ከከፍ ወደ ዝቅ)';

  @override
  String get allSubCategories => 'ሁሉም ንዑስ ምድቦች';

  @override
  String get allBrands => 'ሁሉም የምርት ስሞች';

  @override
  String get allUnits => 'ሁሉም አሃዶች';

  @override
  String get allModels => 'ሁሉም ሞዴሎች';

  @override
  String get isTaxable => 'የግብር የሚገባ ነው';

  @override
  String get isActive => 'ንቁ ነው';

  @override
  String get taxable => 'የግብር የሚገባ';

  @override
  String get nonTaxable => 'የግብር የማይገባ';

  @override
  String get pleaseEnterValidAmount => 'እባክዎ ትክክለኛ መጠን ያስገቡ';

  @override
  String get pleaseAddAtLeastOnePaymentMethod => 'እባክዎ ቢያንስ አንድ የክፍያ ዘዴ ያክሉ';

  @override
  String get pleaseSelectBankForBankTransfer =>
      'እባክዎ ለባንክ ማስተላለፍ የክፍያ ዘዴ ባንክ ይምረጡ';

  @override
  String referenceNumberRequired(String method) {
    return 'ለ $method የማጣቀሻ ቁጥር ያስፈልጋል';
  }

  @override
  String paymentMethodsTotalMustEqual(String total, String amount) {
    return 'የክፍያ ዘዴዎች ጠቅላላ ($total) ከወጪ መጠን ($amount) ጋር እኩል መሆን አለበት';
  }

  @override
  String get failedToLoadBanks => 'ባንኮችን ማስጫን አልተሳካም';

  @override
  String get selectBank => 'ባንክ ይምረጡ';

  @override
  String errorLoadingItems(String error) {
    return 'ንጥሎችን ማምጣት ስህተት: $error';
  }

  @override
  String get expenseDataNotFound => 'የወጪ ውሂብ አልተገኘም';

  @override
  String get showExpensesFromAllCategories => 'ከሁሉም ምድቦች ወጪዎችን አሳይ';

  @override
  String get noBranchesAvailable => 'ምንም ቅርንጫፍ አይገኝም';

  @override
  String get errorLoadingRoles => 'ሚናዎችን ማስጫን ስህተት';

  @override
  String get myCompany => 'የእኔ ኩባንያ';

  @override
  String get viewAndManageCompanyDetails => 'የኩባንያ ዝርዝሮችን ይመልከቱ እና ያቀናብሩ';

  @override
  String refLabel(String ref) {
    return 'ማጣቀሻ: $ref';
  }

  @override
  String get approveSalesOrder => 'የሽያጭ ትዕዛዝ ይፈቀድ';

  @override
  String get notesOptional => 'ማስታወሻዎች (አማራጭ)';

  @override
  String get paymentNotesOptional => 'የክፍያ ማስታወሻዎች (አማራጭ)';

  @override
  String get orderTotal => 'የትዕዛዝ ጠቅላላ';

  @override
  String get advancedFilters => 'የላቀ ማጣሪያዎች';

  @override
  String get productInformation => 'የምርት መረጃ';

  @override
  String get priceRanges => 'የዋጋ ክልሎች';

  @override
  String get taxStatus => 'የግብር ሁኔታ';

  @override
  String get min => 'ዝቅተኛ';

  @override
  String get max => 'ከፍተኛ';

  @override
  String get expenseName => 'የወጪ ስም';

  @override
  String get expenseNameRequired => 'የወጪ ስም ያስፈልጋል';

  @override
  String get amountRequired => 'መጠን ያስፈልጋል';

  @override
  String get selectCategory => 'ምድብ ይምረጡ';

  @override
  String get categorySelected => 'ምድብ ተመርጧል';

  @override
  String get thisWillCreateTransactionAndUpdateInventory =>
      'ይህ ግብይት ይፈጥራል እና አክሲዮን ያዘምናል።';

  @override
  String get addAttachmentOptional => 'መያዣ ያክሉ (አማራጭ)';

  @override
  String get firstNameRequired => 'የመጀመሪያ ስም ያስፈልጋል';

  @override
  String get lastNameRequired => 'የአባት ስም ያስፈልጋል';

  @override
  String get enterValidEmail => 'ትክክለኛ ኢሜይል ያስገቡ';

  @override
  String get assignRolesToUser => 'ለተጠቃሚ ሚናዎች ይመድቡ';

  @override
  String get pleaseSelectAtLeastOneBranch => 'እባክዎ ቢያንስ አንድ ቅርንጫፍ ይምረጡ';

  @override
  String get pleaseSelectBank => 'እባክዎ ባንክ ይምረጡ';

  @override
  String get selectBankRequired => 'ባንክ ይምረጡ *';

  @override
  String get pleaseSelectFulfillmentBranch => 'እባክዎ የመሙላት ቅርንጫፍ ይምረጡ';

  @override
  String get changing => 'በመቀየር ላይ...';

  @override
  String get filterBestSellerReport => 'የበለጠ የሚሸጡ ሪፖርት ማጣሪያ';

  @override
  String paymentMethodsCount(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    return 'የክፍያ ዘዴዎች ($countString)';
  }

  @override
  String get removePaymentMethod => 'የክፍያ ዘዴ አስወግድ';

  @override
  String get selectBankPlaceholder => 'ባንክ ይምረጡ';

  @override
  String get sortLabel => 'ማዘዣ:';

  @override
  String get nameAZ => 'ስም (አ-ዘ)';

  @override
  String get nameZA => 'ስም (ዘ-አ)';

  @override
  String get createdDateNewest => 'የተፈጠረ ቀን (አዲስ)';

  @override
  String get createdDateOldest => 'የተፈጠረ ቀን (ዕድሜ ያለው)';

  @override
  String get attributes => 'ባህሪያት';

  @override
  String get referenceNumberLabel => 'የማጣቀሻ ቁጥር';

  @override
  String get searchByNamePhoneOrAccountCode => 'በስም፣ ስልክ ወይም የመለያ ኮድ ይፈልጉ...';

  @override
  String get noSuppliersMessage => 'You don\'t have any suppliers yet.';

  @override
  String get selectFulfillmentDate => 'Select Fulfillment Date';

  @override
  String get searchExpenseCategories => 'የወጪ ምድቦችን ይፈልጉ...';

  @override
  String get failedToLoadExpenseCategories => 'የወጪ ምድቦችን ማስጫን አልተሳካም';

  @override
  String get noExpenseCategoriesMatchSearch => 'ምንም የወጪ ምድቦች ከፍለጋዎ ጋር አይዛመዱም';

  @override
  String userLabel(String userName) {
    return 'ተጠቃሚ: $userName';
  }

  @override
  String get selectBranchesAndAssignRoles => 'ቅርንጫፎችን ይምረጡ እና ሚናዎችን ይመድቡ';

  @override
  String get searchCategories => 'ምድቦችን ይፈልጉ...';

  @override
  String get noCategoriesFound => 'ምንም ምድብ አልተገኘም';

  @override
  String get noCategoriesMatchSearch => 'ምንም ምድቦች ከፍለጋዎ ጋር አይዛመዱም';

  @override
  String get selectCategoryFirst => 'በመጀመሪያ ምድብ ይምረጡ';

  @override
  String get noSubCategoriesAvailable => 'ምንም ንዑስ ምድቦች አይገኙም';

  @override
  String get noBrandsAvailable => 'ምንም የምርት ስም አይገኙም';

  @override
  String get noUnitsAvailable => 'ምንም አሃዶች አይገኙም';

  @override
  String get noModelsAvailable => 'ምንም ሞዴሎች አይገኙም';

  @override
  String get searchByBatchName => 'በቦታ ስም ይፈልጉ...';

  @override
  String batchNumberLabel(String batchNumber) {
    return 'ቦታ #: $batchNumber';
  }

  @override
  String itemNameLabel(String itemName) {
    return 'ንጥል: $itemName';
  }

  @override
  String get noAdditionalDetailsAvailable => 'ምንም ተጨማሪ ዝርዝሮች አይገኙም';

  @override
  String get filterSalesReport => 'የሽያጭ ሪፖርት ይፈልጉ';

  @override
  String get filterPurchaseReport => 'የግዢ ሪፖርት ይፈልጉ';

  @override
  String get filterExpenseReport => 'የወጪ ሪፖርት ይፈልጉ';

  @override
  String get placeOrder => 'ትዕዛዝ ይስጡ';

  @override
  String get noBanksAvailable => 'ምንም ባንኮች አይገኙም';

  @override
  String get receiptAttached => 'ደረሰኝ ተያይዟል';

  @override
  String get addReceipt => 'ደረሰኝ ጨምር';

  @override
  String get tapToUpload => 'ለመጫን ይንኩ';

  @override
  String get pleaseSelectItem => 'Please select an item';

  @override
  String get selectItem => 'ንጥል ይምረጡ';

  @override
  String get configuration => 'ቅንብር';

  @override
  String get noSuppliers => 'ምንም አቅራቢዎች የሉም';

  @override
  String get noExpenseCategories => 'ምንም የወጪ ምድቦች የሉም';

  @override
  String get createSupplier => 'አቅራቢ ፍጠር';

  @override
  String get createCustomer => 'ደንበኛ ፍጠር';

  @override
  String get createItem => 'ንጥል ፍጠር';

  @override
  String get updateItem => 'ንጥል አዘምን';

  @override
  String get deleteItem => 'ንጥል ሰርዝ';

  @override
  String get selectItems => 'ንጥሎች ይምረጡ';

  @override
  String get expenseDetails => 'የወጪ ዝርዝሮች';

  @override
  String get batchDetails => 'የጥምር ዝርዝሮች';

  @override
  String get identification => 'ማንነት';

  @override
  String get productDetails => 'የምርት ዝርዝሮች';

  @override
  String get relationships => 'ዝምድናዎች';

  @override
  String get pricing => 'የዋጋ አሰጣጥ';

  @override
  String get taxAndStatus => 'ግብር እና ሁኔታ';

  @override
  String get datesOptional => 'ቀኖች (አማራጭ)';

  @override
  String get actions => 'ድርጊቶች';

  @override
  String get editExpenseCategory => 'የወጪ ምድብ አርም';

  @override
  String get tradeName => 'የንግድ ስም';

  @override
  String attachmentIndex(int index) {
    return 'ተጣባባይ $index';
  }

  @override
  String get selectCustomerOptional => 'ደንበኛ ይምረጡ (አማራጭ)';

  @override
  String get selectPaymentMethod => 'የክፍያ ዘዴ ይምረጡ';

  @override
  String get attachReceiptOptional => 'ደረሰኝ ያያይዙ (አማራጭ)';

  @override
  String failedToLoadBanksWithError(String error) {
    return 'ባንኮችን ማምጣት አልተሳካም: $error';
  }

  @override
  String get searchByNameCodeSku => 'በስም፣ ኮድ፣ SKU ፍለጋ...';

  @override
  String get selectBusinessType => 'የንግድ አይነት ይምረጡ';

  @override
  String get selectCalendarType => 'የቀን መቁጠሪያ አይነት ይምረጡ';

  @override
  String get unitPriceLowToHigh => 'የአሃድ ዋጋ (ከዝቅ ወደ ከፍ)';

  @override
  String get unitPriceHighToLow => 'የአሃድ ዋጋ (ከከፍ ወደ ዝቅ)';

  @override
  String get costPriceLowToHigh => 'የወጪ ዋጋ (ከዝቅ ወደ ከፍ)';

  @override
  String get costPriceHighToLow => 'የወጪ ዋጋ (ከከፍ ወደ ዝቅ)';

  @override
  String get selectSubCategory => 'ንዑስ ምድብ ይምረጡ';

  @override
  String get selectBrand => 'የምርት ስም ይምረጡ';

  @override
  String get selectUnit => 'አሃድ ይምረጡ';

  @override
  String get selectModel => 'ሞዴል ይምረጡ';

  @override
  String get enterLimit => 'ገደብ ያስገቡ (ለምሳሌ: 1000)';

  @override
  String get selectStatus => 'ሁኔታ ይምረጡ';

  @override
  String get searchByName => 'በስም ፍለጋ...';

  @override
  String get date => 'ቀን';

  @override
  String get created => 'የተፈጠረ';

  @override
  String get updated => 'የተዘመነ';

  @override
  String get needStock => 'ክምችት ያስፈልጋል';

  @override
  String get availableQuantity => 'የሚገኝ ብዛት';

  @override
  String get batchNumber => 'የጥምር ቁጥር';

  @override
  String get itemId => 'የንጥል ID';

  @override
  String get itemName => 'የንጥል ስም';

  @override
  String get supplierBatchNumber => 'የአቅራቢ ጥምር ቁጥር';

  @override
  String get sku => 'SKU';

  @override
  String get barcode => 'ባርኮድ';

  @override
  String get expirationDate => 'የመጨረሻ ቀን';

  @override
  String get manufacturingDate => 'የምርት ቀን';

  @override
  String get selectSupplier => 'አቅራቢ ይምረጡ';

  @override
  String get selectUserType => 'የተጠቃሚ አይነት ይምረጡ';

  @override
  String get limit => 'ገደብ';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get currentPasswordRequired => 'Current password is required';

  @override
  String get referenceNumber => 'Reference Number';

  @override
  String get noCustomersMessage => 'You don\'t have any customers yet.';

  @override
  String get noItemsMessage => 'እስካሁን ምንም ንጥሎች የሉዎትም።';

  @override
  String get noSubCategoriesInCategoryMessage =>
      'ይህ ምድብ እስካሁን ምንም ንዑስ ምድቦች የሉትም።';

  @override
  String get noExpenseCategoriesMessage =>
      'You don\'t have any expense categories yet.';

  @override
  String get roleAssignmentsByBranch => 'በቅርንጫፍ የሚመደቡ ሚናዎች';

  @override
  String errorLoadingRoleAssignments(String error) {
    return 'የሚና መድቦችን ለመጫን ስህተት: $error';
  }

  @override
  String get noRoleAssignmentsFound => 'ምንም የሚና መድቦች አልተገኙም';

  @override
  String get noRoleAssignmentsMessage =>
      'ይህ ተጠቃሚ እስካሁን በማንኛውም ቅርንጫፍ ምንም የሚና መድቦች የለውም።';

  @override
  String get noRolesAvailable => 'ምንም ሚናዎች አይገኙም';

  @override
  String get thisCategoryHasNoSubCategories =>
      'This category doesn\'t have any sub-categories yet.';

  @override
  String get amount => 'መጠን';

  @override
  String get searchCustomers => 'Search customers...';

  @override
  String get quantity => 'ብዛት';

  @override
  String get payments => 'ክፍያዎች';

  @override
  String get noPaymentsRecorded => 'ክፍያ አልተመዘገበም';

  @override
  String get confirmReverseTransaction => 'ይህን ግብይት ለመመለስ እርግጠኛ ነዎት?';

  @override
  String get thisActionCannotBeUndone => 'ይህ ተግባር ሊመለስ አይችልም።';

  @override
  String get nA => 'N/A';

  @override
  String get expenseCategory => 'expense category';

  @override
  String get pleaseEnterComplete6DigitCode => 'እባክዎ ሙሉ 6-አሃዝ ኮድ ያስገቡ';

  @override
  String get noResetTokenFound => 'የመታወስ ቶከን አልተገኘም';

  @override
  String get loginSuccessful => 'መግቢያ በተሳካ ሁኔታ! እንኳን ደህና መጡ።';

  @override
  String get creatingAccount => 'መለያ በመፍጠር ላይ...';

  @override
  String get accountCreatedSuccessfully =>
      'መለያ በተሳካ ሁኔታ ተፈጥሯል! እባክዎ መለያዎን ያረጋግጡ።';

  @override
  String get accountVerifiedSuccessfully =>
      'መለያ በተሳካ ሁኔታ ተረጋግጧል! አሁን ሁሉንም ባህሪያት መጠቀም ይችላሉ።';

  @override
  String get otpValidatedSuccessfully => 'OTP በተሳካ ሁኔታ ተረጋግጧል!';

  @override
  String get passwordResetLinkSent => 'የመታወስ አገናኝ ወደ ስልክ ቁጥርዎ ተልኳል።';

  @override
  String get passwordResetLinkSentGeneric =>
      'ከዚህ ስልክ ቁጥር ጋር መለያ ካለ, የመታወስ አገናኝ ተልኳል።';

  @override
  String get passwordResetSuccessfully =>
      'የይለፍ ቃል በተሳካ ሁኔታ ተታወሰ! አሁን በአዲሱ የይለፍ ቃልዎ መግባት ይችላሉ።';

  @override
  String get passwordChangedSuccessfully => 'የይለፍ ቃል በተሳካ ሁኔታ ተቀይሯል!';

  @override
  String get profileUpdatedSuccessfully => 'መገለጫ በተሳካ ሁኔታ ተሻሽሏል!';

  @override
  String get accountDeletedSuccessfully =>
      'መለያ በተሳካ ሁኔታ ተሰርቷል። መልካም ጉዞ እንድንለው እናዝናለን።';

  @override
  String get otpResentSuccessfully => 'OTP በተሳካ ሁኔታ ተድግሏል! እባክዎ ስልክዎን ይመልከቱ።';

  @override
  String get otpResentGeneric => 'ከዚህ ስልክ ቁጥር ጋር መለያ ካለ, OTP ተድግሏል።';

  @override
  String get loggedOutSuccessfully => 'በተሳካ ሁኔታ ወጥተዋል!';

  @override
  String get authenticationRefreshed => 'ማረጋገጫ ተደስቷል!';

  @override
  String get noAuthenticatedUserFound => 'ምንም የተጠቃሚ ማረጋገጫ አልተገኘም።';

  @override
  String get bankCreatedSuccessfully => 'ባንክ በተሳካ ሁኔታ ተፈጥሯል';

  @override
  String get bankUpdatedSuccessfully => 'ባንክ በተሳካ ሁኔታ ተሻሽሏል';

  @override
  String get bankDeletedSuccessfully => 'ባንክ በተሳካ ሁኔታ ተሰርቷል';

  @override
  String get failedToSyncCompanySwitch =>
      'ኩባንያ ለውጥን ከሰርቨር ጋር ማመሳሰል አልተሳካም። ምርጫዎ በአካባቢ ተቀምጧል።';

  @override
  String get failedToSyncBranchSwitch =>
      'ቅርንጫፍ ለውጥን ከሰርቨር ጋር ማመሳሰል አልተሳካም። ምርጫዎ በአካባቢ ተቀምጧል።';

  @override
  String get brandCreatedSuccessfully => 'የምርት ስም በተሳካ ሁኔታ ተፈጥሯል';

  @override
  String get brandUpdatedSuccessfully => 'የምርት ስም በተሳካ ሁኔታ ተዘምኗል';

  @override
  String get brandDeletedSuccessfully => 'የምርት ስም በተሳካ ሁኔታ ተሰርዟል';

  @override
  String get categoryCreatedSuccessfully => 'ምድብ በተሳካ ሁኔታ ተፈጥሯል';

  @override
  String get categoryUpdatedSuccessfully => 'ምድብ በተሳካ ሁኔታ ተዘምኗል';

  @override
  String get categoryDeletedSuccessfully => 'ምድብ በተሳካ ሁኔታ ተሰርዟል';

  @override
  String get companyUpdatedSuccessfully => 'ኩባንያ በተሳካ ሁኔታ ተዘምኗል';

  @override
  String get stockUpdatedSuccessfully => 'ክምችት በተሳካ ሁኔታ ተዘምኗል';

  @override
  String get companyLogo => 'የኩባንያ ሎጎ';

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
    return 'መያዣዎች ($count)';
  }

  @override
  String get expenseCategoryCreatedSuccessfully => 'ወጪ ምድብ በተሳካ ሁኔታ ተፈጥሯል';

  @override
  String get expenseCategoryUpdatedSuccessfully => 'ወጪ ምድብ በተሳካ ሁኔታ ተዘመነ';

  @override
  String get expenseCategoryDeletedSuccessfully => 'ወጪ ምድብ በተሳካ ሁኔታ ተሰርዟል';

  @override
  String get itemCreatedSuccessfully => 'ንጥል በተሳካ ሁኔታ ተፈጥሯል';

  @override
  String get itemUpdatedSuccessfully => 'ንጥል በተሳካ ሁኔታ ተዘመነ';

  @override
  String get itemDeletedSuccessfully => 'ንጥል በተሳካ ሁኔታ ተሰርዟል';

  @override
  String get codeRequired => 'ኮድ ያስፈልጋል';

  @override
  String get costPriceRequired => 'የዋጋ ዋጋ ያስፈልጋል';

  @override
  String get costPriceMustBeGreaterThanZero => 'የዋጋ ዋጋ ከ 0 በላይ መሆን አለበት';

  @override
  String get unitPriceRequired => 'የአሃድ ዋጋ ያስፈልጋል';

  @override
  String get unitPriceMustBeGreaterThanZero => 'የአሃድ ዋጋ ከ 0 በላይ መሆን አለበት';

  @override
  String get unitPriceMustBeGreaterThanOrEqualToCostPrice =>
      'የአሃድ ዋጋ ከዋጋ ዋጋ ወይም እኩል መሆን አለበት';

  @override
  String get taxRateRequired => 'የግብር መጠን ያስፈልጋል';

  @override
  String get taxRateMustBeBetween0And100 => 'የግብር መጠን በ 0 እና 100 መካከል መሆን አለበት';

  @override
  String get filterItems => 'ንጥሎችን ማጣሪያ';

  @override
  String get modelCreatedSuccessfully => 'ሞዴል በተሳካ ሁኔታ ተፈጥሯል';

  @override
  String get modelUpdatedSuccessfully => 'ሞዴል በተሳካ ሁኔታ ተሻሽሏል';

  @override
  String get modelDeletedSuccessfully => 'ሞዴል በተሳካ ሁኔታ ተሰርቷል';

  @override
  String get paymentMethodCreatedSuccessfully => 'የክፍያ ዘዴ በተሳካ ሁኔታ ተፈጥሯል';

  @override
  String get paymentMethodUpdatedSuccessfully => 'የክፍያ ዘዴ በተሳካ ሁኔታ ተሻሽሏል';

  @override
  String get paymentMethodDeletedSuccessfully => 'የክፍያ ዘዴ በተሳካ ሁኔታ ተሰርቷል';

  @override
  String get profilePictureUploadedSuccessfully => 'የመገለጫ ስዕል በተሳካ ሁኔታ ተጭኗል';
}
