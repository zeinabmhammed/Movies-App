String buildMagnetUrl({required String hash, required String movieTitle, List<String>? trackers}) {
  final encodedTitle = Uri.encodeComponent(movieTitle);
  final defaultTrackers = [
    'udp://open.demonii.com:1337/announce',
    'udp://tracker.openbittorrent.com:80',
    'udp://tracker.coppersurfer.tk:6969',
    'udp://glotorrents.pw:6969/announce',
  ];

  final allTrackers = (trackers ?? []) + defaultTrackers;
  final trParams = allTrackers.map((t) => '&tr=$t').join();
  return 'magnet:?xt=urn:btih:$hash&dn=$encodedTitle$trParams';
}