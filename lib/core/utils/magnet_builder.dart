String buildMagnetUrl({required String hash, required String movieTitle, List<String>? trackers}) {
  final encodedTitle = Uri.encodeComponent(movieTitle);

  final defaultTrackers = [
    'udp://glotorrents.pw:6969/announce',
    'udp://tracker.opentrackr.org:1337/announce',
    'udp://torrent.gresille.org:80/announce',
    'udp://tracker.openbittorrent.com:80',
    'udp://tracker.coppersurfer.tk:6969',
    'udp://tracker.leechers-paradise.org:6969',
    'udp://p4p.arenabg.ch:1337',
    'udp://tracker.internetwarriors.net:1337',
  ];

  final allTrackers = (trackers ?? []) + defaultTrackers;
  final trParams = allTrackers.map((t) => '&tr=$t').join();

  return 'magnet:?xt=urn:btih:$hash&dn=$encodedTitle$trParams';
}