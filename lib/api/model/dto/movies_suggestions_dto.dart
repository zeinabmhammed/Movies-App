import 'package:movies_app/domain/models/movie_suggestion.dart';

import '../response/MoviesDetailsResponse/MoviesSuggestionsResponse/torrents.dart';

/// id : 664
/// url : "https://yts.lt/movies/chaos-2005?iHF5EgpmmInE27UzJE4yeJgkcIU50Drv19ozjKTJ"
/// imdb_code : "tt0402910"
/// title : "Chaos"
/// title_english : "Chaos"
/// title_long : "Chaos (2005)"
/// slug : "chaos-2005"
/// year : 2005
/// rating : 6.4
/// runtime : 106
/// genres : ["Action","Crime","Drama","Thriller"]
/// summary : "In Seattle, detective Quentin Conners is unfairly suspended and his partner Jason York leaves the police force after a tragic shooting on Pearl Street Bridge, when the hostage and the criminal die. During a bank heist with a hostage situation, Conners is assigned in charge of the operation with the rookie Shane Dekker as his partner. The thieves, lead by Lorenz, apparently do not steal a penny from the bank. While chasing the gangsters, the police team disclose that they planted a virus in the system, stealing one billion dollars from the different accounts, using the principle of the Chaos Theory. Further, they find that Lorenz is killing his accomplices.—Claudio Carvalho, Rio de Janeiro, Brazil"
/// description_full : "In Seattle, detective Quentin Conners is unfairly suspended and his partner Jason York leaves the police force after a tragic shooting on Pearl Street Bridge, when the hostage and the criminal die. During a bank heist with a hostage situation, Conners is assigned in charge of the operation with the rookie Shane Dekker as his partner. The thieves, lead by Lorenz, apparently do not steal a penny from the bank. While chasing the gangsters, the police team disclose that they planted a virus in the system, stealing one billion dollars from the different accounts, using the principle of the Chaos Theory. Further, they find that Lorenz is killing his accomplices.—Claudio Carvalho, Rio de Janeiro, Brazil"
/// synopsis : "In Seattle, detective Quentin Conners is unfairly suspended and his partner Jason York leaves the police force after a tragic shooting on Pearl Street Bridge, when the hostage and the criminal die. During a bank heist with a hostage situation, Conners is assigned in charge of the operation with the rookie Shane Dekker as his partner. The thieves, lead by Lorenz, apparently do not steal a penny from the bank. While chasing the gangsters, the police team disclose that they planted a virus in the system, stealing one billion dollars from the different accounts, using the principle of the Chaos Theory. Further, they find that Lorenz is killing his accomplices.—Claudio Carvalho, Rio de Janeiro, Brazil"
/// yt_trailer_code : "IzWbjvuIgAc"
/// language : "en"
/// mpa_rating : ""
/// background_image : "https://yts.lt/assets/images/movies/Chaos_2005/background.jpg"
/// background_image_original : "https://yts.lt/assets/images/movies/Chaos_2005/background.jpg"
/// small_cover_image : "https://yts.lt/assets/images/movies/Chaos_2005/small-cover.jpg"
/// medium_cover_image : "https://yts.lt/assets/images/movies/Chaos_2005/medium-cover.jpg"
/// state : "ok"
/// torrents : [{"url":"https://yts.lt/torrent/download/CDED33F7FBF3E4E073778848FAD17674C0A35B82?iHF5EgpmmInE27UzJE4yeJgkcIU50Drv19ozjKTJ","hash":"CDED33F7FBF3E4E073778848FAD17674C0A35B82","quality":"720p","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"2.0","seeds":11,"peers":5,"size":"809.06 MB","size_bytes":848360899,"date_uploaded":"2015-10-31 22:22:51","date_uploaded_unix":1446326571},{"url":"https://yts.lt/torrent/download/7569B45EA7F070575F44874F9BE259D4549FC50B?iHF5EgpmmInE27UzJE4yeJgkcIU50Drv19ozjKTJ","hash":"7569B45EA7F070575F44874F9BE259D4549FC50B","quality":"1080p","is_repack":"0","video_codec":"x264","bit_depth":"8","audio_channels":"5.1","seeds":14,"peers":2,"size":"1.96 GB","size_bytes":2104533975,"date_uploaded":"2022-05-07 14:38:18","date_uploaded_unix":1651927098}]
/// date_uploaded : "2015-10-31 22:22:51"
/// date_uploaded_unix : 1446326571
class MoviesSuggestionsDto {
  MoviesSuggestionsDto({
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
    required this.summary,
    required this.descriptionFull,
    required this.synopsis,
    required this.ytTrailerCode,
    required this.language,
    required this.mpaRating,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.state,
    required this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  MoviesSuggestionsDto.fromJson(dynamic json)
    : id = json['id'] ?? 0,
      url = json['url'] ?? '',
      imdbCode = json['imdb_code'] ?? '',
      title = json['title'] ?? '',
      titleEnglish = json['title_english'] ?? '',
      titleLong = json['title_long'] ?? '',
      slug = json['slug'] ?? '',
      year = (json['year'] is num)
          ? (json['year'] as num).toInt()
          : int.tryParse('${json['year']}') ?? 0,
      rating = (json['rating'] != null)
          ? (json['rating'] as num).toDouble()
          : 0.0,
      runtime = (json['runtime'] is num)
          ? (json['runtime'] as num).toInt()
          : int.tryParse('${json['runtime']}') ?? 0,
      genres = (json['genres'] != null)
          ? List<String>.from(json['genres'])
          : <String>[],
      summary = json['summary'] ?? '',
      descriptionFull = json['description_full'] ?? '',
      synopsis = json['synopsis'] ?? '',
      ytTrailerCode = json['yt_trailer_code'] ?? '',
      language = json['language'] ?? '',
      mpaRating = json['mpa_rating'] ?? '',
      backgroundImage = json['background_image'] ?? '',
      backgroundImageOriginal = json['background_image_original'] ?? '',
      smallCoverImage = json['small_cover_image'] ?? '',
      mediumCoverImage = json['medium_cover_image'] ?? '',
      state = json['state'] ?? '',
      torrents = (json['torrents'] != null && json['torrents'] is List)
          ? (json['torrents'] as List).map((v) => Torrents.fromJson(v)).toList()
          : <Torrents>[],
      dateUploaded = json['date_uploaded'],
      dateUploadedUnix = json['date_uploaded_unix'];

  int id;
  String url;
  String imdbCode;
  String title;
  String titleEnglish;
  String titleLong;
  String slug;
  int year;
  double rating;
  int runtime;
  List<String> genres;
  String summary;
  String descriptionFull;
  String synopsis;
  String ytTrailerCode;
  String language;
  String mpaRating;
  String backgroundImage;
  String backgroundImageOriginal;
  String smallCoverImage;
  String mediumCoverImage;
  String state;
  List<Torrents> torrents;
  String? dateUploaded;
  num? dateUploadedUnix;

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
    map['state'] = state;
    // تضيف torrents إن وُجِدَت
    map['torrents'] = torrents.map((t) => t.toJson()).toList();
    map['date_uploaded'] = dateUploaded;
    map['date_uploaded_unix'] = dateUploadedUnix;
    return map;
  }

  // اسم الدالة خليته مفرد وواضح: toMovieSuggestion
  MovieSuggestion toMovieSuggestion() {
    return MovieSuggestion(
      id: id,
      url: url,
      imdbCode: imdbCode,
      title: title,
      titleLong: titleLong,
      slug: slug,
      year: year,
      rating: rating,
      runtime: runtime,
      genres: genres,
      descriptionFull: descriptionFull,
      synopsis: synopsis,
      ytTrailerCode: ytTrailerCode,
      language: language,
      mpaRating: mpaRating,
      backgroundImage: backgroundImage,
      backgroundImageOriginal: backgroundImageOriginal,
      smallCoverImage: smallCoverImage,
      mediumCoverImage: mediumCoverImage,
      state: state,
      torrents: torrents,
    );
  }
}
