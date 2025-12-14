import '../../entities/movie.dart';
import '../../repositories/watchList_repository.dart';


class AddToWatchListUseCase {
  final WatchListRepository repo;

  AddToWatchListUseCase(this.repo);

  Future<void> call(Movie movie) async {
    return await repo.addToWatchList(movie);
  }
}