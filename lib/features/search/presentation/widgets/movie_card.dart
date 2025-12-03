import 'package:flutter/material.dart';
import 'package:movies_app/core/textStyles/textStyles.dart';
import '../../../../core/appColors/app_colors.dart';
import '../../../../core/responsive/responsive.dart';
import '../../../../domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return ClipRRect(
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
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Text(
                    movie.rating.toString(),
                    style: s16Regular(color: AppColors.white),
                  ),
                  SizedBox(width: responsive.scaleWidth(4)),
                  Icon(
                    Icons.star,
                    size: responsive.scaleWidth(12),
                    color: AppColors.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
