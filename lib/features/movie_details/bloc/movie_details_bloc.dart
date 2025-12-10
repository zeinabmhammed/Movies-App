import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/domain/useCase/get_movies_details_use_case.dart';
import 'package:movies_app/domain/useCase/get_movies_suggestions_use_case.dart';
import 'package:movies_app/features/movie_details/bloc/movie_details_event.dart';
import 'package:movies_app/features/movie_details/bloc/movie_details_state.dart';

@injectable
// Bloc
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMoviesSuggestionsUseCase getMoviesSuggestionsUseCase;

  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getMoviesSuggestionsUseCase,
  ) : super(MovieDetailsInitial()) {
    on<FetchMovieDetails>(_onFetchMovieDetails);
  }

  Future<void> _onFetchMovieDetails(
    FetchMovieDetails event,
    Emitter<MovieDetailsState> emit,
  ) async {
    emit(MovieDetailsLoading());
    try {
      final movieDetails = await getMovieDetailsUseCase.execute(event.movieId);
      final suggestions = await getMoviesSuggestionsUseCase
          .getMoviesSuggestions(event.movieId);
      emit(
        MovieDetailsLoaded(
          movieDetails: movieDetails,
          suggestions: suggestions,
        ),
      );
    } catch (e) {
      emit(MovieDetailsError(e.toString()));
    }
  }
}
