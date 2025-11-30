import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/repos/movies_repository.dart';

class GetMoviesUseCase {
  final MoviesRepository repository;
  GetMoviesUseCase(this.repository);

  Future<List<Movies>> call({int page = 1, int limit = 20, String? query}) {
    return repository.getMovies(page: page, limit: limit, query: query);
  }
}