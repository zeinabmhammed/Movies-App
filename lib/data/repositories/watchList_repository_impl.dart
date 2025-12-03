import '../../domain/entities/movie.dart';
import '../../domain/repositories/watchList_repository.dart';
import '../datasources/watchList_local_ds.dart';

class WatchListRepositoryImpl implements WatchListRepository {
  final WatchListRemoteDataSource watchListRemoteDataSource;

  WatchListRepositoryImpl(this.watchListRemoteDataSource);

  @override
  Future<void> removeFromWatchList(Movie movie) {
    return watchListRemoteDataSource.removeFromWatchList(movie);
  }

  @override
  Future<List<Movie>> getWatchList() {
    return watchListRemoteDataSource.getWatchList();
  }
}