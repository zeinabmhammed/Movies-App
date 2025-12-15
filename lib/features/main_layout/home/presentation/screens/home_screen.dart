import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/resources/color_manger.dart';
import 'package:movies_app/core/screens_wrapper/screens_wrapper.dart';
import 'package:movies_app/features/main_layout/home/bloc/movies_bloc.dart';
import 'package:movies_app/features/main_layout/home/bloc/movies_state.dart';
import 'package:movies_app/features/main_layout/home/presentation/widgets/top_carousel.dart';
import 'package:movies_app/features/main_layout/home/presentation/widgets/action_section.dart';
import 'package:movies_app/features/main_layout/home/presentation/widgets/horizontal_movie_list.dart';
import 'package:movies_app/features/movie_details/presentation/screen/movie_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(
      viewportFraction: 0.55,
      initialPage: 0,
    );

    return Scaffold(
      backgroundColor: ColorManager.black,
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MoviesLoaded) {
            final movies = state.movies;
            return SingleChildScrollView(
              child: Column(
                children: [
                  TopCarousel(
                    pageController: _pageController,
                    movies: movies,
                    onTapMovie: (id) {
                      debugPrint("Tapped movie id: $id");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieDetailsScreen(movieId: id),
                        ),
                      );
                    },
                  ),
                  ActionSection(
                    title: "Action",
                    onSeeMore: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => MovieBrowseWrapper()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  HorizontalMovieList(
                    movies: movies,
                    onTapMovie: (id) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieDetailsScreen(movieId: id),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            );
          } else if (state is MoviesError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox(height: 20);
        },
      ),
    );
  }
}
