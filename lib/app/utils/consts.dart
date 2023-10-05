
const String kBaseUrl = "student.valuxapps.com";
const String kBaseVersion = 'api/';

// end points
const String kLogin = 'login';
const String kRegister = 'register';
const String kLogOut = 'logout';
const String kProfile = 'profile';
const String kUpdateProfile = 'update-profile';
const String kChangePassword = 'change-password';
const String kCategories = 'categories';
const String kCatProducts= 'categories';
const String kProductDetails = 'products';
const String kHome = 'home';
const String kGetCart = 'carts';
const String kAddOrRemoveCart = 'carts';
const String kFavourites = 'favorites';
const String kComplaints = 'complaints';
const String kFaqs = 'faqs';
const String kAddresses = 'addresses';

//Static Headers
 Map<String, String> apiHeaders = {
  "Content-Type": "application/json",
  "Accept": "application/json, text/plain, */*",
  "X-Requested-With": "XMLHttpRequest",
};