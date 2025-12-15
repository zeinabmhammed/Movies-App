import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/color_manger.dart';

class GenresSection extends StatelessWidget {
  final List<String> genres;

  const GenresSection({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    if (genres.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Genres",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: ColorManager.white,
          ),
        ),
        const SizedBox(height: 13),
        Wrap(
          spacing: 16,
          runSpacing: 11,
          children: genres
              .map(
                (genre) => Container(
                  width: 115,
                  height: 36,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorManager.grey,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: ColorManager.grey),
                  ),
                  child: Text(
                    genre,
                    style: TextStyle(color: ColorManager.white, fontSize: 16),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
