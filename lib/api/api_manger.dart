import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/api/model/response/MoviesDetailsResponse/movies_details_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'model/response/MoviesDetailsResponse/MoviesSuggestionsResponse/movies_suggestions_response.dart';
import 'model/response/MoviesResponse/movies_response.dart';

@singleton
class ApiManager {
  final _dio = Dio();

  ApiManager() {
    _dio.options.baseUrl = "https://yts.lt/api/";
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  Future<MoviesResponse> getMovies({
    int page = 1,
    int limit = 20,
    String quality = "All",
    String sortBy = "year",
  }) async {
    var response = await _dio.get("v2/list_movies.json");
    var moviesResponse = MoviesResponse.fromJson(response.data);
    return moviesResponse;
  }

  Future<MoviesDetailsResponse> getMovieDetails(int movieId) async {
    var response = await _dio.get(
      "v2/movie_details.json",
      queryParameters: {
        "movie_id": movieId,
        "with_images": true,
        "with_cast": true,
        "with_torrents": true,
      },
    );
    var moviesDetailsResponse = MoviesDetailsResponse.fromJson(response.data);
    return moviesDetailsResponse;
  }

  Future<MoviesSuggestionsResponse> getMovieSuggestions(int movieId) async {
    var response = await _dio.get(
      "v2/movie_suggestions.json",
      queryParameters: {
        "movie_id": movieId,
        "limit": 4,
        "with_images": true,
        "with_torrents": true,
      },
    );
    var moviesSuggestionsResponse = MoviesSuggestionsResponse.fromJson(
      response.data,
    );
    return moviesSuggestionsResponse;
  }
}
