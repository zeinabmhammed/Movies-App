import 'package:movies_app/domain/models/movie_suggestion.dart';

abstract class MoviesSuggestionsRemoteDataSource {
  Future<List<MovieSuggestion>> getMoviesSuggestions(int movieId);
}