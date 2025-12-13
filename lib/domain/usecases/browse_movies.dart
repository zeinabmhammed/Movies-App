import '../../domain/entities/movie.dart';
import '../repositories/movie_repository.dart';

class BrowseMoviesUseCase {
  final MovieRepository repository;

  BrowseMoviesUseCase(this.repository);

  Future<(List<Movie>, Set<String>)> call({int page=1}) {
    return repository.browseMovies(page: page);
  }
}
