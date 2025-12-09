import '../../../../core/network/api_manager.dart';
import '../../../../core/network/execute_api.dart';
import '../models/Movie_response.dart';
import 'movies_remote_ds.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final ApiManager api;

  MoviesRemoteDataSourceImpl(this.api);

  @override
  Future<MovieResponse> searchMovie(String query) async {
    final res = await executeApi<Map<String, dynamic>>(
      () => api.searchMovies(query),
    );

    if (res is Success<Map<String, dynamic>>) {
      return MovieResponse.fromJson(res.data);
    } else if (res is Failure<Map<String, dynamic>>) {
      throw Exception(res.message);
    }

    throw Exception("Unknown error");
  }

  @override
  Future<MovieResponse> browseMovies({String? genre, int page = 1}) async {
    final res = await executeApi<Map<String, dynamic>>(
      () => api.browseMovies(genre: genre, page: page),
    );

    if (res is Success<Map<String, dynamic>>) {
      return MovieResponse.fromJson(res.data);
    } else if (res is Failure<Map<String, dynamic>>) {
      throw Exception(res.message);
    }

    throw Exception("Unknown error");
  }

}
