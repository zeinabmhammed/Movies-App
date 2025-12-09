import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/useCase/get_movies_use_case.dart';
import 'package:movies_app/features/main_layout/home/cubit/movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final GetMoviesUseCase getMoviesUseCase;
  MovieCubit({required this.getMoviesUseCase}) : super(MovieInitial());

  Future<void> fetchMovies({int limit = 20, int page = 1}) async {
    try {
      emit(MovieLoading());
      final movies = await getMoviesUseCase.call(limit: limit, page: page);
      emit(MovieLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}
