import '../../../../../../domain/entities/movie.dart';

abstract class WatchListEvent {}

class RemoveFromWatchListEvent extends WatchListEvent {
  final Movie movie;
  RemoveFromWatchListEvent(this.movie);
}

class LoadWatchListEvent extends WatchListEvent {}

class GetWatchListCount extends WatchListEvent {}


class AddToWatchListEvent extends WatchListEvent {
  final Movie movie;
  AddToWatchListEvent(this.movie);
}