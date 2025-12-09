import 'package:movies_app/data/models/Movie_response.dart';

abstract class MoviesRemoteDataSource {
  Future<MovieResponse> searchMovie(String query);

  Future<MovieResponse> browseMovies({String? genre, int page=1});
}