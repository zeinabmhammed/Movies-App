import '../../domain/entities/movie.dart';
import '../../domain/repositories/history_repository.dart';
import '../datasources/history_local_ds.dart';
import '../models/movie_dto.dart';

class HistoryRepoImpl implements HistoryRepository {
  final HistoryLocalDataSource local;

  HistoryRepoImpl(this.local);

  @override
  Future<void> addToHistory(Movie movie) {
    final dto = MovieDto.fromMovieEntity(movie);
    return local.addToHistory(dto.toJson());
  }

  @override
  Future<List<Movie>> getHistory() async {
    final data = await local.getHistory();
    return data.map((json) => MovieDto.fromJson(json).toMovieEntity()).toList();
  }
}