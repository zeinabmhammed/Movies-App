import '../../entities/movie.dart';
import '../../repositories/watchList_repository.dart';

class GetWatchListUseCase {
  final WatchListRepository repository;

  GetWatchListUseCase(this.repository);

  Future<List<Movie>> call() {
    return repository.getWatchList();
  }
}