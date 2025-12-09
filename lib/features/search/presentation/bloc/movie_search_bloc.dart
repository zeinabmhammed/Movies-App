import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../../../domain/entities/movie.dart';
import '../../../../domain/usecases/search_movies.dart';
import 'movie_search_event.dart';
import 'movie_search_state.dart';

const _debounceDuration = Duration(milliseconds: 500);

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  final SearchMoviesUseCase searchMoviesUseCase;

  MovieSearchBloc(this.searchMoviesUseCase) : super(MovieSearchInitial()) {
    on<SearchMovieEvent>(
      _onSearchMovie,
      transformer: debounce(_debounceDuration),
    );
  }

  Future<void> _onSearchMovie(
      SearchMovieEvent event, Emitter<MovieSearchState> emit) async {
    if (event.query.isEmpty) {
      emit(MovieSearchInitial());
      return;
    }

    emit(MovieSearchLoading());

    try {
      final List<Movie> movies = await searchMoviesUseCase(event.query);
      emit(MovieSearchLoaded(movies));
    } catch (e) {
      emit(MovieSearchError(e.toString()));
    }
  }
}