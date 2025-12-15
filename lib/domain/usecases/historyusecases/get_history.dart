import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/Movie_dto.dart';
import '../../entities/movie.dart';
import '../../repositories/history_repository.dart';

class GetHistoryUseCase {
  final HistoryRepository repository;

  GetHistoryUseCase(this.repository);

  Future<List<Movie>> call() async{
    final prefs = await SharedPreferences.getInstance();

    final List<String> historyList = prefs.getStringList('history') ?? [];

    return historyList.map((movieString){
      final json = jsonDecode(movieString);
      final dto = MovieDto.fromJson(json);
      return dto.toMovieEntity();
    }).toList();

  }
}