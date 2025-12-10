import 'package:flutter/material.dart';
import 'rating_badge.dart';

class MovieItem extends StatelessWidget {
  final dynamic movie;
  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Hero(
            tag: 'movie-image-${movie.id}',
            child: Image.network(
              movie.smallCoverImage ?? 'https://via.placeholder.com/146x220',
              width: 146,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: RatingBadge(
            rating: movie.rating.toString(),
            width: 58,
            height: 28,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
