import '../../domain/entities/movie.dart';

abstract class WatchListRemoteDataSource {
  Future<void> addToWatchList(Movie movie);
  Future<void> removeFromWatchList(Movie movie);
  Future<List<Movie>> getWatchList();
}