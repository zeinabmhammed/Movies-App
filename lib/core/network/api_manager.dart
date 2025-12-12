import 'package:dio/dio.dart';
import 'package:movies_app/data/models/ApiResponseMessage.dart';
import 'package:movies_app/data/models/ProfileResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/Movie_dto.dart';
import '../../domain/entities/movie.dart';
import 'dio_factory_auth.dart';
import 'dio_factory_movies.dart';
import 'api_config.dart';

class ApiManager {
  final Dio _dioMovies;
  final Dio _dioAuth;

  ApiManager({required Dio dioMovies, required Dio dioAuth})
    : _dioMovies = dioMovies,
      _dioAuth = dioAuth;

  Future<Response> login(String email, String password) {
    return _dioAuth.post(
      ApiConfig.loginEndpoint,
      data: {"email": email, "password": password},
    );
  }

  Future<Response> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avatarId,
  }) {
    return _dioAuth.post(
      ApiConfig.registerEndpoint,
      data: {
        "name": name,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "phone": phone,
        "avaterId": avatarId,
      },
    );
  }

  Future<Map<String, dynamic>> searchMovies(String query) async {
    final response = await _dioMovies.get(
      ApiConfig.listMovies,
      queryParameters: {"query_term": query, "limit": 20},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> browseMovies({
    String? genre,
    int page = 1,
  }) async {
    final response = await _dioMovies.get(
      ApiConfig.listMovies,
      queryParameters: {
        "limit": 20,
        "page": page,
        "sort_by": "rating",
        "order_by": "desc",
      },
    );
    return response.data;
  }

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? "";
  }

  Future<ProfileResponse> getProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token") ?? "";
      if (token.isEmpty) {
        throw Exception("Token is empty");
      }

      final response = await _dioMovies.get(
        ApiConfig.getProfile,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      return ProfileResponse.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to load profile: $e");
    }
  }

  Future<ApiResponseMessage> updateProfile({
    String? email,
    int? avaterId,
    String? name,
    String? phone,
  }) async {
    try {
      final token = await _getToken();
      final response = await _dioMovies.patch(
        ApiConfig.updateProfile,
        data: {
          if (email != null) "email": email,
          if (avaterId != null) "avaterId": avaterId,
          if (name != null) "name": name,
          if (phone != null) "phone": phone,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      return ApiResponseMessage.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to update profile: $e");
    }
  }

  Future<ApiResponseMessage> deleteAccount() async {
    try {
      final token = await _getToken();
      final response = await _dioMovies.delete(
        ApiConfig.deleteAccount,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      return ApiResponseMessage.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to delete account: $e");
    }
  }

  Future<List<Movie>> getFavoriteMovies() async {
    try {
      final token = await _getToken();
      final response = await _dioMovies.get(
        ApiConfig.getFavoriteMovies,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );

      final data = response.data['data'] as List;
      return data
          .map((json) => MovieDto.fromJson(json).toMovieEntity())
          .toList();
    } catch (e) {
      throw Exception("Failed to load favorite movies: $e");
    }
  }

  Future<void> deleteFavoriteMovie(int movieId) async {
    try {
      final token = await _getToken();
      await _dioMovies.delete(
        "${ApiConfig.deleteFavoriteMovie}/$movieId",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
    } catch (e) {
      throw Exception("Failed to delete favorite movie: $e");
    }
  }
}
