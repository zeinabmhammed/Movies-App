import 'package:movies_app/data/datasources/watchList_local_ds.dart';
import '../../core/network/api_manager.dart';
import '../../domain/entities/movie.dart';

class WatchListRemoteDataSourceImpl implements WatchListRemoteDataSource {
  final ApiManager api;

  WatchListRemoteDataSourceImpl(this.api);

  @override
  Future<void> addToWatchList(Movie movie) async {
    try {
      await api.addFavoriteMovie(
        movie.id,
        movie.title,
        movie.rating,
        movie.posterPath,
        movie.year,
      );
    } catch (e) {
      throw Exception("Failed to add movie to watch list: $e");
    }
  }

  @override
  Future<void> removeFromWatchList(Movie movie) async {
    try{
      await api.deleteFavoriteMovie(movie.id);
    }catch(e){
      throw Exception("Failed to remove movie from watch list: $e");
    }
  }

  @override
  Future<List<Movie>> getWatchList() async {
    final movies = await api.getFavoriteMovies();
    return movies;
  }
}
