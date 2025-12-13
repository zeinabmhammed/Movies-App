import 'package:injectable/injectable.dart';
import 'package:movies_app/data/datasources/movies_details_remote_datasource.dart';
import 'package:movies_app/domain/models/movie_details.dart';
import 'package:movies_app/domain/repositories/movies_details_repository.dart';

@Injectable(as: MovieDetailsRepository)
class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDetailsRemoteDataSource remoteDataSource;

  MovieDetailsRepositoryImpl(this.remoteDataSource);

  @override
  Future<MovieDetails> getMovieDetails(int movieId) async {
    return await remoteDataSource.getMovieDetails(movieId);
  }
}