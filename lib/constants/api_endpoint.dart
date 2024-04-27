class ApiEndpoints {
  static const String baseUrl = "https://www.quickpickdeal.com";
  static AuthEndPoints authendpoints = AuthEndPoints();
}

class AuthEndPoints {
  final String login = "/api/auth/login";
  final String register = "/api/auth/registration";
}
