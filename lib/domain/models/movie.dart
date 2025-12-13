import '../../api/model/response/MoviesResponse/torrents.dart';

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
  final List<Torrents>? torrents;

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

class TorrentModel {
  final String? url;
  final String? hash;
  final String? quality;
  final String? type;
  final String? size;
  final int? seeds;
  final int? peers;

  TorrentModel({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.size,
    this.seeds,
    this.peers,
  });
}
