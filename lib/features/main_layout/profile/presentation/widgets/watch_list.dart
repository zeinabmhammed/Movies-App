import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/appAssets/app_images.dart';
import '../../../../../core/resources/responsive/responsive.dart';
import '../../../../movie_details/presentation/screen/movie_details_screen.dart';
import '../../../search/presentation/widgets/movie_card.dart';
import '../bloc/watchList/watch_list_bloc.dart';
import '../bloc/watchList/watch_list_state.dart';

class WatchListWidget extends StatelessWidget {
  const WatchListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final resp = Responsive(context);
    return BlocBuilder<WatchListBloc, WatchListState>(
      builder: (context, state) {
        if (state is WatchListLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WatchListLoaded) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return Center(
              child: Image.asset(
                AppImages.empty,
                width: resp.scaleWidth(150),
                height: resp.scaleHeight(150),
              ),
            );
          }
          return GridView.builder(
            padding: EdgeInsets.all(resp.scaleWidth(8)),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: resp.getGridCount(
                mobile: 3,
                tablet: 4,
                desktop: 5,
              ),
              mainAxisSpacing: resp.scaleHeight(10),
              crossAxisSpacing: resp.scaleWidth(10),
              childAspectRatio: resp.gridAspectRatio(),
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MovieDetailsScreen(movieId: movie.id),
                    ),
                  );
                },
                child: MovieCard(movie: movie),
              );
            },
          );
        } else if (state is WatchListAlreadyExists) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Movie already in Watch List")),
            );
          });
          return const SizedBox();
        }
        return const SizedBox();
      },
    );
  }
}
