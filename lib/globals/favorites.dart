import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

// A set of favorite items, each with course and department info
Set<Map<String, String>> favoriteCourses = {};

// 🔁 Save favorites to local storage
Future<void> saveFavorites() async {
  final prefs = await SharedPreferences.getInstance();

  // Convert set to list of JSON strings
  List<String> encoded = favoriteCourses
      .map((item) => jsonEncode(item))
      .toList();

  await prefs.setStringList('favorite_courses', encoded);
}

// 🔁 Load favorites from local storage
Future<void> loadFavorites() async {
  final prefs = await SharedPreferences.getInstance();

  final List<String>? encoded = prefs.getStringList('favorite_courses');

  if (encoded != null) {
    favoriteCourses = encoded
        .map((item) => Map<String, String>.from(jsonDecode(item)))
        .toSet();
  }
}

// 🔄 Helper: check if a course is already favorited
bool isCourseFavorite(String department, String course) {
  return favoriteCourses.any((item) =>
      item['department'] == department && item['course'] == course);
}

// ✅ Helper: toggle favorite status
void toggleFavorite(String department, String course) {
  final item = {'department': department, 'course': course};

  if (favoriteCourses.any((i) =>
      i['department'] == department && i['course'] == course)) {
    favoriteCourses.removeWhere((i) =>
        i['department'] == department && i['course'] == course);
  } else {
    favoriteCourses.add(item);
  }

  saveFavorites(); // persist change
}
