
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static const String _subjectsKey = 'test_master_subjects_v1';
  static const String _resultsKey = 'test_master_results_v1';

  // Fanlarni yuklash
  Future<List<Map<String, dynamic>>> loadSubjects() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_subjectsKey);

    if (raw == null || raw.isEmpty) return [];

    final decoded = jsonDecode(raw) as List;

    return decoded
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  // Fanlarni doimiy saqlash
  Future<void> saveSubjects(
    List<Map<String, dynamic>> subjects,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _subjectsKey,
      jsonEncode(subjects),
    );
  }

  // Test natijalarini yuklash
  Future<List<Map<String, dynamic>>> loadResults() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_resultsKey);

    if (raw == null || raw.isEmpty) return [];

    final decoded = jsonDecode(raw) as List;

    return decoded
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  // Yangi natijani saqlash
  Future<void> saveResult(
    Map<String, dynamic> result,
  ) async {
    final results = await loadResults();

    results.insert(0, result);

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      _resultsKey,
      jsonEncode(results),
    );
  }

  // Natijalarni tozalash
  Future<void> clearResults() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_resultsKey);
  }
}
