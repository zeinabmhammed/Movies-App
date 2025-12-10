import '../../api/model/response/MoviesDetailsResponse/MoviesSuggestionsResponse/torrents.dart';

class MovieSuggestion {
  final int id;
  final String url;
  final String imdbCode;
  final String title;
  final String titleLong;
  final String slug;
  final int year;
  final String state;
  final double rating;
  final int runtime;
  final List<String> genres;
  final String descriptionFull;
  final String synopsis;
  final String ytTrailerCode;
  final String language;
  final String mpaRating;
  final String backgroundImage;
  final String backgroundImageOriginal;
  final String smallCoverImage;
  final String mediumCoverImage;
  final List<Torrents> torrents;

  MovieSuggestion({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.state,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.descriptionFull,
    required this.synopsis,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.torrents,
  });
}
