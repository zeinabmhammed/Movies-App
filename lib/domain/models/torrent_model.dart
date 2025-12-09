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
