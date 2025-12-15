import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/Movie_dto.dart';
import '../../entities/movie.dart';
import '../../repositories/history_repository.dart';

class AddToHistoryUseCase {
  final HistoryRepository repository;

  AddToHistoryUseCase(this.repository);

  Future<void> call(Movie movie) async{
    final prefs = await SharedPreferences.getInstance();

    List<String> historyList = prefs.getStringList('history') ?? [];

    final movieDto = MovieDto.fromMovieEntity(movie);
    final movieJson = jsonEncode(movieDto.toJson());

    if (!historyList.contains(movieJson)) {
      historyList.add(movieJson);
      await prefs.setStringList('history', historyList);
    }
  }
}