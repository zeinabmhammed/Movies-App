import '../../entities/movie.dart';
import '../../repositories/watchList_repository.dart';

class RemoveFromWatchListUseCase {
  final WatchListRepository repository;

  RemoveFromWatchListUseCase(this.repository);

  Future<void> call(Movie movie) {
    return repository.removeFromWatchList(movie);
  }
}