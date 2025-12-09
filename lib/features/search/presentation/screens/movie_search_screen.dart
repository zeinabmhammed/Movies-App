import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/appAssets/app_icons.dart';
import 'package:movies_app/core/appAssets/app_images.dart';
import '../../../../core/commonWidgets/custom_textField.dart';
import '../../../../core/resources/color_manger.dart';
import '../../../../core/resources/styles_manger.dart';
import '../bloc/movie_search_bloc.dart';
import '../bloc/movie_search_event.dart';
import '../bloc/movie_search_state.dart';
import '../../../../core/responsive/responsive.dart';
import '../widgets/movie_card.dart';

class MovieSearchScreen extends StatelessWidget {
  const MovieSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: responsive.scaleWidth(16),
            right: responsive.scaleWidth(16),
            bottom: responsive.scaleHeight(16)),
        child: SafeArea(
          child: Column(
            children: [
              CustomTextField(
                hint: "Search...",
                hintStyle: s16Regular(color: ColorManager.white),
                style: s16Regular(color: ColorManager.white),
                prefixIcon: AppIcons.searchIcon,
                onChanged: (value) {
                  context.read<MovieSearchBloc>().add(SearchMovieEvent(value));
                },
              ),
              SizedBox(height: responsive.scaleHeight(16)),
              Expanded(
                child: BlocBuilder<MovieSearchBloc, MovieSearchState>(
                  builder: (context, state) {
                    if(state is MovieSearchInitial){
                      return Center(
                        child: Image.asset(
                          AppImages.empty,
                          width: 150,
                          height: 150,
                        ),
                      );
                    }else if (state is MovieSearchLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MovieSearchLoaded) {
                      final movies = state.movies;
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: responsive.getGridCount(),
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 8,
                          childAspectRatio: responsive.gridAspectRatio(),
                        ),
                        itemCount: movies.length,
                        itemBuilder: (context, index) {
                          final movie = movies[index];
                          return MovieCard(movie: movie);
                        },
                      );
                    } else if (state is MovieSearchError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
