import 'package:injectable/injectable.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/data/datasource/movies_details_remote_datasource.dart';
import 'package:movies_app/domain/models/movie_details.dart';

@Injectable(as: MovieDetailsRemoteDataSource)
class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  ApiManager apiManager;
  MovieDetailsRemoteDataSourceImpl(this.apiManager);

  @override
  Future<MovieDetails> getMovieDetails(int movieId) async {
    var response = await apiManager.getMovieDetails(movieId);
    return response.data!.movie!.toMovieDetails();
  }

}