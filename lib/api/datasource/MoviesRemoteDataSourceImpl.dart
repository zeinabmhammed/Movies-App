import 'package:dio/dio.dart';
import 'package:movies_app/data/datasource/movies_remote_datasource.dart';
import 'package:movies_app/data/models/movie_model.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final Dio dio;
  MoviesRemoteDataSourceImpl(this.dio);

  @override
  Future<List<Movies>> getMovies({
    int page = 1,
    int limit = 20,
    String? query,
  }) async {
    try {
      final response = await dio.get(
        'list_movies.json',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (query != null) 'query_term': query,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        final moviesJson = data['movies'] as List<dynamic>? ?? [];
        return moviesJson.map((json) => Movies.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }
}
