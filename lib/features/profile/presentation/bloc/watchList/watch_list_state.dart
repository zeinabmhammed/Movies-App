import '../../../../../domain/entities/movie.dart';

abstract class WatchListState {}

class WatchListInitial extends WatchListState {}

class WatchListLoading extends WatchListState {}

class WatchListLoaded extends WatchListState {
  final List<Movie> movies;
  WatchListLoaded(this.movies);
}

class WatchListCountLoaded extends WatchListState {
  final int count;
  WatchListCountLoaded(this.count);
}

class WatchListError extends WatchListState {
  final String message;
  WatchListError(this.message);
}