class ApiEndpoints {
  static const String baseUrl = "https://www.quickpickdeal.com";
  static _AuthEndPoints authendpoints = _AuthEndPoints();
}

class _AuthEndPoints{
  final String login = "/api/auth/login";
  final String register = "/api/auth/registration";
}