import 'package:flutter/material.dart';
import 'package:movies_app/domain/models/movie_details.dart';

class CastSection extends StatelessWidget {
  final List<CastEntity> castList;

  const CastSection({super.key, required this.castList});

  @override
  Widget build(BuildContext context) {
    if (castList.isEmpty) return const SizedBox();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Cast",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: castList.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final cast = castList[index];
              return Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: cast.imageUrl.isNotEmpty
                        ? NetworkImage(cast.imageUrl)
                        : null,
                    child: cast.imageUrl.isEmpty
                        ? const Icon(Icons.person, size: 40)
                        : null,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    cast.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    cast.character,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
