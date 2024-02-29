class EndPoints {
  static const login = 'login';


  static const register = 'user/register';

  static const statistics = 'statistic/users';

  static const statusStatistics= 'statues';

  static String getCity(id) => 'city/show/$id';

  static const home = 'home';
  static const getRates = 'opinion/category';
  static const getDivisions = 'categories';
  static const getArticles = 'search/articles';
  static const updateProfile = "user/update";
  static const doctorHome = "admin/home";
  static const getBanners = 'banners';
  static const getUsers = 'search/users';
  static const getDepartments = 'department';
  static const postStatus = 'statues/store';
  static const articlesStatistics = 'statistic/articles';
  static const addRating = 'opinion/store';

  static String getTitles(departmentId) => "title/department/$departmentId";

  static String deleteBanner(bannerId) => "banners/$bannerId";

  static String updateArticle(articleId) => "article/$articleId";

  static String deleteRate(rateId) => "opinion/delete/$rateId";

  static String deleteUser(userId) => "delete/users/$userId";

  static const addArticle = "article";
  static const createUser = 'assign';

  static String updateUser(userId) => "change/role/$userId";

  static String updatePermissionsInRole(roleId) => "update/role/$roleId";

  static const addDivision = 'categories/store';
  static const getNotifications = 'get/notification';
  static const forgotPassword = 'forget-password';
  static const checkOtp = 'check/otp';
  static const resetPassword = 'reset-password';

  static String updateDivision(divisionId) => "categories/update/$divisionId";
}