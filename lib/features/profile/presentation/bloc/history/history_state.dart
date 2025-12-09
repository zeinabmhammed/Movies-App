import '../../../../../domain/entities/movie.dart';

abstract class HistoryState {}

class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryLoaded extends HistoryState {
  final List<Movie> movies;
  HistoryLoaded(this.movies);
}

class HistoryCountLoaded extends HistoryState {
  final int count;
  HistoryCountLoaded(this.count);
}

class HistoryError extends HistoryState {
  final String message;
  HistoryError(this.message);
}