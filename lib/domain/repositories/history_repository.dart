import '../entities/movie.dart';

abstract class HistoryRepository {
  Future<void> addToHistory(Movie movie);
  Future<List<Movie>> getHistory();
}