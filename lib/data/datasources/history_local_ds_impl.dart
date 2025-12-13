import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'history_local_ds.dart';

class HistoryLocalDataSourceImpl extends HistoryLocalDataSource {

  @override
  Future<void> addToHistory(Map<String, dynamic> json) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('history') ?? [];

    list.add(jsonEncode(json));
    await prefs.setStringList('history', list);
  }

  @override
  Future<List<Map<String, dynamic>>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('history') ?? [];

    return list.map((e) => jsonDecode(e) as Map<String, dynamic>).toList();
  }
}