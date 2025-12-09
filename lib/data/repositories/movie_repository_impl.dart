import 'package:movies_app/data/models/Movie_dto.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movies_remote_ds.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MoviesRemoteDataSource remoteDS;

  MovieRepositoryImpl(this.remoteDS);

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final res = await remoteDS.searchMovie(query);
    final movieModels = res.data?.movies;

    if (movieModels == null) {
      return [];
    }

    return movieModels.map((model) => model.toMovieEntity()).toList();
  }

  @override
  Future<(List<Movie>, Set<String>)> browseMovies({String? genre, int page = 1}) async {
    final res = await remoteDS.browseMovies(genre: genre, page: page);
    final movieModels = res.data?.movies ?? [];
    final movies = movieModels.map((model) => model.toMovieEntity()).toList();
    final genres = <String>{};

    for (var movie in movieModels) {
      if (movie.genres != null) {
        genres.addAll(movie.genres!);
      }
    }
    return (movies, genres);
  }
}
