import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/usecases/browse_movies.dart';
import 'movie_browse_event.dart';
import 'movie_browse_state.dart';

class MovieBrowseBloc extends Bloc<MovieBrowseEvent, MovieBrowseState> {
  final BrowseMoviesUseCase browseMoviesUseCase;

  MovieBrowseBloc(this.browseMoviesUseCase) : super(MovieBrowseInitial()) {
    on<LoadBrowseMoviesEvent>(_onLoadMovies);
    on<FilterMoviesByGenreEvent>(_onFilterMovies);
  }

  Future<void> _onLoadMovies(
    LoadBrowseMoviesEvent event,
    Emitter<MovieBrowseState> emit,
  ) async {
    emit(MovieBrowseLoading());

    try {
      final int page = 1;
      final (movies, genresSet) = await browseMoviesUseCase(page: page);

      final genres = genresSet.toList()..sort();

      emit(
        MovieBrowseLoaded(
          allMovies: movies,
          filteredMovies: movies,
          genres: genres,
        ),
      );
    } catch (e) {
      emit(MovieBrowseError(e.toString()));
    }
  }

  void _onFilterMovies(
    FilterMoviesByGenreEvent event,
    Emitter<MovieBrowseState> emit,
  ) {
    if (state is MovieBrowseLoaded) {
      final currentState = state as MovieBrowseLoaded;

      final filtered = event.genre == "All"
          ? currentState.allMovies
          : currentState.allMovies
                .where((movie) => movie.genres.contains(event.genre))
                .toList();

      emit(
        MovieBrowseLoaded(
          allMovies: currentState.allMovies,
          filteredMovies: filtered,
          genres: currentState.genres,
        ),
      );
    }
  }
}
