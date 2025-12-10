import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/models/movie_suggestion.dart';
import 'package:movies_app/domain/repos/movies_suggestions_repository.dart';

@injectable
class GetMoviesSuggestionsUseCase {
  MoviesSuggestionsRepository moviesSuggestionsRepository;
  GetMoviesSuggestionsUseCase(this.moviesSuggestionsRepository);

  Future<List<MovieSuggestion>> getMoviesSuggestions(int movieId) {
    return moviesSuggestionsRepository.getMoviesSuggestions(movieId);
  }
}
