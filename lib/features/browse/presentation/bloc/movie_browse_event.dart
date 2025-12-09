import 'package:equatable/equatable.dart';

abstract class MovieBrowseEvent extends Equatable {
  const MovieBrowseEvent();

  @override
  List<Object?> get props => [];
}

class LoadBrowseMoviesEvent extends MovieBrowseEvent {}

class FilterMoviesByGenreEvent extends MovieBrowseEvent {
  final String genre;

  const FilterMoviesByGenreEvent(this.genre);

  @override
  List<Object?> get props => [genre];
}