class API_constants {
  /// PRODUCTION
  // static const baseUrl = "https://api.pazybill.com/";

  /// LOCAL
  // static const baseUrl = "http://192.168.0.204:3000/";

  /// STAGE
  static const baseUrl = "https://test.pazybill.com/";

  /// VERSION
  static const version = "v1";

  /// Payment Gateway
  static const paymentGateway = "cashfree";

  /// Testing Env Bill Sev
  static const billBaseUrlBillServerPoint = "http://65.1.254.169:4005/bills/";

  /// Production Env Bill_url
  static const billUrl = "https://device.pazybill.com/file/bills/";

  /// PRIVACY POLICY
  static const privacyWebUrl =
      "http://pazybill.com/privacy_policy.html?type=mobile";

  /// TERMS & CONDITIONS
  static const termsWebUrl =
      "http://pazybill.com/terms_conditions.html?type=mobile";

  /// Grievance
  static const grievance =
      "https://pazybill.com/grievance_policy.html?type=mobile";

  /// LOGIN / REGISTER
  static const sendOtp = "/user/register/sendotp";
  static const verifySignupOtp = "/user/register/verifyotp";
  static const loginWithOtp = "/otp/send";
  static const loginOtpVerify = "/user/login";
  static const loginWithPassword = "/user/login";
  static const signUp = "/profile/update";
  static const setPassword = "/user/setpassword";

  /// PROFILE
  static const viewProfile = "/profile";
  static const fetchProfileStrength = "/profile/strength";
  static const logOut = "/user/logout";
  // static const uploadProfilePic = "/profile/picture/new";
  static const uploadProfilePic = "/profile/picture/add";
  static const fetchAllTransactions = "/cashfree/transactions?loadmore_id=";
  static const fetchTransactionDetails = "/cashfree/transactions/view";
  static const updateProfile = "/profile/update";
  static const helpNewRequest = "/support/new";
  static const helpFetchRequests = "/support/queries";
  static const resetPasswordSendOtp = "/user/reset_password/sendotp";
  static const resetPasswordVerifyOtp = "/user/reset_password/verifyotp";
  static const resetPassword = "/user/reset_password/verifypassword";
  static const changeEmailId = "/email/add_email";
  static const validateEmailId = "/email/validate";

  /// HOME
  static const fetchBills = "/bills";
  static const fetchStores = "/stores";
  static const fetchCategories = "/category";
  static const fetchPbPoints = "/profile/points";
  static const fetchBannerImages = "/ads/banner";

  /// ALL BILLS & STORES
  static const fetchPaginatedBills = "/bills?loadmore_id=";
  static const fetchPaginatedStores = "/stores?loadmore_id=";
  static const fetchStoreBasedBills = "/bills/";
  static const fetchCatBasedStores = "/stores/category/";
  static const fetchCatBasedBills = "/bills/category/";
  static const fetchReceiptDetails = "/cashfree/transaction";

  /// STORES TAB
  static const fetchMapStores = "/stores/maps";
  static const fetchMapCatBasedStores = "/stores/maps/category/";

  /// GENERIC
  static const review = "/bills/review";

  /// QR SCANNER
  static const billDetails = "/bills/scan/";

  /// CASHFREE
  static const fetchCfToken = "/cashfree/createtoken";
  static const getStatus = "/cashfree/getstatus";
  static const createOrder = "/cashfree/createorder";
}
