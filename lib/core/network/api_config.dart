abstract class ApiConfig {
  static const String baseUrl = "https://route-movie-apis.vercel.app";
  static final String moviesBaseUrl = "https://yts.lt/api/v2";
  static const String listMovies = "/list_movies.json";

  // Endpoints
  static const String loginEndpoint = "$baseUrl/auth/login";
  static const String registerEndpoint = "$baseUrl/auth/register";
  static final String profileBaseUrl = "https://route-movie-apis.vercel.app";
  static final String updateProfile = "$profileBaseUrl/profile";
  static final String deleteAccount = "$profileBaseUrl/profile";
  static final String getProfile = "$profileBaseUrl/profile";

  static final String getFavoriteMovies = "$profileBaseUrl/favorites/all";
  static final String deleteFavoriteMovie = "$profileBaseUrl/favorites/remove";
  static final String addFavoriteMovie = "$profileBaseUrl/favorites/add";

  static const int connectTimeout = 10000;
  static const int receiveTimeout = 10000;
}