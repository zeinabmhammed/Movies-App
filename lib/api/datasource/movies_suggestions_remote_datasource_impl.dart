import 'package:injectable/injectable.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/data/datasources/movies_suggustions_remote_datasource.dart';
import 'package:movies_app/domain/models/movie_suggestion.dart';

@Injectable(as: MoviesSuggestionsRemoteDataSource)
class MoviesSuggestionsRemoteDataSourceImpl
    implements MoviesSuggestionsRemoteDataSource {
  ApiManager apiManager;
  MoviesSuggestionsRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<MovieSuggestion>> getMoviesSuggestions(int movieId) async {
    var response = await apiManager.getMovieSuggestions(movieId);
    return response.data!.movies!
        .map((movieDto) => movieDto.toMovieSuggestion())
        .toList();
  }
}
