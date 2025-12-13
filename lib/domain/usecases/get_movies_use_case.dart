import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import '../models/movie.dart';

@injectable
class GetMoviesUseCase {
  final MoviesRepository repository;
  GetMoviesUseCase(this.repository);

  Future<List<Movie>> call({int page = 1, int limit = 20, String? query}) {
    return repository.getMovies(page: page, limit: limit, query: query);
  }
}
