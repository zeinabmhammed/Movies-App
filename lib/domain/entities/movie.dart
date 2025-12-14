class Movie {
  final int id;
  final String title;
  final int year;
  final double rating;
  final String posterPath;
  final List<String> genres;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.posterPath,
    required this.genres,
  });
}
