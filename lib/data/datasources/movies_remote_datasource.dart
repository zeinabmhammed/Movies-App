import '../../domain/models/movie.dart';


abstract class MoviesRemoteDataSource {
  Future<List<Movie>> getMovies({
    int page = 1,
    int limit = 20,
    String? query,
  });
}