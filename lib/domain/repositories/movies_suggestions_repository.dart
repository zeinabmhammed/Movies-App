import 'package:movies_app/domain/models/movie_suggestion.dart';

abstract class MoviesSuggestionsRepository {
  Future<List<MovieSuggestion>> getMoviesSuggestions(int movieId);
}
