import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../domain/usecases/watchListUsecases/add_to_watchList_useCase.dart';
import '../../../../../../domain/usecases/watchListUsecases/get_watchList.dart';
import '../../../../../../domain/usecases/watchListUsecases/remove_from_watchList.dart';
import 'watch_list_event.dart';
import 'watch_list_state.dart';

class WatchListBloc extends Bloc<WatchListEvent, WatchListState> {
  final RemoveFromWatchListUseCase removeFromWatchList;
  final GetWatchListUseCase getWatchList;
  final AddToWatchListUseCase addToWatchList;

  WatchListBloc({
    required this.removeFromWatchList,
    required this.getWatchList,
    required this.addToWatchList,
  }) : super(WatchListInitial()) {

    on<RemoveFromWatchListEvent>((event, emit) async {
      try {
        await removeFromWatchList(event.movie);
        final movies = await getWatchList();
        emit(WatchListLoaded(movies));
      } catch (e) {
        emit(WatchListError("Failed to remove movie: ${e.toString()}"));
      }
    });

    on<LoadWatchListEvent>((event, emit) async {
      emit(WatchListLoading());
      try {
        final movies = await getWatchList();
        emit(WatchListLoaded(movies));
      } catch (e) {
        emit(WatchListError("Failed to load watch list: ${e.toString()}"));
      }
    });

    on<GetWatchListCount>((event, emit) async {
      try {
        final movies = await getWatchList();
        print("WatchList length: ${movies.length}");
        emit(WatchListCountLoaded(movies.length));
      } catch (e) {
        emit(WatchListError("Failed to get watch list count: ${e.toString()}"));
      }
    });
    on<AddToWatchListEvent>((event, emit) async {
      try {
        await addToWatchList(event.movie);
        final movies = await getWatchList();
        emit(WatchListLoaded(movies));
      } catch (e) {
        emit(WatchListError("Failed to add movie: ${e.toString()}"));
      }
    });
  }
}
