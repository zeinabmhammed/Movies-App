import 'package:flutter/material.dart';
import 'movie_item.dart';

class HorizontalMovieList extends StatelessWidget {
  final List movies;
  final void Function(dynamic movieId) onTapMovie;

  const HorizontalMovieList({
    super.key,
    required this.movies,
    required this.onTapMovie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () => onTapMovie(movie.id),
            child: Container(
              margin: EdgeInsets.only(
                right: index == movies.length - 1 ? 0 : 16,
              ),
              width: 146,
              height: 220,
              child: MovieItem(movie: movie),
            ),
          );
        },
      ),
    );
  }
}
