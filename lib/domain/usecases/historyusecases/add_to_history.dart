import '../../entities/movie.dart';
import '../../repositories/history_repository.dart';

class AddToHistoryUseCase {
  final HistoryRepository repository;

  AddToHistoryUseCase(this.repository);

  Future<void> call(Movie movie) {
    return repository.addToHistory(movie);
  }
}