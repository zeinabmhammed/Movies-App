import '../../../../../domain/entities/movie.dart';

abstract class HistoryEvent {}

class AddToHistoryEvent extends HistoryEvent {
  final Movie movie;
  AddToHistoryEvent(this.movie);
}

class LoadHistoryEvent extends HistoryEvent {}

class GetHistoryCount extends HistoryEvent {}
