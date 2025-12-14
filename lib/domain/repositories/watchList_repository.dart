import '../entities/movie.dart';

abstract class WatchListRepository {
  Future<void> addToWatchList(Movie movie);
  Future<void> removeFromWatchList(Movie movie);
  Future<List<Movie>> getWatchList();
}