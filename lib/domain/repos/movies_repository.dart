import 'package:movies_app/data/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<Movies>> getMovies({int page = 1, int limit = 20, String? query});
}