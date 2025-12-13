import 'package:movies_app/domain/models/movie_details.dart';

abstract class MovieDetailsRepository {
  Future<MovieDetails> getMovieDetails(int movieId);
}