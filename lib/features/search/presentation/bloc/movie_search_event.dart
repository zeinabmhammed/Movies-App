import 'package:equatable/equatable.dart';

abstract class MovieSearchEvent extends Equatable {
  const MovieSearchEvent();

  @override
  List<Object?> get props => [];
}

class SearchMovieEvent extends MovieSearchEvent {
  final String query;

  const SearchMovieEvent(this.query);

  @override
  List<Object?> get props => [query];
}