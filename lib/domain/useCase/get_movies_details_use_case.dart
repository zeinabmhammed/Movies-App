import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/models/movie_details.dart';
import 'package:movies_app/domain/repos/movies_details_repository.dart';

@injectable
class GetMovieDetailsUseCase {
  final MovieDetailsRepository repository;

  GetMovieDetailsUseCase(this.repository);

  Future<MovieDetails> execute(int movieId) {
    return repository.getMovieDetails(movieId);
  }
}