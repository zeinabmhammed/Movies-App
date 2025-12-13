import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/resources/color_manger.dart';
import 'package:movies_app/domain/models/movie_details.dart';
import 'package:movies_app/domain/models/movie_suggestion.dart';
import 'package:movies_app/features/movie_details/bloc/movie_details_bloc.dart';
import 'package:movies_app/features/movie_details/bloc/movie_details_event.dart';
import 'package:movies_app/features/movie_details/bloc/movie_details_state.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/poster_banner_widget.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/screenshots_section_widget.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/summary_section.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/cast_section.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/genres_section.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/similar_movies_section.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  const MovieDetailsScreen({Key? key, required this.movieId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MovieDetailsBloc>()..add(FetchMovieDetails(movieId)),
      child: Scaffold(
        backgroundColor: ColorManager.black,
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieDetailsLoaded) {
              final MovieDetails movie = state.movieDetails;
              final List<MovieSuggestion> suggestions = state.suggestions;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PosterBanner(movie: movie),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ScreenshotsSection(screenShots: movie.screenshots),
                          SizedBox(height: 16),
                          SimilarMoviesSection(
                            similarMovies: suggestions
                                .map(
                                  (s) => {
                                    "image": s.mediumCoverImage ?? '',
                                    "rating": s.rating ?? 0,
                                  },
                                )
                                .toList(),
                          ),
                          SizedBox(height: 16),
                          SummarySection(
                            descriptionFull: state.movieDetails.descriptionFull,
                            summary: state.movieDetails.summary,
                            descriptionIntro:
                                state.movieDetails.descriptionIntro,
                          ),
                          SizedBox(height: 16),
                          CastSection(castList: movie.cast),
                          SizedBox(height: 16),
                          GenresSection(genres: movie.genres),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is MovieDetailsError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
