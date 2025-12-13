import 'package:injectable/injectable.dart';
import 'package:movies_app/data/datasources/movies_suggustions_remote_datasource.dart';
import 'package:movies_app/domain/models/movie_suggestion.dart';
import 'package:movies_app/domain/repositories/movies_suggestions_repository.dart';

@Injectable(as: MoviesSuggestionsRepository)
class MoviesSuggestionsRepositoryImpl implements MoviesSuggestionsRepository {
  final MoviesSuggestionsRemoteDataSource dataSource;

  MoviesSuggestionsRepositoryImpl(this.dataSource);

  @override
  Future<List<MovieSuggestion>> getMoviesSuggestions(int movieId) async {
    return dataSource.getMoviesSuggestions(movieId);
  }
}
