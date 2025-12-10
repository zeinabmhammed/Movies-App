import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/useCase/get_movies_use_case.dart';
import 'package:movies_app/features/main_layout/home/bloc/movies_event.dart';
import 'package:movies_app/features/main_layout/home/bloc/movies_state.dart';

@injectable
class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase getMoviesUseCase;

  MoviesBloc(this.getMoviesUseCase) : super(MoviesInitial()) {
    on<FetchMoviesEvent>((event, emit) async {
      emit(MoviesLoading());
      try {
        final movies = await getMoviesUseCase();
        emit(MoviesLoaded(movies));
      } catch (e) {
        emit(MoviesError(e.toString()));
      }
    });
  }
}