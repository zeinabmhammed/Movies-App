import '../../domain/entities/movie.dart';

abstract class WatchListRemoteDataSource {
  Future<void> removeFromWatchList(Movie movie);
  Future<List<Movie>> getWatchList();
}