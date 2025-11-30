import 'package:movies_app/api/models/movie_dto.dart';
import 'package:movies_app/api/models/torrent_dto.dart';
import 'package:movies_app/domain/models/movie.dart';
import 'package:movies_app/domain/models/torrent_model.dart';

extension TorrentDtoMapper on TorrentDto {
  TorrentModel toDomain() {
    return TorrentModel(
      hash: hash,
      quality: quality,
      type: type,
      size: size,
    );
  }
}

extension MovieDtoMapper on MovieDto {
  Movie toDomain() {
    return Movie(
      id: id,
      title: title,
      year: year,
      rating: rating,
      genres: genres,
      summary: summary,
      mediumCoverImage: mediumCoverImage,
      torrents: torrents.map((t) => t.toDomain()).toList(),
    );
  }
}
