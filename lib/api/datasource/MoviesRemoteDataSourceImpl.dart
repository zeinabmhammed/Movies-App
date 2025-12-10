import 'package:injectable/injectable.dart';
import 'package:movies_app/api/api_manger.dart';
import 'package:movies_app/data/datasource/movies_remote_datasource.dart';
import '../../domain/models/movie.dart';

@Injectable(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  ApiManager apiManager;
  MoviesRemoteDataSourceImpl(this.apiManager);

  @override
  Future<List<Movie>> getMovies({
    int page = 1,
    int limit = 20,
    String? query,
  }) async {
    var response = await apiManager.getMovies();
    return response.data!.movies!
        .map((movieDto) => movieDto.toMovie())
        .toList();
  }
}
