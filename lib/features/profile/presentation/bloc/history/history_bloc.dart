import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/usecases/historyusecases/add_to_history.dart';
import '../../../../../domain/usecases/historyusecases/get_history.dart';
import 'history_event.dart';
import 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final AddToHistoryUseCase addToHistory;
  final GetHistoryUseCase getHistory;

  HistoryBloc({required this.addToHistory, required this.getHistory})
    : super(HistoryInitial()) {
    on<AddToHistoryEvent>((event, emit) async {
      try {
        await addToHistory(event.movie);
        final movies = await getHistory();
        emit(HistoryLoaded(movies));
      } catch (e) {
        emit(HistoryError(e.toString()));
      }
    });

    on<LoadHistoryEvent>((event, emit) async {
      emit(HistoryLoading());
      try {
        final movies = await getHistory();
        emit(HistoryLoaded(movies));
      } catch (e) {
        emit(HistoryError(e.toString()));
      }
    });

    on<GetHistoryCount>((event, emit) async {
      emit(HistoryLoading());
      try {
        final movies = await getHistory();
        emit(HistoryCountLoaded(movies.length));
      } catch (e) {
        emit(HistoryError("Failed to load history: ${e.toString()}"));
      }
    });
  }
}
