import 'package:movies_app/data/datasource/movies_remote_datasource.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/domain/repos/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource dataSource;
  MoviesRepositoryImpl(this.dataSource);

  @override
  Future<List<Movies>> getMovies({
    int page = 1,
    int limit = 20,
    String? query,
  }) async {
    return await dataSource.getMovies(
      page: page,
      limit: limit,
      query: query,
    );
  }
}