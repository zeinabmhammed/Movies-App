abstract class HistoryLocalDataSource {

  Future<void> addToHistory(Map<String, dynamic> json);

  Future<List<Map<String, dynamic>>> getHistory();
}