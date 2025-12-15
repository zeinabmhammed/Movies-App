abstract class MovieDetailsEvent {}

class FetchMovieDetails extends MovieDetailsEvent {
  final int movieId;
  FetchMovieDetails(this.movieId);
}