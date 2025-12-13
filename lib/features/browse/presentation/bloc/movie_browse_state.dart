import 'package:equatable/equatable.dart';
import '../../../../domain/entities/movie.dart';

abstract class MovieBrowseState extends Equatable {
  const MovieBrowseState();

  @override
  List<Object?> get props => [];
}

class MovieBrowseInitial extends MovieBrowseState {}

class MovieBrowseLoading extends MovieBrowseState {}

class MovieBrowseLoaded extends MovieBrowseState {
  final List<Movie> allMovies;
  final List<Movie> filteredMovies;
  final List<String> genres;

  const MovieBrowseLoaded({
    required this.allMovies,
    required this.filteredMovies,
    required this.genres,
  });

  @override
  List<Object?> get props => [allMovies, filteredMovies, genres];
}

class MovieBrowseError extends MovieBrowseState {
  final String message;

  const MovieBrowseError(this.message);

  @override
  List<Object?> get props => [message];
}