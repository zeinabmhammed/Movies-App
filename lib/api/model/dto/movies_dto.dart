import 'package:movies_app/domain/models/movie.dart';
import '../response/MoviesResponse/torrents.dart';

/// id : 72929
/// url : "https://yts.lt/movies/predators-2025?5MT_EMu4leQq1IhspN6HoNF8UXGO0b60YSnZBtol"
/// imdb_code : "tt34963732"
/// title : "Predators"
/// title_english : "Predators"
/// title_long : "Predators (2025)"
/// slug : "predators-2025"
/// year : 2025
/// rating : 7.4
/// runtime : 96
/// genres : ["Crime","Documentary","Thriller"]
/// summary : ""
/// description_full : ""
/// synopsis : ""
/// yt_trailer_code : "-fx52wd1QYI"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.lt/assets/images/movies/predators_2025/background.jpg"
/// background_image_original : "https://yts.lt/assets/images/movies/predators_2025/background.jpg"
/// small_cover_image : "https://yts.lt/assets/images/movies/predators_2025/small-cover.jpg"
/// medium_cover_image : "https://yts.lt/assets/images/movies/predators_2025/medium-cover.jpg"
/// large_cover_image : "https://yts.lt/assets/images/movies/predators_2025/large-cover.jpg"
/// state : "ok"
/// torrents : [{"url":"https://yts.lt/torrent/download/38E62D0DE6BB458F9CEF86061ECCBCC1E3F23D81?5MT_EMu4leQq1IhspN6HoNF8UXGO0b60YSnZBtol","hash":"38E62D0DE6BB458F9CEF86061ECCBCC1E3F23D81","quality":"720p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":0,"peers":0,"size":"899.03 MB","size_bytes":942701281,"date_uploaded":"2025-12-08 13:40:44","date_uploaded_unix":1765197644},{"url":"https://yts.lt/torrent/download/939A8A93B76C55C1BEDBC775584B89AE7231D321?5MT_EMu4leQq1IhspN6HoNF8UXGO0b60YSnZBtol","hash":"939A8A93B76C55C1BEDBC775584B89AE7231D321","quality":"1080p","type":"web","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":0,"peers":0,"size":"1.8 GB","size_bytes":1932735283,"date_uploaded":"2025-12-08 14:29:54","date_uploaded_unix":1765200594}]
/// date_uploaded : "2025-12-08 13:40:44"
/// date_uploaded_unix : 1765197644

class MoviesDto {
  MoviesDto({
    required this.id,
    this.url,
    this.imdbCode,
    required this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    required this.rating,
    this.runtime,
    required this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.largeCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  /// Factory آمن من JSON — يضمن تهيئة الحقول المطلوبة
  factory MoviesDto.fromJson(Map<String, dynamic> json) {
    double parseDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      return double.tryParse('$v') ?? 0.0;
    }

    int? parseInt(dynamic v) {
      if (v == null) return null;
      if (v is int) return v;
      return int.tryParse('$v');
    }

    List<String> parseGenres(dynamic g) {
      if (g == null) return <String>[];
      if (g is List) return g.map((e) => e.toString()).toList();
      return <String>[];
    }

    List<Torrents>? parseTorrents(dynamic t) {
      if (t == null) return <Torrents>[];
      if (t is List) {
        return t.map((e) {
          // نفترض أن Torrents.fromJson يقبل Map<String, dynamic>
          try {
            return Torrents.fromJson(Map<String, dynamic>.from(e));
          } catch (_) {
            return Torrents(); // إذا كلاس Torrents له كونستركتور افتراضي — عدّلي لو مختلف
          }
        }).toList();
      }
      return <Torrents>[];
    }

    return MoviesDto(
      id: json['id'] as int? ?? 0,
      url: json['url'] as String?,
      imdbCode: json['imdb_code'] as String?,
      title: json['title'] as String? ?? '',
      titleEnglish: json['title_english'] as String?,
      titleLong: json['title_long'] as String?,
      slug: json['slug'] as String?,
      year: parseInt(json['year']),
      rating: parseDouble(json['rating']),
      runtime: parseInt(json['runtime']),
      genres: parseGenres(json['genres']),
      summary: json['summary'] as String?,
      descriptionFull: json['description_full'] as String?,
      synopsis: json['synopsis'] as String?,
      ytTrailerCode: json['yt_trailer_code'] as String?,
      language: json['language'] as String?,
      mpaRating: json['mpa_rating'] as String?,
      backgroundImage: json['background_image'] as String?,
      backgroundImageOriginal: json['background_image_original'] as String?,
      smallCoverImage: json['small_cover_image'] as String?,
      mediumCoverImage: json['medium_cover_image'] as String?,
      largeCoverImage: json['large_cover_image'] as String?,
      state: json['state'] as String?,
      torrents: parseTorrents(json['torrents']),
      dateUploaded: json['date_uploaded'] as String?,
      dateUploadedUnix: (json['date_uploaded_unix'] is num)
          ? json['date_uploaded_unix'] as num
          : (num.tryParse('${json['date_uploaded_unix']}') ?? 0),
    );
  }

  final int id;
  final String? url;
  final String? imdbCode;
  final String title;
  final String? titleEnglish;
  final String? titleLong;
  final String? slug;
  final int? year;
  final double rating;
  final int? runtime;
  final List<String> genres;
  final String? summary;
  final String? descriptionFull;
  final String? synopsis;
  final String? ytTrailerCode;
  final String? language;
  final String? mpaRating;
  final String? backgroundImage;
  final String? backgroundImageOriginal;
  final String? smallCoverImage;
  final String? mediumCoverImage;
  final String? largeCoverImage;
  final String? state;
  final List<Torrents>? torrents;
  final String? dateUploaded;
  final num? dateUploadedUnix;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imdb_code'] = imdbCode;
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_long'] = titleLong;
    map['slug'] = slug;
    map['year'] = year;
    map['rating'] = rating;
    map['runtime'] = runtime;
    map['genres'] = genres;
    map['summary'] = summary;
    map['description_full'] = descriptionFull;
    map['synopsis'] = synopsis;
    map['yt_trailer_code'] = ytTrailerCode;
    map['language'] = language;
    map['mpa_rating'] = mpaRating;
    map['background_image'] = backgroundImage;
    map['background_image_original'] = backgroundImageOriginal;
    map['small_cover_image'] = smallCoverImage;
    map['medium_cover_image'] = mediumCoverImage;
    map['large_cover_image'] = largeCoverImage;
    map['state'] = state;
    map['torrents'] = torrents?.map((t) => t.toJson()).toList();
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

  /// تحويل لـ domain model (Movie)
  Movie toMovie() {
    return Movie(
      id: id,
      title: title,
      titleEnglish: titleEnglish,
      year: year,
      rating: rating,
      runtime: runtime,
      summary: summary,
      genres: genres,
      language: language,
      smallCoverImage: smallCoverImage,
      mediumCoverImage: mediumCoverImage,
      largeCoverImage: largeCoverImage,
      torrents: torrents ?? <Torrents>[],
    );
  }
}
