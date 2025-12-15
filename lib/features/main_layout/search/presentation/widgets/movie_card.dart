import 'package:flutter/material.dart';
import '../../../../../core/resources/color_manger.dart';
import '../../../../../core/resources/responsive/responsive.dart';
import '../../../../../core/resources/styles_manger.dart';
import '../../../../../core/routes_manger/routes.dart';
import '../../../../../domain/entities/movie.dart';
import '../../../../movie_details/presentation/screen/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetailsScreen(movieId: movie.id),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 183 / 279,
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.broken_image, size: 40),
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.scaleWidth(6),
                  vertical: responsive.scaleHeight(4),
                ),
                decoration: BoxDecoration(
                  color: ColorManager.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(
                      movie.rating.toString(),
                      style: s16Regular(color: ColorManager.white),
                    ),
                    SizedBox(width: responsive.scaleWidth(4)),
                    Icon(
                      Icons.star,
                      size: responsive.scaleWidth(12),
                      color: ColorManager.yellow,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
