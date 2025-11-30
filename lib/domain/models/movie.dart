import 'package:movies_app/domain/models/torrent_model.dart';

class Movie {
  final int id;
  final String title;
  final String? titleEnglish;
  final int? year;
  final double rating;
  final int? runtime;
  final String? summary;
  final List<String> genres;
  final String? language;
  final String? smallCoverImage;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final List<TorrentModel> torrents;

  Movie({
    required this.id,
    required this.title,
    this.titleEnglish,
    this.year,
    required this.rating,
    this.runtime,
    this.summary,
    this.genres = const [],
    this.language,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.torrents = const [],
  });
}