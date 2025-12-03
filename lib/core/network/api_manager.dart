import 'package:dio/dio.dart';
import 'package:movies_app/data/models/ApiResponseMessage.dart';
import 'package:movies_app/data/models/ProfileResponse.dart';
import '../../data/models/Movie_dto.dart';
import '../../domain/entities/movie.dart';
import 'dio_factory.dart';
import 'api_config.dart';

class ApiManager {
  final Dio _dio = DioFactory.createDio();

  Future<Map<String, dynamic>> searchMovies(String query) async {
    final response = await _dio.get(
      ApiConfig.listMovies,
      queryParameters: {"query_term": query, "limit": 20},
    );
    return response.data;
  }

  Future<Map<String, dynamic>> browseMovies({
    String? genre,
    int page = 1,
  }) async {
    final response = await _dio.get(
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

  Future<ProfileResponse> getProfile() async {
    try {
      final response = await _dio.get(
        ApiConfig.getProfile,
        options: Options(
          headers: {
            "Authorization": "Bearer ${ApiConfig.token}",
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
      final response = await _dio.patch(
        ApiConfig.updateProfile,
        data: {
          if (email != null) "email": email,
          if (avaterId != null) "avaterId": avaterId,
          if (name != null) "name": name,
          if (phone != null) "phone": phone,
        },
        options: Options(
          headers: {
            "Authorization": "Bearer ${ApiConfig.token}",
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
      final response = await _dio.delete(
        ApiConfig.deleteAccount,
        options: Options(
          headers: {
            "Authorization": "Bearer ${ApiConfig.token}",
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
      final response = await _dio.get(
        ApiConfig.getFavoriteMovies,
        options: Options(
          headers: {
            "Authorization": "Bearer ${ApiConfig.token}",
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
      await _dio.delete(
        "${ApiConfig.deleteFavoriteMovie}/$movieId",
        options: Options(
          headers: {
            "Authorization": "Bearer ${ApiConfig.token}",
            "Content-Type": "application/json",
          },
        ),
      );
    } catch (e) {
      throw Exception("Failed to delete favorite movie: $e");
    }
  }
}
