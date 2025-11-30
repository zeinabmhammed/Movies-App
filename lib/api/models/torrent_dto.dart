class TorrentDto {
  final String hash;
  final String quality;
  final String type;
  final String size;

  TorrentDto({
    required this.hash,
    required this.quality,
    required this.type,
    required this.size,
  });

  factory TorrentDto.fromJson(Map<String, dynamic> json) {
    return TorrentDto(
      hash: json['hash'] ?? '',
      quality: json['quality'] ?? '',
      type: json['type'] ?? '',
      size: json['size'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'hash': hash,
    'quality': quality,
    'type': type,
    'size': size,
  };
}
