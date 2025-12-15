import 'package:shared_preferences/shared_preferences.dart';

class ClearHistory {
  Future<void> clearHistory() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('history');
  }
}