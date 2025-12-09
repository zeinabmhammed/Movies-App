import 'package:movies_app/api/models/torrent_dto.dart';

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
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      year: json['year'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      genres: (json['genres'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      summary: json['summary'] ?? '',
      mediumCoverImage: json['medium_cover_image'] ?? '',
      torrents: (json['torrents'] as List<dynamic>? ?? []).map((t) => TorrentDto.fromJson(t)).toList(),
    );
  }

// mapper to domain entity (we'll implement entity next)
}
