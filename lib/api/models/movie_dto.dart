import 'package:movies_app/api/model/dto/movies_details_dto.dart';

import '../../domain/entities/movie.dart';

class MovieDto {
  final int id;
  final String title;
  final int year;
  final double rating;
  final List<String> genres;
  final String summary;
  final String mediumCoverImage;
  final List<TorrentDto> torrents;

  MovieDto({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.genres,
    required this.summary,
    required this.mediumCoverImage,
    required this.torrents,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      id: int.tryParse(json['movieId'].toString()) ?? 0,
      title: json['name'] ?? '',
      year: int.tryParse(json['year'].toString()) ?? 0,
      rating: (json['rating'] is num)
          ? (json['rating'] as num).toDouble()
          : double.tryParse(json['rating'].toString()) ?? 0.0,
      genres: [],
      summary: '',
      mediumCoverImage: json['imageURL'] ?? '',
      torrents: [],
    );
  }
  Movie toEntity() => Movie(
    id: id,
    title: title,
    year: year,
    rating: rating,
    posterPath: mediumCoverImage,
    genres: genres,
  );

// mapper to bloc entity (we'll implement entity next)
}
