import '../entities/movie.dart';

class MovieDetails {
  final int id;
  final String url;
  final String imdbCode;
  final String title;
  final String titleEnglish;
  final String slug;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final int likeCount;
  final String descriptionIntro;
  final String descriptionFull;
  final String ytTrailerCode;
  final double userRating;
  final double watchLaterCount;
  final String language;
  final String mpaRating;
  final String smallCoverImage;
  final String mediumCoverImage;
  final String largeCoverImage;
  final List<CastEntity> cast;
  final List<String> screenshots;
  final String summary;
  final List<Torrent> torrents;

  MovieDetails( {
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.descriptionFull,
    required this.userRating,
    required this.watchLaterCount,
    required this.language,
    required this.mpaRating,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.cast,
    required this.screenshots,
    required this.summary,
    required this.torrents,
     required this.descriptionIntro,
     required this.ytTrailerCode,
  });
}
class CastEntity {
  final String name;
  final String character;
  final String imageUrl;

  CastEntity({
    required this.name,
    required this.character,
    required this.imageUrl,
  });
}

class Torrent {
  final String url;
  final String hash;
  final String quality;
  final String type;

  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
  });
}

extension MovieDetailsMapper on MovieDetails {
  Movie toMovie() {
    return Movie(
      id: id,
      title: title,
      year: year,
      rating: rating,
      posterPath: largeCoverImage, // أنسب صورة للـ WatchList
      genres: genres,
    );
  }
}