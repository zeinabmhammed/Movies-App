import 'package:movies_app/domain/models/movie_details.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetails> getMovieDetails(int movieId);
}
