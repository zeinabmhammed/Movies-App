import '../../domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> searchMovies(String query);

  Future<(List<Movie>, Set<String>)> browseMovies({int page=1});
}