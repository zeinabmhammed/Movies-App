import 'package:injectable/injectable.dart';
import 'package:movies_app/data/datasources/movies_remote_datasource.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';
import '../../domain/models/movie.dart';

@Injectable(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource dataSource;

  MoviesRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getMovies({
    int page = 1,
    int limit = 20,
    String? query,
  }) async {
    return dataSource.getMovies(page: page, limit: limit, query: query);
  }
}
