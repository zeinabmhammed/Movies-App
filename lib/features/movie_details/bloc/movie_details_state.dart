import 'package:movies_app/domain/models/movie_details.dart';
import 'package:movies_app/domain/models/movie_suggestion.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetails movieDetails;
  final List<MovieSuggestion> suggestions;

  MovieDetailsLoaded({required this.movieDetails, required this.suggestions});
}

class MovieDetailsError extends MovieDetailsState {
  final String message;
  MovieDetailsError(this.message);
}
