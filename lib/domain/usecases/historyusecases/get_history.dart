import '../../entities/movie.dart';
import '../../repositories/history_repository.dart';

class GetHistoryUseCase {
  final HistoryRepository repository;

  GetHistoryUseCase(this.repository);

  Future<List<Movie>> call() {
    return repository.getHistory();
  }
}