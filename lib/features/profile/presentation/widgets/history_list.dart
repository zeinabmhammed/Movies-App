import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/search/presentation/widgets/movie_card.dart';
import '../../../../core/appAssets/app_images.dart';
import '../../../../core/responsive/responsive.dart';
import '../bloc/history/history_bloc.dart';
import '../bloc/history/history_state.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final resp = Responsive(context);
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HistoryLoaded) {
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
              crossAxisCount: resp.getGridCount(mobile: 2, tablet: 3, desktop: 4),
              mainAxisSpacing: resp.scaleHeight(16),
              crossAxisSpacing: resp.scaleWidth(16),
              childAspectRatio: resp.gridAspectRatio(),
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieCard(movie: movie);
            },
          );
        } else if (state is HistoryError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}