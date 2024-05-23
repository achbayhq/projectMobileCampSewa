class ApiEndpoints {
  static const String baseUrl = "http://192.168.1.24:8000";
  static AuthEndPoints authendpoints = AuthEndPoints();
}

class AuthEndPoints {
  final String login = "/api/login";
  final String register = "/api/register";
  final String lupaPass = "/api/lupa-password";
  final String lupaPassOTP = "/api/lupa-password/verifikasi-otp/";
  final String lupaPassResetPass = "/api/lupa-password/reset-password/";
  final String lupaPassKirimUlangOTP = "/api/lupa-password/kirim-ulang-otp/";
}
