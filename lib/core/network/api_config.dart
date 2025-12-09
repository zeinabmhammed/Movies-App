abstract class ApiConfig {
  static const String baseUrl = "https://route-movie-apis.vercel.app";

  // Endpoints
  static const String loginEndpoint = "$baseUrl/auth/login";
  static const String registerEndpoint = "$baseUrl/auth/register";

  // Timeouts
  static const int connectTimeout = 10000;
  static const int receiveTimeout=10000;
}