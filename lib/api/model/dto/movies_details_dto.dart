import 'package:movies_app/domain/models/movie_details.dart';
/// id : 15
/// url : "https://yts.lt/movies/16-blocks-2006?mn9cmZMN0SNlbeInYydPQ7_9A_6qjXQ8VvC0t816"
/// imdb_code : "tt0450232"
/// title : "16 Blocks"
/// title_english : "16 Blocks"
/// title_long : "16 Blocks (2006)"
/// slug : "16-blocks-2006"
/// year : 2006
/// rating : 6.6
/// runtime : 102
/// genres : ["Action","Crime","Drama","Thriller"]
/// like_count : 54
/// description_intro : "\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294"
/// description_full : "\"All they had to do was get across town.\" For aging NYPD detective Jack Mosley, this should've been his last assignment before a well-deserved retirement. The job was simple: transport Edward \"Eddie\" Bunker, a reluctant African-American witness, all the way to the New York State Supreme Court Building 16 blocks from the police department. Until it wasn't. Now Jack and Eddie are on the run from a group of corrupt and dirty cops, led by officer Frank Nugent, who will do anything in their power to stop them from reaching the Supreme Court. It's a race against time that may cost Jack everything he's devoted his job to.—jesusblack-91294"
/// yt_trailer_code : "55nKvGV0APA"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.lt/assets/images/movies/16_Blocks_2006/background.jpg"
/// background_image_original : "https://yts.lt/assets/images/movies/16_Blocks_2006/background.jpg"
/// small_cover_image : "https://yts.lt/assets/images/movies/16_Blocks_2006/small-cover.jpg"
/// medium_cover_image : "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-cover.jpg"
/// large_cover_image : "https://yts.lt/assets/images/movies/16_Blocks_2006/large-cover.jpg"
/// medium_screenshot_image1 : "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot1.jpg"
/// medium_screenshot_image2 : "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot2.jpg"
/// medium_screenshot_image3 : "https://yts.lt/assets/images/movies/16_Blocks_2006/medium-screenshot3.jpg"
/// large_screenshot_image1 : "https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot1.jpg"
/// large_screenshot_image2 : "https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot2.jpg"
/// large_screenshot_image3 : "https://yts.lt/assets/images/movies/16_Blocks_2006/large-screenshot3.jpg"
/// cast : [{"name":"Tom Wlaschiha","character_name":"Bus Passenger","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0937239.jpg","imdb_code":"0937239"},{"name":"Bruce Willis","character_name":"Det. Jack Mosley","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0000246.jpg","imdb_code":"0000246"},{"name":"David Zayas","character_name":"Det. Robert Torres","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0953882.jpg","imdb_code":"0953882"},{"name":"Tig Fong","character_name":"Briggs","url_small_image":"https://yts.lt/assets/images/actors/thumb/nm0284609.jpg","imdb_code":"0284609"}]
/// torrents : [{"url":"https://yts.lt/torrent/download/8619B57A3F39F1B49A1A698EA5400A883928C0A2?mn9cmZMN0SNlbeInYydPQ7_9A_6qjXQ8VvC0t816","hash":"8619B57A3F39F1B49A1A698EA5400A883928C0A2","quality":"720p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":3,"peers":2,"size":"702.04 MB","size_bytes":736142295,"date_uploaded":"2015-10-31 20:47:35","date_uploaded_unix":1446320855},{"url":"https://yts.lt/torrent/download/2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6?mn9cmZMN0SNlbeInYydPQ7_9A_6qjXQ8VvC0t816","hash":"2A4B9A41C92A20A06C8846E66AD9B5BC4B669BC6","quality":"1080p","type":"bluray","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":25,"peers":0,"size":"1.40 GB","size_bytes":1503238554,"date_uploaded":"2015-10-31 20:47:38","date_uploaded_unix":1446320858}]
/// date_uploaded : "2015-10-31 20:47:35"
/// date_uploaded_unix : 1446320855
class MoviesDetailsDto {
  MoviesDetailsDto({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.descriptionIntro,
    required this.descriptionFull,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.mediumScreenshotImage1,
    required this.mediumScreenshotImage2,
    required this.mediumScreenshotImage3,
    required this.largeScreenshotImage1,
    required this.largeScreenshotImage2,
    required this.largeScreenshotImage3,
    required this.cast,
    required this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
    this.userRating,
    this.watchLaterCount,
    required this.summary,
  });

  // make fields final for immutability
  final int id;
  final String url;
  final String imdbCode;
  final String title;
  final String titleEnglish;
  final String titleLong;
  final String slug;
  final int year;
  final String summary;
  final double rating;
  final int runtime;
  final List<String> genres;
  final int likeCount;
  final String descriptionIntro;
  final String descriptionFull;
  final String ytTrailerCode;
  final String language;
  final String mpaRating;
  final String backgroundImage;
  final String backgroundImageOriginal;
  final String smallCoverImage;
  final String mediumCoverImage;
  final String largeCoverImage;
  final String mediumScreenshotImage1;
  final String mediumScreenshotImage2;
  final String mediumScreenshotImage3;
  final String largeScreenshotImage1;
  final String largeScreenshotImage2;
  final String largeScreenshotImage3;
  final List<CastDto> cast;
  final List<TorrentDto> torrents;
  final String? dateUploaded;
  final num? dateUploadedUnix;
  final double? userRating;
  final double? watchLaterCount;


  factory MoviesDetailsDto.fromJson(Map<String, dynamic> json) {
    int _toInt(dynamic v, [int defaultValue = 0]) {
      if (v == null) return defaultValue;
      if (v is int) return v;
      if (v is double) return v.toInt();
      if (v is String) return int.tryParse(v) ?? defaultValue;
      return defaultValue;
    }

    double _toDouble(dynamic v, [double defaultValue = 0.0]) {
      if (v == null) return defaultValue;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      if (v is String) return double.tryParse(v) ?? defaultValue;
      return defaultValue;
    }

    List<String> _toStringList(dynamic v) {
      if (v == null) return <String>[];
      if (v is List) {
        return v.where((e) => e != null).map((e) => e.toString()).toList();
      }
      return <String>[];
    }

    List<CastDto> _parseCast(dynamic v) {
      if (v == null) return <CastDto>[];
      if (v is List) {
        return v.map((e) {
          if (e is Map) return CastDto.fromJson(Map<String, dynamic>.from(e));
          return CastDto.fromJson(<String, dynamic>{});
        }).toList();
      }
      return <CastDto>[];
    }

    List<TorrentDto> _parseTorrents(dynamic v) {
      if (v == null) return <TorrentDto>[];
      if (v is List) {
        return v.map((e) {
          if (e is Map) return TorrentDto.fromJson(Map<String, dynamic>.from(e));
          return TorrentDto.fromJson(<String, dynamic>{});
        }).toList();
      }
      return <TorrentDto>[];
    }

    return MoviesDetailsDto(
      id: _toInt(json['id']),
      url: json['url']?.toString() ?? '',
      imdbCode: json['imdb_code']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      titleEnglish: json['title_english']?.toString() ?? '',
      titleLong: json['title_long']?.toString() ?? '',
      slug: json['slug']?.toString() ?? '',
      year: _toInt(json['year']),
      rating: _toDouble(json['rating']),
      runtime: _toInt(json['runtime']),
      genres: _toStringList(json['genres']),
      likeCount: _toInt(json['like_count'], 0),
      descriptionIntro: json['description_intro']?.toString() ?? '',
      summary: json['summary']?.toString() ?? '',
      descriptionFull: json['description_full']?.toString() ?? '',
      ytTrailerCode: json['yt_trailer_code']?.toString() ?? '',
      language: json['language']?.toString() ?? '',
      mpaRating: json['mpa_rating']?.toString() ?? '',
      backgroundImage: json['background_image']?.toString() ?? '',
      backgroundImageOriginal: json['background_image_original']?.toString() ?? '',
      smallCoverImage: json['small_cover_image']?.toString() ?? '',
      mediumCoverImage: json['medium_cover_image']?.toString() ?? '',
      largeCoverImage: json['large_cover_image']?.toString() ?? '',
      mediumScreenshotImage1: json['medium_screenshot_image1']?.toString() ?? '',
      mediumScreenshotImage2: json['medium_screenshot_image2']?.toString() ?? '',
      mediumScreenshotImage3: json['medium_screenshot_image3']?.toString() ?? '',
      largeScreenshotImage1: json['large_screenshot_image1']?.toString() ?? '',
      largeScreenshotImage2: json['large_screenshot_image2']?.toString() ?? '',
      largeScreenshotImage3: json['large_screenshot_image3']?.toString() ?? '',
      cast: _parseCast(json['cast']),
      torrents: _parseTorrents(json['torrents']),
      dateUploaded: json['date_uploaded']?.toString(),
      dateUploadedUnix: json['date_uploaded_unix'],
      userRating: json['user_rating'] != null ? _toDouble(json['user_rating']) : null,
      watchLaterCount: json['watch_later_count'] != null ? _toDouble(json['watch_later_count']) : null,
    );

  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'imdb_code': imdbCode,
      'title': title,
      'title_english': titleEnglish,
      'title_long': titleLong,
      'slug': slug,
      'year': year,
      'rating': rating,
      'runtime': runtime,
      'genres': genres,
      'like_count': likeCount,
      'description_intro': descriptionIntro,
      'description_full': descriptionFull,
      'yt_trailer_code': ytTrailerCode,
      'language': language,
      'mpa_rating': mpaRating,
      'background_image': backgroundImage,
      'background_image_original': backgroundImageOriginal,
      'small_cover_image': smallCoverImage,
      'medium_cover_image': mediumCoverImage,
      'large_cover_image': largeCoverImage,
      'medium_screenshot_image1': mediumScreenshotImage1,
      'medium_screenshot_image2': mediumScreenshotImage2,
      'medium_screenshot_image3': mediumScreenshotImage3,
      'large_screenshot_image1': largeScreenshotImage1,
      'large_screenshot_image2': largeScreenshotImage2,
      'large_screenshot_image3': largeScreenshotImage3,
      'cast': cast.map((c) => c.toJson()).toList(),
      'torrents': torrents.map((t) => t.toJson()).toList(),
      'date_uploaded': dateUploaded,
      'date_uploaded_unix': dateUploadedUnix,
      'user_rating': userRating,
      'watch_later_count': watchLaterCount,
    };

  }

  /// تحويل من DTO ל־Domain MovieDetails שלך
  MovieDetails toMovieDetails() {
    // Helper to build screenshots array from available screenshot fields
    List<String> _collectScreenshots() {
      final list = <String>[];
      if (largeScreenshotImage1.isNotEmpty) list.add(largeScreenshotImage1);
      if (largeScreenshotImage2.isNotEmpty) list.add(largeScreenshotImage2);
      if (largeScreenshotImage3.isNotEmpty) list.add(largeScreenshotImage3);
      return list;
    }

    List<CastEntity> mapCast(List<CastDto> cast) {
      return cast.map((c) {
        return CastEntity(
          name: c.name,
          character: c.characterName,
          imageUrl: c.urlSmallImage ?? '',
        );
      }).toList();
    }

    List<Torrent> mapTorrents() {
      return torrents.map((t) {
        return Torrent(
          url: t.url,
          hash: t.hash ?? '',
          quality: t.quality,
          type: t.type,
        );
      }).toList();
    }

    return MovieDetails(
      id: id,
      url: url,
      imdbCode: imdbCode,
      title: title,
      titleEnglish: titleEnglish,
      slug: slug,
      year: year,
      rating: rating,
      runtime: runtime,
      genres: List<String>.from(genres),
      likeCount: likeCount,
      descriptionIntro: descriptionIntro,
      descriptionFull: descriptionFull.isNotEmpty
          ? descriptionFull
          : summary,
      summary: summary.isNotEmpty ? summary : descriptionIntro,
      ytTrailerCode: ytTrailerCode,
      userRating: userRating ?? 0.0,
      watchLaterCount: watchLaterCount ?? 0.0,
      language: language,
      mpaRating: mpaRating,
      smallCoverImage: smallCoverImage,
      mediumCoverImage: mediumCoverImage,
      largeCoverImage: largeCoverImage,
      cast: mapCast(cast),
      screenshots: _collectScreenshots(),
      torrents: mapTorrents(),
    );
  }
}

/// --- DTO helpers used above ---
/// If you already have similar DTO classes, keep them and adapt; otherwise use these.

class CastDto {
  CastDto({
    required this.name,
    required this.characterName,
    this.urlSmallImage,
    this.imdbCode,
  });

  factory CastDto.fromJson(Map<String, dynamic> json) {
    return CastDto(
      name: json['name']?.toString() ?? '',
      characterName: json['character_name']?.toString() ?? '',
      urlSmallImage: json['url_small_image']?.toString(),
      imdbCode: json['imdb_code']?.toString(),
    );
  }

  final String name;
  final String characterName;
  final String? urlSmallImage;
  final String? imdbCode;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'character_name': characterName,
      'url_small_image': urlSmallImage,
      'imdb_code': imdbCode,
    };
  }
}

class TorrentDto {
  TorrentDto({
    required this.url,
    this.hash,
    required this.quality,
    required this.type,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.dateUploaded,
  });

  factory TorrentDto.fromJson(Map<String, dynamic> json) {
    return TorrentDto(
      url: json['url']?.toString() ?? '',
      hash: json['hash']?.toString(),
      // may be present in some APIs
      quality: json['quality']?.toString() ?? '',
      type: json['type']?.toString() ?? '',
      seeds: json['seeds'] is int
          ? json['seeds']
          : int.tryParse('${json['seeds']}') ?? 0,
      peers: json['peers'] is int
          ? json['peers']
          : int.tryParse('${json['peers']}') ?? 0,
      size: json['size']?.toString() ?? '',
      dateUploaded: json['date_uploaded']?.toString() ?? '',
    );
  }

  final String url;
  final String? hash;
  final String quality;
  final String type;
  final int seeds;
  final int peers;
  final String size;
  final String dateUploaded;

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'hash': hash,
      'quality': quality,
      'type': type,
      'seeds': seeds,
      'peers': peers,
      'size': size,
      'date_uploaded': dateUploaded,
    };
  }
}