import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../entities/movie.dart';
import '../../repositories/history_repository.dart';

class AddToHistoryUseCase {
  final HistoryRepository repository;

  AddToHistoryUseCase(this.repository);

  Future<void> call(Movie movie) async{
    final prefs = await SharedPreferences.getInstance();

    List<String> historyList = prefs.getStringList('history') ?? [];

    final movieJson = jsonEncode({
      'id': movie.id,
      'title': movie.title,
      'posterPath': movie.posterPath,
      'year': movie.year,
    });

    if (!historyList.contains(movieJson)) {
      historyList.add(movieJson);
      await prefs.setStringList('history', historyList);
    }
  }
}